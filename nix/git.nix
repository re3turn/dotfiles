{ pkgs, lib, ... }:

{
  programs.git = {
    enable = true;

    includes = [
      { path = "~/.gitconfig.local"; }
    ];

    signing.format = null;

    settings = {
      core = {
        ignorecase = false;
        autocrlf = false;
        editor = "vim";
        fsmonitor = true;
        untrackedCache = true;
      };
      pager = {
        branch = false;
      };
      branch = {
        sort = "-committerdate";
      };
      column = {
        ui = "auto";
      };
      tag = {
        sort = "version:refname";
      };
      push = {
        default = "simple";
        autoSetupRemote = true;
        followTags = true;
      };
      commit = {
        verbose = true;
      };
      merge = {
        conflictstyle = "zdiff3";
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      diff-so-fancy = true;
      keep-plus-minus-markers = true;
      hunk-header-style = "omit";
      line-numbers = true;
      plus-style = "syntax #012800";
      minus-style = "normal #340001";
      theme = "Solarized (light)";
    };
  };
}
