function dot --description "dot"

    if not test -f $DOT_SCR/dot.sh
        echo "dot is not installed."
        return 1
    end

    if not type -q (command -s bash)
        echo "bash is not executed."
        return 1
    end

    bash -c "source \"$DOT_SCR/dot.sh\" && dot_main $argv"
end

