# dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

## Package management layout

| Layer | Source | Purpose |
| --- | --- | --- |
| `configfiles/mise/config.toml` (`[tools]`) | mise (aqua registry / pipx / npm backends) | CLI tools and language toolchains (gh, ripgrep, fd, bat, delta, starship, mise-managed node/python/rust/go, ...). Cross-platform - mise resolves the right binary per OS/arch automatically |
| `mise.toml` (`[dotfiles]`) | mise bootstrap | Symlinks dotfiles into place (`~/.gitconfig`, `~/.config/nvim`, fish config, etc.) |
| `Brewfile` | Homebrew / Linuxbrew | Foundational/system tools mise doesn't manage (git, fish, bash, curl, wget, tig, ...). Installed on both macOS and Linux |
| `Brewfile.macos` | Homebrew | macOS-only: GNU tool replacements for BSD tools, and casks. Skipped on Linux |

`mise bootstrap` runs a `[tasks.bootstrap]` task that runs `brew bundle
--file=./Brewfile` on every platform, then additionally
`brew bundle --file=./Brewfile.macos` on macOS only. One command sets up
dotfiles, CLI tools, and Homebrew packages together, on macOS or Linux.

A couple of `[dotfiles]` entries (`~/.config/ghostty`,
`~/.local/bin/brew-safe-upgrade`) are macOS-specific tools but get symlinked
on every platform anyway, since `[dotfiles]` has no OS-conditional syntax -
they're simply unused on Linux.

## Requirements

- [mise](https://mise.jdx.dev/installing-mise.html)
- [Homebrew](https://brew.sh/) (or [Linuxbrew](https://brew.sh/) on Linux — same install script)

## Install

```bash
# Install Homebrew (same script auto-detects macOS vs Linux)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install mise
curl https://mise.run | sh

# Clone dotfiles
git clone https://github.com/re3turn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Set up dotfiles, CLI tools, and Homebrew packages in one command
mise trust
mise bootstrap --yes
```

## Update

```bash
cd ~/.dotfiles
mise bootstrap --yes
```

Preview changes first with `mise bootstrap --dry-run`.

## Manage CLI tools with mise

Edit `configfiles/mise/config.toml`'s `[tools]` table to bump a version or
add a tool (most GitHub-released CLIs resolve via a short registry name;
tools without one can be added as `"aqua:owner/repo" = "latest"`), then:

```bash
mise install
```

Since `mise.toml`'s `[dotfiles]` table symlinks
`configfiles/mise/config.toml` to `~/.config/mise/config.toml`, every tool
listed there is available globally, not just inside `~/.dotfiles`.

## gitconfig

Add the following to `~/.gitconfig.local`:

```
[user]
    name = YOUR_NAME
    email = YOUR_EMAIL
```
