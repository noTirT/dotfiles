# My Dotfiles

This repo contains the dotfiles I use on my Linux systems
Following the video [here](https://www.youtube.com/watch?v=y6XCebnB9gs)

## Requirements

Install all the required apt packages

```
sudo apt-get update
sudo dpkg --set-selections < required_apt_packages.txt
sudo apt-get -u dselect-upgrade
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone https://github.com/noTirT/dotfiles.git
cd dotfiles
```

Follow rofi install instructions [here](https://github.com/adi1090x/rofi) (recommended installation location is `/opt`)

Then use GNU stow to create symlinks

```
stow --adopt .
git restore .
```

This replaces the standard configurations in the rofi directory
