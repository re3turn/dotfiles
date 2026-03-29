{ pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDir = builtins.getEnv "HOME";
in
{
  imports = [
    ./git.nix
    ./packages.nix
  ];

  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
