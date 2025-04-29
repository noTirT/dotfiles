local function find_venv(start_path)
	local venv_path = start_path .. "/venv"
	if vim.fn.isdirectory(venv_path) == 1 then
		return venv_path
	end
	return nil
end
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"j-hui/fidget.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local pyright_restarted = false

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["pyright"] = function()
					lspconfig["pyright"].setup({
						capabilities = capabilities,
						on_init = function(client)
							if not pyright_restarted then
								local cwd = vim.fn.getcwd()
								local venv_path = find_venv(cwd)
								if venv_path then
									print("Venv folder found: " .. venv_path)
									vim.env.VIRTUAL_ENV = venv_path
									vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH

									pyright_restarted = true

									vim.schedule(function()
										vim.cmd("LspRestart pyright")
										print("Pyright restarted with new venv settings")
									end)
								else
									print("No venv folder found in the current directory: " .. cwd)
								end
							end
						end,
					})
				end,
				["lua_ls"] = function()
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
							},
						},
					})
				end,
				["gopls"] = function()
					lspconfig["gopls"].setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
							},
						},
					})
				end,
			})

			require("fidget").setup({})
		end,
	},
}
