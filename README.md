# dotfiles

Managed with [Nix](https://nixos.org/) + [Home Manager](https://github.com/nix-community/home-manager).

## Requirements

- [Nix](https://install.determinate.systems/nix) (Determinate Systems installer recommended)
- [Homebrew](https://brew.sh/) (macOS only — for GNU tools, casks, and languages)

## Install

```bash
# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# Install Homebrew (macOS only)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone dotfiles
git clone https://github.com/re3turn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Apply Home Manager configuration
nix run home-manager -- switch --flake .#aarch64-darwin --impure

# Install Homebrew packages (macOS only)
brew bundle

# Install languages and tools via mise (Go, Node, Python, Rust)
mise install
```

Replace `aarch64-darwin` with your system:
- `aarch64-darwin` — macOS (Apple Silicon)
- `x86_64-linux` — Linux (x86_64)
- `aarch64-linux` — Linux (ARM64)

## Update

```bash
cd ~/.dotfiles
nix flake update
nix run home-manager -- switch --flake .#aarch64-darwin --impure
```

## gitconfig

Add the following to `~/.gitconfig.local`:

```
[user]
    name = YOUR_NAME
    email = YOUR_EMAIL
```
