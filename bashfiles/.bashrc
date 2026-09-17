[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# sheldon and starship are installed by mise, not Homebrew. A shell that
# inherits its PATH from fish already has them; a cold one does not, and every
# line below would silently fail - including the mise activation that now
# provides the JDK. Only prepend the shims when that is actually the case, so
# warm shells keep their existing lookup order.
command -v sheldon > /dev/null 2>&1 || PATH="$HOME/.local/share/mise/shims:$PATH"

eval "$(sheldon --config-dir "${HOME}/.dotfiles/bashfiles/sheldon" source)"

eval "$(starship init bash)"

# Drop duplicate PATH entries, keeping the first occurrence so precedence is
# preserved - what `typeset -U path` does in .zshrc and the loop at the end of
# fish's config.fish. bash has no built-in equivalent.
# Splitting on IFS=: only, so directories containing spaces survive intact.
# Must stay last: mise activate, reached through sheldon's common_defer, is the
# final thing that touches PATH.
__dedup_path() {
    local IFS=: dir out=
    for dir in $PATH; do
        case ":$out:" in
            *":$dir:"*) ;;
            *) out="${out:+$out:}$dir" ;;
        esac
    done
    PATH=$out
}
__dedup_path
unset -f __dedup_path
