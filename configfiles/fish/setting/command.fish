# fisher
if not type -q fisher
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
end

# mpm
if not type -q (command -s mpm)
    sudo pip3 install meta-package-manager
end

# go
if not type -q (command -s go)
    echo "install go"
    switch (uname)
    case Darwin
        brew install go
    case Linux
        sudo apt install golang
    end
end
if type -q (command -s go)
    set -gx GOPATH ~/.go
    set -gx PATH $GOPATH/bin $PATH
    mkdir -p $GOPATH
end

# ghq
if not type -q (command -s ghq)
    go get github.com/motemen/ghq
end



# dot
set -gx DOT_REPO https://github.com/re3turn/dotfiles.git
set -gx DOT_DIR ~/.dotfiles
set -gx DOT_SCR ~/.dot

