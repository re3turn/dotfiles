function dot --description "dot"

    set -gx DOT_REPO "https://github.com/re3turn/dotfiles.git"
    set -gx DOT_DIR "$HOME/.dotfiles"
    set -l DOT_SRC "$HOME/.dot"

    if not test -f $DOT_SCR/dot.sh
        echo "dot is not installed."
        return 1
    end

    if not type -q (command -s bash)
        echo "bash is not executed."
        return 1
    end

    set -l TEMPFILE (mktemp)
    printf "\
source \"$DOT_SRC/dot.sh\"
dot_main $argv
" > $TEMPFILE

    bash $TEMPFILE
end

