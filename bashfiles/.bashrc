export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTIGNORE=cd:ls:pwd:exit
export HISTSIZE=10000
export HISTFILE=~/.bash_history
export PATH=~/.nodebrew/current/bin:~/.go/bin:~/go/bin:~/.fzf/bin:~/.ghg/bin:~/ghg/bin:~/.pyenv/bin:~/.local/bin:$PATH
export LESS=-iMR

case $(uname -s) in
    Darwin) export OSTYPE=darwin;;
    Linux) export OSTYPE=linux;;
    *)     export OSTYPE=Other_OS;;
esac

if [ "$(uname -s)" = "Darwin" ]; then
    # if Mac OS
    MACHINE=$(uname -m)
    if [ "${MACHINE}" = "arm64" ]; then
        export HOMEBREW_PREFIX="/opt/homebrew"
        export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
        export HOMEBREW_REPOSITORY="/opt/homebrew"”;
        export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew";
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
        export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}";
        export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
        export HOMEBREW_OPT_DIR="${HOMEBREW_PREFIX}/opt"
    else
        export HOMEBREW_OPT_DIR="/usr/local/opt"
    fi

    PATH="${HOMEBREW_OPT_DIR}/coreutils/libexec/gnubin:$PATH"
    PATH="${HOMEBREW_OPT_DIR}/findutils/libexec/gnubin:$PATH"
    PATH="${HOMEBREW_OPT_DIR}/gnu-tar/libexec/gnubin:$PATH"
    PATH="${HOMEBREW_OPT_DIR}/gnu-sed/libexec/gnubin:$PATH"
    PATH="${HOMEBREW_OPT_DIR}/grep/libexec/gnubin:$PATH"
    PATH="${HOMEBREW_OPT_DIR}/gawk/libexec/gnubin:$PATH"

    MANPATH="${HOMEBREW_OPT_DIR}/coreutils/libexec/gnuman:$MANPATH"
    MANPATH="${HOMEBREW_OPT_DIR}/findutils/libexec/gnuman:$MANPATH"
    MANPATH="${HOMEBREW_OPT_DIR}/gnu-sed/libexec/gnuman:$MANPATH"
    MANPATH="${HOMEBREW_OPT_DIR}/gnu-tar/libexec/gnuman:$MANPATH"
    MANPATH="${HOMEBREW_OPT_DIR}/grep/libexec/gnuman:$MANPATH"
    MANPATH="${HOMEBREW_OPT_DIR}/gawk/libexec/gnuman:$MANPATH"
else
    # go
    export GOROOT=~/.go
fi

type nvim > /dev/null 2>&1
if [ $? -eq 0 ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

# go
export GOPATH=~/go

shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n$ '

# command
bash ~/.dotfiles/bashfiles/command/install.bash

# alias
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='$EDITOR'
alias vi='$EDITOR'
alias vb='$EDITOR ~/.bashrc'
alias vv='$EDITOR ~/.vimrc'

alias mkdir='mkdir -p'
alias grep='grep --color'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ps='ps --sort=start_time'

command which colordiff > /dev/null 2>&1
if [ $? -eq 0 ]; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

eval `dircolors ~/.dircolors/dircolors.256dark`

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 80% --reverse --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

# dot
export DOT_REPO="https://github.com/re3turn/dotfiles.git"
export DOT_DIR=~/.dotfiles
fpath=(~/.dot $fpath)
source ~/.dot/dot.sh

# pyenv
command which pyenv > /dev/null 2>&1
if [ $? -eq 1 ]; then
    PATH=${HOME}/.pyenv/bin:${PATH}
fi
command which pyenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    if [ "$(uname -s)" != "Darwin" ]; then
        eval "$(pyenv init -)"
    fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# source-highlight
export LESSOPEN="| ${HOME}/.dotfiles/bashfiles/command/script/source-highlight/${OSTYPE}/lesspipej.sh %s"
export LESS="-j10 -R --no-init --quit-if-one-screen"

# the fuck
eval $(thefuck --alias)

SHELL_LOCAL_DIR=~/.shell.local
mkdir -p ${SHELL_LOCAL_DIR}
ls ${SHELL_LOCAL_DIR}/*.sh >/dev/null 2>&1
if [ $? -eq 0 ]; then
    for localShellFile in ${SHELL_LOCAL_DIR}/*.sh; do
        source $localShellFile
    done
fi

