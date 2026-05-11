{ pkgs, dendrite, ... }:

let
  dendritePackages =
    if builtins.pathExists ./dendrite/default.nix then
      import ./dendrite { inherit pkgs; }
    else
      [ ];
in
{
  home.packages = (with pkgs; [
    # Shell
    bash
    fish
    sheldon

    # Git
    git
    tig

    # Editor
    neovim

    # Search & File
    eza
    fzf
    tree

    # Languages & Package managers
    pnpm

    # CLI tools
    azure-cli
    awscli2
    colordiff
    curl
    jq
    less
    nkf
    sourceHighlight
    sqlite
    wget
    xxh
  ]) ++ [ dendrite ] ++ dendritePackages;
}
