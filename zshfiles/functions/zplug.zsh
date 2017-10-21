########################################
# zplug

ZPLUG_SOURCE=~/.zplug/init.zsh

# if zplug is not installed, automatically clone it and reload shell
if [[ ! -f "${ZPLUG_SOURCE}" ]]; then
    ZPLUG_URL=https://raw.githubusercontent.com/zplug/installer/master/installer.zsh
    echo "zplug is not installed in this machine."
    echo "Installing zplug..."
    echo ""
    curl -sL --proto-redir -all,https ${ZPLUG_URL}| zsh
    source ${ZPLUG_SOURCE}
fi

source ${ZPLUG_SOURCE}
unset -v ZPLUG_SOURCE

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:fzf, \
    frozen:1
zplug "b4b4r07/zsh-gomi", \
    as:command, \
    use:bin/gomi, \
    on:junegunn/fzf-bin
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "b4b4r07/history", as:command, from:gh-r
zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ssh0/dot", use:"*.sh"

# 未インストールであればインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込みコマンドにパスを通す
zplug load --verbose

