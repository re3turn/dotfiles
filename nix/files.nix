{ config, pkgs, lib, ... }:

let
  dotdir = "${config.home.homeDirectory}/.dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotdir}/${path}";
in
{
  # Shell configs
  home.file.".zsh".source = link "zshfiles";
  home.file.".zshrc".source = link "zshfiles/.zshrc";
  home.file.".bashrc".source = link "bashfiles/.bashrc";
  home.file.".dircolors".source = link "zshfiles/dircolors";
  home.file.".npmrc".source = link "npmfiles/.npmrc";

  # Vim compatibility
  home.file.".vim".source = link "configfiles/nvim";

  # XDG config
  xdg.configFile."nvim".source = link "configfiles/nvim";
  xdg.configFile."ftplugin".source = link "configfiles/ftplugin";
  xdg.configFile."fzshell".source = link "configfiles/fzshell";
  xdg.configFile."ghostty" = lib.mkIf pkgs.stdenv.isDarwin {
    source = link "configfiles/ghostty";
  };
  xdg.configFile."mise/config.toml".source = link "configfiles/mise/config.toml";
  xdg.configFile."starship.toml".source = link "configfiles/starship.toml";

  # Fish config (individual files, not the whole directory)
  xdg.configFile."fish/config.fish".source = link "configfiles/fish/config.fish";
  xdg.configFile."fish/fish_plugins".source = link "configfiles/fish/fish_plugins";
  xdg.configFile."fish/conf.d/fzf-custom.fish".source = link "configfiles/fish/conf.d/fzf-custom.fish";
  xdg.configFile."fish/setting".source = link "configfiles/fish/setting";

  # Fish functions (custom only)
  xdg.configFile."fish/functions/fbr.fish".source = link "fishfiles/functions/fbr.fish";
  xdg.configFile."fish/functions/gcd.fish".source = link "fishfiles/functions/gcd.fish";
  xdg.configFile."fish/functions/fcd.fish".source = link "fishfiles/functions/fcd.fish";
  xdg.configFile."fish/functions/diff.fish".source = link "fishfiles/functions/diff.fish";
  xdg.configFile."fish/functions/vi.fish".source = link "fishfiles/functions/vi.fish";
  xdg.configFile."fish/functions/vim.fish".source = link "fishfiles/functions/vim.fish";
  xdg.configFile."fish/functions/fish_user_key_bindings.fish".source = link "fishfiles/functions/fish_user_key_bindings.fish";
  xdg.configFile."fish/functions/fed.fish".source = link "fishfiles/functions/fed.fish";
  xdg.configFile."fish/functions/fzf_find_file.fish".source = link "fishfiles/functions/fzf_find_file.fish";
  xdg.configFile."fish/functions/multicd.fish".source = link "fishfiles/functions/multicd.fish";
  xdg.configFile."fish/functions/last_history_item.fish".source = link "fishfiles/functions/last_history_item.fish";
  xdg.configFile."fish/functions/fish_should_add_to_history.fish".source = link "fishfiles/functions/fish_should_add_to_history.fish";
  xdg.configFile."fish/functions/nix-update-cooldown.fish".source = link "fishfiles/functions/nix-update-cooldown.fish";
  xdg.configFile."fish/functions/gifit.fish".source = link "fishfiles/functions/gifit.fish";

  # Fish completions
  xdg.configFile."fish/completions/aws.fish".source = link "fishfiles/completions/aws.fish";

  # macOS-only scripts
  home.file.".local/bin/brew-safe-upgrade" = lib.mkIf pkgs.stdenv.isDarwin {
    source = link "binfiles/brew-safe-upgrade";
  };
}
