function fbr
    if test (count $argv) -ne 0
        git checkout $argv
        return $status
    end
    git branch --all | grep -v HEAD | string trim | fzf --preview "git log -20 --color=always {}" | read -l result; and git checkout "$result"
end

