# Intentionally empty.
#
# fish loads conf.d files by basename and only the first match wins, with
# $__fish_config_dir/conf.d taking precedence over the vendor directories.
# This file therefore shadows Homebrew's
# /opt/homebrew/opt/mise/share/fish/vendor_conf.d/mise-activate.fish, which
# would otherwise run `mise activate fish` a second time (~40ms, including a
# full `mise hook-env`) on every shell start.
#
# mise is activated once from setting/command.fish, which is guarded by
# `command -s mise` and therefore also works where mise is not installed via
# Homebrew. If you remove that, mise stops being activated entirely - delete
# this file too.
