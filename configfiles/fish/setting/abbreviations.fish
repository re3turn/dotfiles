abbr --add mkdir 'mkdir -p'
abbr --add rm 'rm -i'
abbr --add cp 'cp -i'
abbr --add mv 'mv -i'
abbr --add gs 'git status'
abbr --add gc 'git commit'
abbr --add gsw 'git switch'
abbr --add gm 'git merge'
abbr --add gr 'git rebase'
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr --add !! --position anywhere --function last_history_item
