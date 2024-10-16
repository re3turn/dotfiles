PATH=$PATH:/opt/homebrew/bin
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

eval "$(sheldon --config-dir "${HOME}/.dotfiles/zshfiles/sheldon" source)"

########################################
# zcompile
if [ ! -f "${HOME}/.zshrc.zwc" -o ${ZSH_ROOT}/.zshrc -nt "${HOME}/.zshrc.zwc" ]; then
    zcompile "${HOME}/.zshrc"
fi
