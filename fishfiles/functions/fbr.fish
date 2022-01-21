function fbr
    if test (count $argv) -ne 0
        git checkout $argv
        return $status
    end
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

