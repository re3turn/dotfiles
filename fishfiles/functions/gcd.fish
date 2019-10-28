function gcd
    if not type -q (command -s ghq)
        echo ghq command is not install 1>&2
        return 1
    end
    if test (count $argv) -ne 1
        if test (ghq list | wc -l) -eq 0
            echo ghq no repository 1>&2
            return 2
        end
        cd (command ghq list --full-path | command fzf)
        return 0
    end
    set -l GHQ (ghq root)/github.com
    set -l ME (git config --get user.name)

    command ghq get -p $1
    if test (dirname "$1") = "."
        cd $GHQ/$ME/$1
    else
        cd $GHQ/$1
    end
end

