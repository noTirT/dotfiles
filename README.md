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

Then use GNU stow to create symlinks

```
$ stow .
```

## Rofi launcher

Follow install instructions [here](https://github.com/adi1090x/rofi) (recommended installation location is `/opt`)

Used settings for launcher:

- Type 1 -> Style 5 -> Color Nord

## TODO

- Add scripts for rofi stuff to the repo but dont stash them so that one can include it in the rofi theme repo once installed
