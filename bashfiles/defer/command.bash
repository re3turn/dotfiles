[ -f ~/.fzf.bash ] && source ~/.fzf.bash

shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# for Bash 5+
if [[ "${BASH_ARGV0}" != "" ]]; then
    shopt -s globstar
    shopt -s autocd
    set completion-ignore-case on
fi

[ -f /etc/profile.d/bash_completion.sh ] && source /etc/profile.d/bash_completion.sh
