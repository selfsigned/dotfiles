# dotfiles
Compliant with 42's norm and it even comes with an install script!

## Installation
>I'm a 42 student and I don't have time to write my own config files!

You're in luck!
```sh
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
git clone https://github.com/selfsigned/dotfiles ~/.dotfiles
~/.dotfiles/install.sh --rm 42
```

>I'm a 42 student and a GNU/Linux user
```sh
git clone https://github.com/selfsigned/dotfiles ~/.dotfiles
~/.dotfiles/install.sh --rm all
```

>What the hell is 42?
```sh
git clone https://github.com/selfsigned/dotfiles ~/.dotfiles
~/.dotfiles/install.sh --rm bspwm extra
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
- [pomodoro](https://kevinschoon.github.io/pomo)
- hsetroot

## Screenshots
TODO
