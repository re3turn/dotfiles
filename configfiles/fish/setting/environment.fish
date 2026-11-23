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
    set -q GOROOT; or set -Ux GOROOT $HOME/.go
    fish_add_path $GOROOT/bin
    ;;
end

if command -s nvim > /dev/null
    set -U EDITOR nvim
else
    set -U EDITOR vim
end

# Load local shell scripts.
# These are shared with zsh/bash, so keep them to `export VAR=...` lines only:
# fish sources them directly (`export` is a builtin alias for `set -gx`), but
# has no support for `if`/`[[ ]]`, shell functions, backticks or ${VAR:-default}.
set -l SHELL_LOCAL_DIR $HOME/.shell.local
if test -d $SHELL_LOCAL_DIR
    for f in $SHELL_LOCAL_DIR/*.sh
        source "$f"
    end
end

# java: a temp dir agent sandboxes can write to (they allow /tmp/claude-*).
# Same as bashfiles/common_sync/environment.bash; used only when both levels are our own real directories.
set -l java_tmpdir /tmp/claude-(id -u)/java
sh -c 'umask 077; mkdir -p "$1"' sh $java_tmpdir 2>/dev/null
set -l java_tmpdir_parent (path dirname $java_tmpdir)
if not test -L $java_tmpdir_parent; and test -O $java_tmpdir_parent; and not test -L $java_tmpdir; and test -O $java_tmpdir
    chmod 700 $java_tmpdir_parent $java_tmpdir
    if not string match -q -- '*-Djava.io.tmpdir=*' "$JAVA_TOOL_OPTIONS"
        set -gx JAVA_TOOL_OPTIONS (string trim -- "-Djava.io.tmpdir=$java_tmpdir $JAVA_TOOL_OPTIONS")
    end
end

# uv
set -x UV_EXCLUDE_NEWER "7 days"

# pnpm global package bin dir (XDG-style, portable across macOS/Linux)
set -q XDG_DATA_HOME; or set -x XDG_DATA_HOME $HOME/.local/share
set -x PNPM_HOME $XDG_DATA_HOME/pnpm
fish_add_path $PNPM_HOME/bin
