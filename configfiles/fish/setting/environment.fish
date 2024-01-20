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
        fish_add_path /opt/homebrew/bin
        fish_add_path /opt/homebrew/sbin
        set -g MANPATH /opt/homebrew/share/man $MANPATH
        set -g INFOPATH /opt/homebrew/share/info $INFOPATH
        set -g HOMEBREW_OPT_DIR $HOMEBREW_PREFIX/opt
    else
        set -g HOMEBREW_OPT_DIR /usr/local/opt
    end

    fish_add_path $HOMEBREW_OPT_DIR/coreutils/libexec/gnubin
    fish_add_path $HOMEBREW_OPT_DIR/findutils/libexec/gnubin
    fish_add_path $HOMEBREW_OPT_DIR/gnu-tar/libexec/gnubin
    fish_add_path $HOMEBREW_OPT_DIR/gnu-sed/libexec/gnubin
    fish_add_path $HOMEBREW_OPT_DIR/grep/libexec/gnubin
    fish_add_path $HOMEBREW_OPT_DIR/gawk/libexec/gnubin

    set -g MANPATH $HOMEBREW_OPT_DIR/coreutils/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/findutils/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/gnu-sed/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/gnu-tar/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/grep/libexec/gnuman $MANPATH
    set -g MANPATH $HOMEBREW_OPT_DIR/gawk/libexec/gnuman $MANPATH
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

# theme option
set -g theme_color_scheme dracula
set -g theme_nerd_fonts yes
set -g theme_newline_cursor yes
set -g theme_display_aws_vault_profile yes
