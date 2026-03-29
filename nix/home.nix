{ pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDir = builtins.getEnv "HOME";
in
{
  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Shell
    fish
    sheldon
    starship

    # Git
    git
    delta
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
