eval $(dircolors ${HOME}/.dircolors/dircolors.256dark)

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--height 80% --reverse --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

# dot
# # dot setting
export DOT_REPO="https://github.com/re3turn/dotfiles.git"
export DOT_DIR="${HOME}/.dotfiles"
fpath=(${HOME}/.dot ${fpath})
source ${HOME}/.dot/dot.sh

# pyenv
command type -p pyenv > /dev/null 2>&1
if [ $? -eq 1 ]; then
    PATH=${HOME}/.pyenv/bin:${PATH}
fi
command type -p pyenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    if [ "$(uname -s)" != "Darwin" ]; then
        eval "$(pyenv init -)"
    fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

# the fuck
eval $(thefuck --alias)

# command install
bash "${HOME}/.dotfiles/bashfiles/command/install.bash"

SHELL_LOCAL_DIR="${HOME}/.shell.local"
mkdir -p ${SHELL_LOCAL_DIR}
ls "${SHELL_LOCAL_DIR}/*.sh" >/dev/null 2>&1
if [ $? -eq 0 ]; then
    for localShellFile in "${SHELL_LOCAL_DIR}/*.sh"; do
        source "${localShellFile}"
    done
fi
