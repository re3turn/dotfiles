# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# fzf
if not command -s fzf > /dev/null
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
end
set -q FZF_LEGACY_KEYBINDINGS; or set -U FZF_LEGACY_KEYBINDINGS 0
set_u_var fish_user_paths ~/.fzf/bin

# go
if not command -s go > /dev/null
    echo "install go"
    switch (uname)
    case Darwin
        brew install go
    case Linux
        sudo add-apt-repository ppa:longsleep/golang-backports
        sudo apt update
        sudo apt install -y golang-go
    end
end
set -q GOPATH; or set -Ux GOPATH ~/.go
mkdir -p $GOPATH/bin
set_u_var fish_user_paths $GOPATH/bin

# ghg
if not command -s ghg > /dev/null
    echo "install ghg"
    go get github.com/Songmu/ghg/cmd/ghg
end
mkdir -p (ghg bin)
set_u_var fish_user_paths (ghg bin)

# ghq
if not command -s ghq > /dev/null
    ghg get motemen/ghq
end

# dot
set -q DOT_REPO; or set -U DOT_REPO https://github.com/re3turn/dotfiles.git
set -q DOT_DIR; or set -U DOT_DIR ~/.dotfiles
set -q DOT_SRC; or set -U DOT_SCR ~/.dot

