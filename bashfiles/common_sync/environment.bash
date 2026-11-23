export PATH=${HOME}/.nix-profile/bin:${HOME}/.cargo/bin:${HOME}/.fzf/bin:${HOME}/.local/bin:$PATH

case ${OSTYPE} in
    darwin*)
        # if Mac OS
        MACHINE=$(uname -m)
        if [ "${MACHINE}" = "arm64" ]; then
            export HOMEBREW_PREFIX="/opt/homebrew"
            export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
            export HOMEBREW_REPOSITORY="/opt/homebrew";
            export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew";
            export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
            export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}";
            export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
            export HOMEBREW_OPT_DIR="${HOMEBREW_PREFIX}/opt"
        else
            export HOMEBREW_OPT_DIR="/usr/local/opt"
        fi

        PATH="${HOMEBREW_OPT_DIR}/coreutils/libexec/gnubin:$PATH"
        PATH="${HOMEBREW_OPT_DIR}/findutils/libexec/gnubin:$PATH"
        PATH="${HOMEBREW_OPT_DIR}/gnu-tar/libexec/gnubin:$PATH"
        PATH="${HOMEBREW_OPT_DIR}/gnu-sed/libexec/gnubin:$PATH"
        PATH="${HOMEBREW_OPT_DIR}/grep/libexec/gnubin:$PATH"
        PATH="${HOMEBREW_OPT_DIR}/gawk/libexec/gnubin:$PATH"

        MANPATH="${HOMEBREW_OPT_DIR}/coreutils/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/findutils/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/gnu-sed/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/gnu-tar/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/grep/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/gawk/libexec/gnuman:$MANPATH"
        ;;
    linux*)
        # if Linux OS
        export GOROOT="${HOME}/.go"
        export PATH=${GOROOT}/bin:${PATH}
        ;;
esac

# editor
type -p nvim > /dev/null 2>&1
if [ $? -eq 0 ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

# go
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH=${GOPATH}/bin:${PATH}

# source-highlight
export LESSOPEN="| ${HOME}/.dotfiles/bashfiles/command/script/source-highlight/${OSTYPE}/lesspipej.sh %s"
export LESS="-j10 -R --no-init --quit-if-one-screen"

export IGNOREEOF=10

SHELL_LOCAL_DIR="${HOME}/.shell.local"
mkdir -p ${SHELL_LOCAL_DIR}
ls ${SHELL_LOCAL_DIR}/*.sh >/dev/null 2>&1
if [ $? -eq 0 ]; then
    for localShellFile in ${SHELL_LOCAL_DIR}/*.sh; do
        source "${localShellFile}"
    done
fi

# java: a temp dir agent sandboxes can write to (they allow /tmp/claude-*).
# After ~/.shell.local, which may set JAVA_TOOL_OPTIONS outright (fish shares
# those files, so they cannot append conditionally). /tmp is shared, so use it
# only when both levels are our own real directories.
JAVA_TMPDIR="/tmp/claude-$(id -u)/java"
(umask 077; mkdir -p "$JAVA_TMPDIR") 2>/dev/null
if [ ! -L "${JAVA_TMPDIR%/*}" ] && [ -O "${JAVA_TMPDIR%/*}" ] && [ ! -L "$JAVA_TMPDIR" ] && [ -O "$JAVA_TMPDIR" ]; then
    chmod 700 "${JAVA_TMPDIR%/*}" "$JAVA_TMPDIR"
    case " ${JAVA_TOOL_OPTIONS:-} " in
        *" -Djava.io.tmpdir="*) ;;
        *) export JAVA_TOOL_OPTIONS="-Djava.io.tmpdir=${JAVA_TMPDIR}${JAVA_TOOL_OPTIONS:+ $JAVA_TOOL_OPTIONS}" ;;
    esac
fi

# uv
export UV_EXCLUDE_NEWER="7 days"

# mise: not in common_defer, since zsh defers that until after the first prompt.
# Must stay last so mise is the final thing that touches PATH.
if command -v mise > /dev/null 2>&1; then
    if [ -n "${ZSH_VERSION:-}" ]; then
        eval "$(mise activate zsh)"
    else
        eval "$(mise activate bash)"
    fi
fi
