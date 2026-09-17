[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

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
