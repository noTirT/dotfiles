return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters = {
					sql_sleek = {
						command = "sleek",
					},
				},
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					markdown = { "prettier" },
					yaml = { "yamlfmt" },
					sql = { "sql_sleek" },
					python = { "black" },
					cpp = { "astyle" },
					["*"] = { "trim_whitespace" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
}
