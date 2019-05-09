eval `keychain --noask --quiet --eval id_rsa CEE90D5B`
export GPG_TTY=$(tty)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export EDITOR=vim
export VISUAL=vim
export SWT_GTK3=0

source ~/dotfiles/bash/.promptline.sh

export HISTCONTROL=ignoredups;
# Make some commands not show up in history
export HISTIGNORE=" *:ls:cd:cd -:pwd:exit:date:* --help:* -h:pony:pony add *:pony update *:pony save *:pony ls:pony ls *";

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

source <(kubectl completion bash)

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

mkdir -p /run/user/$UID/arduino/build

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# gocd () { cd `go list -f '{{.Dir}}' $1` }

