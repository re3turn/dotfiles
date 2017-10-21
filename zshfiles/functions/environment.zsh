########################################
# 環境変数
export LANG=ja_JP.UTF-8
#export PATH=$PATH:~/.cargo/bin

########################################
# dot setting
export DOT_REPO="https://github.com/re3turn/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"
########################################

case ${OSTYPE} in
    darwin*)
        # if Mac OS
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        ;;
    linux*)
        # if Linux OS
        ;;
esac

# for go lang
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH="$GOPATH/bin:$PATH"
fi

if [ $(uname -r | grep Microsoft) ]; then
    unsetopt BG_NICE
fi

#########################################
# history command setting
ZSH_HISTORY_KEYBIND_GET="^r"
ZSH_HISTORY_FILTER_OPTIONS="--filter-branch --filter-dir"
ZSH_HISTORY_KEYBIND_ARROW_UP="^p"
ZSH_HISTORY_KEYBIND_ARROW_DOWN="^n"

