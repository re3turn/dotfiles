function nix-update-cooldown --description "Update nixpkgs flake input to a commit from N days ago"
    set -l days 7
    set -l flake_dir "$HOME/.dotfiles"

    if test (count $argv) -ge 1
        set days $argv[1]
    end

    set -l until_date (date -u -v-{$days}d +%Y-%m-%dT%H:%M:%SZ)
    echo "Fetching nixpkgs-unstable commit from $days days ago ($until_date)..."

    set -l commit (gh api repos/nixos/nixpkgs/commits \
        -f sha=nixpkgs-unstable \
        -f "until=$until_date" \
        -f per_page=1 \
        --jq '.[0].sha')

    if test -z "$commit"
        echo "Failed to fetch commit" >&2
        return 1
    end

    echo "Updating flake.lock to nixpkgs commit: $commit"
    nix flake lock --override-input nixpkgs "github:nixos/nixpkgs/$commit" --flake "$flake_dir"; or return 1

    set -l system (nix eval --impure --raw --expr 'builtins.currentSystem')
    echo "Applying home-manager configuration..."
    home-manager switch --flake "$flake_dir#$system" --impure
end
