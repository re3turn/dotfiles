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
    if not command -s brew > /dev/null
        ruby -e (curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
        brew install coreutils gnu-sed
    end
    set_u_var fish_user_paths (brew --prefix coreutils)/libexec/gnubin
    set_u_var fish_user_paths (brew --prefix gnu-sed)/libexec/gnubin
case 'linux*'
    # if Linux OS
    ;;
end

if command -s nvim > /dev/null
    set -U EDITOR nvim
else
    set -U EDITOR vim
end

