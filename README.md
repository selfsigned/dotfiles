# dotfiles
The configuration files I use on my devices, at work, or at 42.

## Screenshots
#### Work
![.assets/work.png]
#### Fun
![.assets/fun.png]

## Installation
``` sh
$ ./install.sh 
Usage: install.sh [options] selection

Options:
 --rm      delete the current files and install
 --rm-dir  delete the current files and directories and install !!WARNING: DANGEROUS!!
 --clean   delete files only, use with --rm or --rm-dir

Selection:
 42        setup for MacOS
 basic     setup vim and tmux (recommended)
 bspwm     setup bspwm configs
 i3        setup i3 configs
 extra     misc dotfiles
 all       comfy setup

$ ./install.sh all
[...]
```

## Content
#### Basic
- vimrc
- tmux.conf
#### Bspwm
Dependencies:
- rxvt-unicode
- [pywal](https://github.com/dylanaraps/pywal)
- [xbanish](https://github.com/jcs/xbanish)
- rofi
- compton
- redshift
- xscreensaver

Optional
- hsetroot
