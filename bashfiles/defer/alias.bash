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
