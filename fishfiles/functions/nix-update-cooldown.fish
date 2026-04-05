function nix-update-cooldown --description "Update nixpkgs flake input to a commit from N days ago"
    set -l days 7
    set -l flake_dir "$HOME/.dotfiles"

    if test (count $argv) -ge 1
        set days $argv[1]
    end

    set -l until_date
    if date --version >/dev/null 2>&1
        # GNU date
        set until_date (date -u -d "$days days ago" +%Y-%m-%dT%H:%M:%SZ)
    else
        # BSD date (macOS default)
        set until_date (date -u -v-{$days}d +%Y-%m-%dT%H:%M:%SZ)
    end
    echo "Fetching nixpkgs-unstable commit from $days days ago ($until_date)..."

    set -l commit (gh api --method GET repos/NixOS/nixpkgs/commits \
        -f sha=nixpkgs-unstable \
        -f "until=$until_date" \
        -f per_page=1 \
        --jq '.[0].sha')

    if test -z "$commit"
        echo "Failed to fetch commit" >&2
        return 1
    end

    echo "Updating flake.lock to nixpkgs commit: $commit"
    nix flake lock --override-input nixpkgs "github:nixos/nixpkgs/$commit" "$flake_dir"; or return 1

    echo "Applying home-manager configuration..."
    nix-home-switch
end
