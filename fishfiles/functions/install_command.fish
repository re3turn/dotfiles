function install_command -d "Command install"
    # fisher
    if not functions -q fisher 
        curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher 
        fish -c fisher
    end

    if not type -q (command -s fzf)
        echo "install fzf"
        switch (uname)
        case Darwin
            brew install fzf
        case Linux
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install --no-bash --no-zsh --no-fish
            fisher
        end
    end

    # go
    if not type -q (command -s go)
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
    if type -q (command -s go)
        set -Ux GOPATH ~/.go
        mkdir -p $GOPATH
        set_u_var fish_user_paths $GOPATH/bin
    end

    # ghg
    if not type -q (command -s ghg)
        go get github.com/Songmu/ghg/cmd/ghg
    end
    if type -q (command -s ghg)
        mkdir -p (ghg bin)
        set_u_var fish_user_paths (ghg bin)
    end

    # ghq
    if not type -q (command -s ghq)
        ghg get motemen/ghq
    end

    # dot
    set -U DOT_REPO https://github.com/re3turn/dotfiles.git
    set -U DOT_DIR ~/.dotfiles
    set -U DOT_SCR ~/.dot
end
