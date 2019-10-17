function diff -d "Switch colordiff"
    command which -s colordiff
    if test $status -eq 0
        command colordiff -u $argv
    else
        command diff -u $argv
    end
end
