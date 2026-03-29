{ config, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/${path}";
in
{
  home.file.".gitconfig".source = link ".gitconfig";
}
