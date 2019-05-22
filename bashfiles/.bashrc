export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTIGNORE=cd:ls:pwd:exit
export HISTSIZE=10000
export HISTFILE=~/.bash_history
export PATH=~/.go/bin:~/.fzf/bin:~/.ghg/bin:$PATH

type nvim > /dev/null 2>&1
if [ $? -eq 0 ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

# go
export GOPATH=~/.go

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

eval `dircolors ~/.dircolors/dircolors.256dark`

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# dot
export DOT_REPO="https://github.com/re3turn/dotfiles.git"
export DOT_DIR="~/.dotfiles"
fpath=(~/.dot $fpath)
source ~/.dot/dot.sh

