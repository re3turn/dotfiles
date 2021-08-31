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
    set -l MACHINE (uname -m)
    if test "$MACHINE" = "arm64"
        set -g HOMEBREW_PREFIX /opt/homebrew
        set -g HOMEBREW_CELLAR /opt/homebrew/Cellar
        set -g HOMEBREW_REPOSITORY /opt/homebrew
        set -g HOMEBREW_SHELLENV_PREFIX /opt/homebrew
        set_u_var fish_user_paths /opt/homebrew/bin
        set_u_var fish_user_paths /opt/homebrew/sbin
        set -g MANPATH /opt/homebrew/share/man $MANPATH
        set -g INFOPATH /opt/homebrew/share/info $INFOPATH
        set -g HOMEBREW_OPT_DIR $HOMEBREW_PREFIX/opt
    else
        set -g HOMEBREW_OPT_DIR /usr/local/opt
    end

    set_u_var fish_user_paths $HOMEBREW_OPT_DIR/coreutils/libexec/gnubin
    set_u_var fish_user_paths $HOMEBREW_OPT_DIR/findutils/libexec/gnubin
    set_u_var fish_user_paths $HOMEBREW_OPT_DIR/gnu-tar/libexec/gnubin
    set_u_var fish_user_paths $HOMEBREW_OPT_DIR/gnu-sed/libexec/gnubin
    set_u_var fish_user_paths $HOMEBREW_OPT_DIR/grep/libexec/gnubin

    set -g MANPATH $HOMEBREW_OPT_DIR/coreutils/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/findutils/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/gnu-sed/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/gnu-tar/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/grep/libexec/gnuman $MANPATH
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

