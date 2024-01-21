PATH=${HOME}/.cargo/bin:${PATH}
eval "$(sheldon --config-dir "${HOME}/.dotfiles/zshfiles/sheldon" source)"

########################################
# zcompile
if [ ! -f "${HOME}/.zshrc.zwc" -o ${ZSH_ROOT}/.zshrc -nt "${HOME}/.zshrc.zwc" ]; then
    zcompile "${HOME}/.zshrc"
fi
