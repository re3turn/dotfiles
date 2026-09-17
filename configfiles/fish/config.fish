set FISH_ROOT ~/.config/fish

source $FISH_ROOT/setting/environment.fish
source $FISH_ROOT/setting/command.fish
source $FISH_ROOT/setting/abbreviations.fish
source $FISH_ROOT/setting/keybind.fish

for filePath in $FISH_ROOT/setting/local/*.fish
    source $filePath
end

eval (dircolors -c ~/.dircolors/dircolors.256dark)

starship init fish | source

# Drop duplicate PATH entries, keeping the first occurrence so precedence is
# preserved - the same thing `typeset -U path` does in .zshrc. fish has no
# built-in equivalent, and ~/.shell.local/*.sh appends unconditionally, so a
# fish started from inside another shell would re-append what it inherited.
# Must stay last: mise activate (via setting/command.fish) is the final thing
# that touches PATH.
set -l __uniq_path
for __p in $PATH
    contains -- $__p $__uniq_path; or set -a __uniq_path $__p
end
set -gx PATH $__uniq_path
