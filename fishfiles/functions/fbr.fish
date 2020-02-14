function fbr
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

