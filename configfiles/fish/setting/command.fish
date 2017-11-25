# fisher
if not type -q fisher
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
end

# mpm
if not type -q (command -s mpm)
    sudo pip3 install meta-package-manager
end

if not type -q (command -s fzf)
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
end

# go
if not type -q (command -s go)
    echo "install go"
    switch (uname)
    case Darwin
        brew install go
    case Linux
        sudo add-apt-repository -y ppa:gophers/archive
        sudo apt update
        sudo apt install golang-1.9-go
    end
end
if type -q (command -s go)
    set -gx GOPATH ~/.go
    set -gx PATH $GOPATH/bin $PATH
    mkdir -p $GOPATH
end

# ghg
if not type -q (command -s ghg)
    go get github.com/Songmu/ghg/cmd/ghg
end
if type -q (command -s ghg)
    mkdir -p ~/.ghg/bin
    set -gx PATH (ghg bin) $PATH
end

# ghq
if not type -q (command -s ghq)
    ghg get motemen/ghq
end

# dot
set -gx DOT_REPO https://github.com/re3turn/dotfiles.git
set -gx DOT_DIR ~/.dotfiles
set -gx DOT_SCR ~/.dot

