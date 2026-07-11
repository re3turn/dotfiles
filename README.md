# dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

## Package management layout

| Layer | Source | Purpose |
| --- | --- | --- |
| `configfiles/mise/config.toml` (`[tools]`) | mise (aqua registry / pipx / npm backends) | CLI tools and language toolchains (gh, ripgrep, fd, bat, delta, starship, mise-managed node/python/rust/go, ...) |
| `mise.toml` (`[dotfiles]`) | mise bootstrap | Symlinks dotfiles into place (`~/.gitconfig`, `~/.config/nvim`, fish config, etc.) |
| `Brewfile` | Homebrew | Foundational/system tools mise doesn't manage (git, fish, bash, curl, wget, tig, ...) and macOS casks |

`mise bootstrap` runs a `[tasks.bootstrap]` task that calls `brew bundle`, so
one command sets up dotfiles, CLI tools, and Homebrew packages together.

## Requirements

- [mise](https://mise.jdx.dev/installing-mise.html)
- [Homebrew](https://brew.sh/) (macOS only — for foundational tools and casks)

## Install

```bash
# Install Homebrew (macOS only)
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
