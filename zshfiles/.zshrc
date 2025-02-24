PATH=$PATH:/opt/homebrew/bin
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

eval "$(sheldon --config-dir "${HOME}/.dotfiles/zshfiles/sheldon" source)"

########################################
# zcompile
if [ ! -f "${HOME}/.zshrc.zwc" -o ${ZSH_ROOT}/.zshrc -nt "${HOME}/.zshrc.zwc" ]; then
    zcompile "${HOME}/.zshrc"
fi
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
