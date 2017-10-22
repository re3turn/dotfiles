export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTIGNORE=cd:ls:pwd:exit
export HISTSIZE=10000
export HISTFILE=~/.bash_history

PS1="\[\e[35m\e[47m\][\u@\H] \W\[\e[0m\]\n\\$ "

alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'
alias grep='grep --color'
alias ps='ps --sort=start_time'

eval `dircolors ~/.dircolors/dircolors.256dark`
