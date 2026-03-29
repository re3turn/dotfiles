{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # Shell
    bash
    fish
    sheldon
    starship

    # Git
    git
    delta
    gh
    ghq
    tig

    # Editor
    neovim

    # Search & File
    bat
    eza
    fd
    fzf
    hexyl
    ripgrep
    tree

    # Languages & Package managers
    go
    mise
    pnpm

    # Security
    grype
    syft
    trivy

    # CLI tools
    awscli2
    colordiff
    curl
    jid
    jq
    less
    nkf
    pet
    procs
    sourceHighlight
    sqlite
    wget
    xxh
    zellij
  ];

  # Go tools not available in nixpkgs
  home.activation.goTools = lib.hm.dag.entryAfter [ "installPackages" ] ''
    export PATH="${pkgs.go}/bin:$HOME/go/bin:$PATH"
    export GOPATH="$HOME/go"
    ${pkgs.go}/bin/go install github.com/nao1215/gup@latest 2>/dev/null || true
    ${pkgs.go}/bin/go install github.com/toshimaru/nyan@latest 2>/dev/null || true
    ${pkgs.go}/bin/go install github.com/oklog/ulid/v2/cmd/ulid@latest 2>/dev/null || true
  '';
}
