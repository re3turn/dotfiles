set -x LANG ja_JP.UTF-8

switch (uname)
case Darwin
    set -U OSTYPE darwin
case Linux
    uname -a | grep Microsoft > /dev/null ^&1
    if test $status -eq 0
        set -U OSTYPE linux_WSL
    else
        set -U OSTYPE linux
    end
case '*'
    set -U OSTYPE Other_OS
end

switch $OSTYPE
case 'darwin*'
    # if Mac OS
    set_u_var fish_user_paths (brew --prefix coreutils)/libexec/gnubin
    set_u_var fish_user_paths (brew --prefix gnu-sed)/libexec/gnubin
case 'linux*'
    # if Linux OS
    ;;
end

