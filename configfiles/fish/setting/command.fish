fish_add_path $HOME/.local/bin

# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
end

# fzf
if not command -s fzf > /dev/null
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install --no-key-bindings --no-completion --no-update-rc
end
set -q FZF_LEGACY_KEYBINDINGS; or set -U FZF_LEGACY_KEYBINDINGS 0
fish_add_path $HOME/.fzf/bin

# go
set -q GOPATH; or set -Ux GOPATH $HOME/go
mkdir -p $GOPATH/bin
fish_add_path $GOPATH/bin

# ghg
if not command -s ghg > /dev/null
    echo "install ghg"
    go get github.com/Songmu/ghg/cmd/ghg
end
mkdir -p (ghg bin)
fish_add_path (ghg bin)

# ghq
if not command -s ghq > /dev/null
    ghg get motemen/ghq
end

# node
fish_add_path $HOME/.nodebrew/current/bin

# dot
set -q DOT_REPO; or set -U DOT_REPO https://github.com/re3turn/dotfiles.git
set -q DOT_DIR; or set -U DOT_DIR $HOME/.dotfiles
set -q DOT_SRC; or set -U DOT_SCR $HOME/.dot

# pyenv
if not command -s pyenv > /dev/null
    fish_add_path $HOME/.pyenv/bin
end
if command -s pyenv > /dev/null
    set -q PYENV_ROOT; or set -U PYENV_ROOT $HOME/.pyenv
    switch (uname)
    case Linux
        status --is-interactive; and source (pyenv init -|psub)
    end
end

# Abbrevations
abbr --add dotdot --regex '^\.\.+$' --function multicd
abbr -a !! --position anywhere --function last_history_item

# source-highlight
export LESSOPEN="| $HOME/.dotfiles/bashfiles/command/script/source-highlight/$OSTYPE/lesspipej.sh %s"
export LESS="-j10 -R -i -M --no-init --quit-if-one-screen"

# the fuck
eval $(thefuck --alias)
