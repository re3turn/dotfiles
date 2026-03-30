{ pkgs, ... }:

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
    mise
    pnpm

    # Security
    grype
    syft
    trivy

    # CLI tools
    azure-cli
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
}
