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
    set_u_var fish_user_paths /usr/local/opt/coreutils/libexec/gnubin
    set_u_var fish_user_paths /usr/local/opt/findutils/libexec/gnubin
    set_u_var fish_user_paths /usr/local/opt/gnu-tar/libexec/gnubin
    set_u_var fish_user_paths /usr/local/opt/gnu-sed/libexec/gnubin
    set_u_var fish_user_paths /usr/local/opt/grep/libexec/gnubin

    set -g MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
    set -g MANPATH /usr/local/opt/findutils/libexec/gnuman $MANPATH
    set -g MANPATH /usr/local/opt/gnu-sed/libexec/gnuman $MANPATH
    set -g MANPATH /usr/local/opt/gnu-tar/libexec/gnuman $MANPATH
    set -g MANPATH /usr/local/opt/grep/libexec/gnuman $MANPATH
    ;;
case 'linux*'
    # if Linux OS
    ;;
end

if command -s nvim > /dev/null
    set -U EDITOR nvim
else
    set -U EDITOR vim
end

set -U LESS -iMR
