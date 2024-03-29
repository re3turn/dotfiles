set FISH_ROOT ~/.config/fish

source $FISH_ROOT/setting/environment.fish
source $FISH_ROOT/setting/command.fish
source $FISH_ROOT/setting/abbreviations.fish
source $FISH_ROOT/setting/keybind.fish

for filePath in $FISH_ROOT/setting/local/*.fish
    source $filePath
end

eval (dircolors -c ~/.dircolors/dircolors.256dark)

