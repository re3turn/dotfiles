set -x LANG ja_JP.UTF-8

switch (uname)
case Darwin
    set -x OSTYPE darwin
case Linux
    uname -a | grep Microsoft > /dev/null ^&1
    if test $status -eq 0
        set -x OSTYPE linux_WSL
    else
        set -x OSTYPE linux
    end
case '*'
    set -x OSTYPE Other_OS
end

switch $OSTYPE
case 'darwin*'
    # if Mac OS
    set -x PATH (brew --prefix coreutils)/libexec/gnubin $PATH
case 'linux*'
    # if Linux OS
    ;;
end

