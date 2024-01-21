if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

eval "$(sheldon --config-dir "${HOME}/.dotfiles/bashfiles/sheldon" source)"
