export PATH=${HOME}/.cargo/bin:${HOME}/.nodebrew/current/bin:${HOME}/.go/bin:${HOME}/go/bin:${HOME}/.fzf/bin:${HOME}/.ghg/bin:${HOME}/ghg/bin:${HOME}/.pyenv/bin:${HOME}/.local/bin:$PATH

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

# source-highlight
export LESSOPEN="| ${HOME}/.dotfiles/bashfiles/command/script/source-highlight/${OSTYPE}/lesspipej.sh %s"
export LESS="-j10 -R --no-init --quit-if-one-screen"

export IGNOREEOF=10
