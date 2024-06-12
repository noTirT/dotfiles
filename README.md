# My Dotfiles

This repo contains the dotfiles I use on my Linux systems
Following the video [here](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Requirements

Ensure you have the following installed:

- git
- stow

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:noTirT/dotfiles.git
$ cd dotfiles
```

Follow rofi install instructions [here](https://github.com/adi1090x/rofi) (recommended installation location is `/opt`)

Then use GNU stow to create symlinks

```
$ stow --adopt .
$ git restore .
```

This replaces the standard configurations in the rofi directory

Install all the required apt packages

```
chmod +x install_packages.sh
./install_packages
```

## Misc

You can use following command to find all user-installed apt-packages

```
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```
