function diff -d "Switch colordiff"
    command which colordiff > /dev/null 2>&1
    if test $status -eq 0
        command colordiff -u $argv
    else
        command diff -u $argv
    end
end
