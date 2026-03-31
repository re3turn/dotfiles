function gifit --description "Interactively select commit range with fzf and view diff with difit"
    # Pass arguments directly to difit
    if test (count $argv) -gt 0
        pnpx difit $argv
        return
    end

    # Select from special options + commit history via fzf
    set -l selected (begin
        printf '\033[33m.\033[0m All uncommitted changes (staged + unstaged)\n'
        printf '\033[33mstaged\033[0m Staged changes only\n'
        printf '\033[33mworking\033[0m Unstaged changes only\n'
        git log --oneline --decorate -100 --color=always
    end | fzf \
        --ansi \
        --header 'Select mode or FROM commit' \
        --preview 'if [ {1} = "." ]; then git diff --stat; elif [ {1} = "staged" ]; then git diff --cached --stat; elif [ {1} = "working" ]; then git diff --stat; else git log --oneline --decorate --color=always -1 {1} 2>/dev/null; fi' \
        --preview-window=top:5:wrap
    ); or return

    set -l first (string split ' ' $selected)[1]

    # Special option selected: pass directly to difit
    if contains $first . staged working
        pnpx difit $first
        return
    end

    # Commit selected: use as FROM, then select TO
    set -l from_hash $first

    set -l to_commit (git log --oneline --decorate -100 --color=always $from_hash~1.. | \
        fzf \
            --ansi \
            --header "> pnpx difit \$TO $from_hash~1" \
            --prompt 'Select TO> ' \
            --preview 'git log --oneline --decorate --color=always -1 {1}' \
            --preview-window=top:3:wrap
    ); or return

    set -l to_hash (string split ' ' $to_commit)[1]

    pnpx difit "$to_hash" "$from_hash~1"
end
