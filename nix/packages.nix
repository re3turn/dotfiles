{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Shell
    fish
    sheldon
    starship

    # Git (package managed by programs.git)
    gh
    tig

    # Search & File
    bat
    eza
    fd
    fzf
    ripgrep
    tree

    # CLI tools
    jq
    jid
    curl
    wget
    hexyl
    procs
    colordiff

    # Editor
    neovim
  ];
}
