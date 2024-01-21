[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

eval "$(sheldon --config-dir "${HOME}/.dotfiles/bashfiles/sheldon" source)"
