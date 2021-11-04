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
#source ${ZSH_ROOT}/functions/zplug.zsh

### command(function)
source ${ZSH_ROOT}/functions/command.zsh

### command
bash ~/.dotfiles/bashfiles/command/install.bash

########################################
# zcompile
if [ ! -f ~/.zshrc.zwc -o ${ZSH_ROOT}/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

SHELL_LOCAL_DIR=~/.shell.local
mkdir -p ${SHELL_LOCAL_DIR}
for localShellFile in ${SHELL_LOCAL_DIR}/*.sh; do
    source $localShellFile
done

