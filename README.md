# dotfiles

Managed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html).

## Package management layout

| Layer | Source | Purpose |
| --- | --- | --- |
| `configfiles/mise/config.toml` (`[tools]`) | mise (aqua registry / cargo / pipx / npm backends) | CLI tools and language toolchains (gh, ripgrep, fd, bat, delta, starship, mise-managed node/python/rust/go, ...). Cross-platform - mise resolves the right binary per OS/arch automatically |
| `mise.toml` (`[dotfiles]`) | mise bootstrap | Symlinks dotfiles into place (`~/.gitconfig`, `~/.config/nvim`, fish config, etc.) |
| `Brewfile` | Homebrew | macOS only: foundational tools mise doesn't manage (git, fish, bash, curl, wget, tig, eza, ...), GNU tool replacements for BSD tools, and casks |
| `apt-packages.txt` | apt | Linux only (Ubuntu / Raspberry Pi OS): the same foundational tools as `Brewfile`, by apt package name |

`eza` is the one exception split across two of these: it comes from
`Brewfile` on macOS, but from `configfiles/mise/config.toml`'s
`"aqua:eza-community/eza" = { os = "linux" }` on Linux, since apt doesn't
carry it on Debian bookworm (Raspberry Pi OS) and its GitHub releases ship
no macOS binaries.

`mise bootstrap` runs a `[tasks.bootstrap]` task that detects the OS: on
macOS it runs `brew bundle --file=./Brewfile`; on Linux, if `apt-get` is
available (Ubuntu, Raspberry Pi OS), it installs the packages listed in
`apt-packages.txt`. One command sets up dotfiles, CLI tools, and OS
packages together, on either platform. Other Linux distros (Fedora, Arch,
...) aren't handled - `apt-get` support only targets Debian-family systems.

A couple of `[dotfiles]` entries (`~/.config/ghostty`,
`~/.local/bin/brew-safe-upgrade`) are macOS-specific tools but get symlinked
on every platform anyway, since `[dotfiles]` has no OS-conditional syntax -
they're simply unused on Linux.

## Requirements

- [mise](https://mise.jdx.dev/installing-mise.html)
- [Homebrew](https://brew.sh/) (macOS) or `apt` (Ubuntu / Raspberry Pi OS)
- git 2.35+ (`.gitconfig` sets `merge.conflictstyle = zdiff3`). If apt's git
  is older, upgrade it from the git-core PPA on Ubuntu:
  `sudo add-apt-repository ppa:git-core/ppa && sudo apt-get update && sudo apt-get install git`

## Install

```bash
# Install Homebrew (macOS only - Linux uses apt directly, no extra install step)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install mise
curl https://mise.run | sh

# Clone dotfiles
git clone https://github.com/re3turn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Set up dotfiles, CLI tools, and OS packages in one command
mise trust
mise bootstrap --yes
```

## Update

Sync dotfiles, install any newly added `[tools]`/`Brewfile`/`apt-packages.txt`
entries:

```bash
cd ~/.dotfiles
mise bootstrap --yes
```

Preview changes first with `mise bootstrap --dry-run`. This does not bump
the version of tools/packages already installed - see below.

**Upgrade mise-managed CLI tools** (bumps every `"latest"` entry in
`configfiles/mise/config.toml` and updates the lockfile):

```bash
mise upgrade
git add configfiles/mise/mise.lock
git commit -m "chore: Update mise.lock"
```

**Upgrade OS packages** (outside `mise.lock`'s scope - Homebrew/apt track
whatever's current, there's no pinning):

```bash
# macOS
brew update && brew upgrade

# Linux (Ubuntu / Raspberry Pi OS)
sudo apt-get update && sudo apt-get upgrade
```

## Manage CLI tools with mise

Edit `configfiles/mise/config.toml`'s `[tools]` table to bump a version or
add a tool (most GitHub-released CLIs resolve via a short registry name;
tools without one can be added as `"aqua:owner/repo" = "latest"`), then:

```bash
mise install
mise lock -g
```

Since `mise.toml`'s `[dotfiles]` table symlinks
`configfiles/mise/config.toml` to `~/.config/mise/config.toml`, every tool
listed there is available globally, not just inside `~/.dotfiles`.

`configfiles/mise/mise.lock` pins exact versions, checksums, and download
URLs for every `[tools]` entry across every platform, so `mise install` on
any machine resolves identical versions instead of whatever is newest at
the time. It only covers `[tools]` - `Brewfile` and `apt-packages.txt`
still install whatever Homebrew/apt currently have. Regenerate it with
`mise lock -g` after changing `[tools]`.

## gitconfig

Add the following to `~/.gitconfig.local`:

```
[user]
    name = YOUR_NAME
    email = YOUR_EMAIL
```
