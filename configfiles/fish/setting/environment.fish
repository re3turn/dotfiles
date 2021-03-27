set -x LANG en_US.UTF-8

switch (uname)
case Darwin
    set -U OSTYPE darwin
case Linux
    set -U OSTYPE linux
case '*'
    set -U OSTYPE Other_OS
end

switch $OSTYPE
case 'darwin*'
    # if Mac OS
    if not set -q COREUTILES_DIR
        set -U COREUTILES_DIR (brew --prefix coreutils)
    end
    if not set -q GNU_SED_DIR
        set -U GNU_SED_DIR (brew --prefix gnu-sed)
    end
    set_u_var fish_user_paths $COREUTILES_DIR/libexec/gnubin
    set_u_var fish_user_paths $GNU_SED_DIR/libexec/gnubin
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

# pipenv
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

