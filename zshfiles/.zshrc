export ZSH_ROOT=~/.zsh

### set environment variables
source ${ZSH_ROOT}/functions/environment.zsh

### zsh setting
source ${ZSH_ROOT}/functions/setting.zsh

### alias
source ${ZSH_ROOT}/functions/alias.zsh

### etc setting
source ${ZSH_ROOT}/functions/pip.zsh
eval `dircolors ~/.dircolors/dircolors.256dark`

### zplug
source ${ZSH_ROOT}/functions/zplug.zsh

### command(function)
source ${ZSH_ROOT}/functions/command.zsh


########################################
# zcompile
if [ ! -f ~/.zshrc.zwc -o ${ZSH_ROOT}/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
