set FISH_ROOT ~/.config/fish

source $FISH_ROOT/setting/environment.fish
source $FISH_ROOT/setting/command.fish

if test $OSTYPE = "linux_WSL"
    umask 022
end

eval (dircolors -c ~/.dircolors/dircolors.256dark)

