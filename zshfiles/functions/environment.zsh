########################################
# 環境変数
export LANG=ja_JP.UTF-8
#export PATH=$PATH:~/.cargo/bin
export PATH=~/.fzf/bin:~/.ghg/bin:$PATH

########################################
# dot setting
export DOT_REPO="https://github.com/re3turn/dotfiles.git"
export DOT_DIR="${HOME}/.dotfiles"
########################################

case ${OSTYPE} in
    darwin*)
        # if Mac OS
        MACHINE=$(uname -m)
        if [ "${MACHINE}" = "arm64" ]; then
            export HOMEBREW_PREFIX="/opt/homebrew"
            export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
            export HOMEBREW_REPOSITORY="/opt/homebrew"”;
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

        MANPATH="${HOMEBREW_OPT_DIR}/coreutils/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/findutils/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/gnu-sed/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/gnu-tar/libexec/gnuman:$MANPATH"
        MANPATH="${HOMEBREW_OPT_DIR}/grep/libexec/gnuman:$MANPATH"
        ;;
    linux*)
        # if Linux OS
        export GOROOT=~/.go
        ;;
esac

# for go lang
export GOPATH=~/go

if [ $(uname -r | grep Microsoft) ]; then
    unsetopt BG_NICE
fi

#########################################
# history command setting
ZSH_HISTORY_KEYBIND_GET="^r"
ZSH_HISTORY_FILTER_OPTIONS="--filter-branch --filter-dir"
ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"

