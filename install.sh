#!/bin/bash

# Normally I'd do REPO=$(dirname $(readlink -f "$0"))
# but macOS doesn't have the -f flag, so
# https://stackoverflow.com/questions/3915040/bash-fish-command-to-print-absolute-path-to-a-file
full_path () {
    echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
}
REPO=$(dirname $(full_path "$0"))

# Files
BASIC=".vimrc .tmux.conf .lldbinit"
BASIC_P=".vim/undo \
        .vim/tags"

X11=".Xresources \
    .xinitrc \
    .config/compton.conf"
BSPWM=" .config/bspwm/bspwmrc \
        .config/bspwm/bspwmrcNormal \
        .config/bspwm/bspwmrcRiced \
        .config/sxhkd/sxhkdrc"
BSPWM_D=".config/bspwm \
    .config/sxhkd \
    Pictures/bg"

I3=".config/i3/config \
    .config/i3status/config"
I3_D=".config/i3 \
    .config/i3status"

EXTRA=" .newsboat/urls \
        .config/termite/config \
        .config/qutebrowser/config.py"
EXTRA_D=".newsboat \
        .config/termite \
        .config/qutebrowser\
        .tridactylrc"

make_symlink () {
    for file in $@; do
        printf "%-25.25s -> %s\n" $file ~/$file
        ln -s $REPO/$file ~/$file
    done
}

make_dir () {
    for dir in $@; do
        printf "Creating %s\n" ~/$dir/
        mkdir -p ~/$dir
    done
}

delete_files () {
    for file in $@; do
        printf "Deleting %s\n" ~/$file
        rm ~/$file
    done
}

delete_dir () {
    for dir in $@; do
        printf "Deleting %s\n" ~/$dir/
        if [ -n "$dir" ]; then
            rm -r ~/$dir
        fi
    done
}

install_basic () {
    make_symlink $BASIC
    echo "Setting up Tmux Plugin Manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/bin/install_plugins
    echo "Setting up Plug for VIM"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    make_dir $BASIC_P #vim undo dir
}

basic () {
    if [ $RM ]; then
        delete_files $BASIC
    fi
    if [ -z $CLEAN ]; then
        install_basic
    fi
}

install_bspwm () {
    make_dir $BSPWM_D
    make_symlink $X11 $BSPWM
    printf "\nDependencies: rxvt-unicode rofi pywal hsetroot redshift xscreensaver\n"
}

bspwm () {
    if [ $RM ]; then
        delete_files $X11 $BSPWM
        if [ $RMDIR ]; then
            delete_dir $BSPWM_D
        fi
    fi
    if [ -z $CLEAN ]; then
        install_bspwm
    fi
}

install_i3 () {
    sed -i 's/bspwm/i3/g' .xinitrc
    make_dir $I3_D
    make_symlink $X11 $I3
    printf "\nDependencies: urxvt rofi redshift xscreensaver\n"
}

i3 () {
    if [ $RM ]; then
        delete_files $X11 $I3
        if [ $RMDIR ]; then
            delete_dir $I3_D
        fi
    fi
    if [ -z $CLEAN ]; then
        install_i3
    fi
}

extra () {
    if [ $RM ]; then
        delete_files $EXTRA
        if [ $RMDIR ]; then
            delete_dir $EXTRA_D
        fi
    fi
    if [ -z $CLEAN ]; then
        make_dir $EXTRA_D
        make_symlink $EXTRA
    fi
}

mac () {
    echo "If you haven't already, run https://github.com/kube/42homebrew"
    brew install vim tmux # vim is outdated on MacOS (like everything else)
    basic
    echo "Now run :PlugInstall in vim"
}

usage () {
    printf "Usage: install.sh [options] selection\n
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
\n"
}

if [ $# -eq 0 ]; then
    usage
fi

for i in $@
do
case $i in
    --rm)
        RM=1
        ;;
    --rm-dir)
        RM=1
        RMDIR=1
        ;;
    --clean)
        CLEAN=1
        ;;
    42)
        mac
        ;;
    basic)
        basic
        ;;
    bspwm)
        bspwm
        ;;
    i3)
        i3
        ;;
    extra)
        extra
        ;;
    all)
        basic
        bspwm
        extra
        exit
        ;;
esac
done
