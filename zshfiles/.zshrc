# Drop duplicate PATH entries. zsh keeps the first occurrence, so precedence
# is preserved, and everything sourced below inherits the behaviour. Without
# this, macOS' path_helper, brew shellenv in common_sync/environment.bash and
# ~/.cargo/env each add entries the others already provided.
typeset -U path PATH

[ -d /opt/homebrew/bin ] && PATH="$PATH:/opt/homebrew/bin"
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

eval "$(starship init zsh)"

# pnpm global package bin dir (XDG-style, portable across macOS/Linux)
export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
