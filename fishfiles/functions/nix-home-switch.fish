function nix-home-switch --description "Apply home-manager configuration"
    set -l flake_dir "$HOME/.dotfiles"
    set -l system (nix eval --impure --raw --expr 'builtins.currentSystem')
    home-manager switch --flake "$flake_dir#$system" --impure $argv
end
