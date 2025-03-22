function fish_should_add_to_history
    # 履歴に残したくないコマンド(引数なし)
    set -l commands 'bg' 'cd' 'exit' 'fg' 'history' 'jobs' 'la' 'll' 'ls' 'eza' 'pwd' 'top' 'tree' 'exit' 'eza --icons=auto' 'eza --icons=auto -l' 'eza --icons=auto -la' 'tig' 'git status' 'git branch'

    contains $argv $commands; and return 1

    # 履歴に残したくないコマンド(引数あり)
    set -l commandsWithArgs 'which' 'type' 'fbr' 'gcd' 'ycd' 'vpn'

    for c in $commandsWithArgs
        string match -q -r "^$c" $argv; and return 1
    end

    return 0
end
