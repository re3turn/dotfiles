function gcd
    if not type -q (command -s ghq)
        echo ghq command is not install
        return 1
    end
    if test (count $argv) -ne 1
        echo Usage: gcd repository_name
        return 1
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

