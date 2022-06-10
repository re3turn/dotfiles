function fcd
    set -q argv[1]; and set -l BASE_DIR $argv[1]; or set -l BASE_DIR .
    set -l FDIR $(find $BASE_DIR -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
    if test -n "$FDIR"
        cd $FDIR
    end
end

