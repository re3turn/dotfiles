#################################
# dircolors [FILE]

function dircolors
    eval (command dircolors -c $argv | sed -e 's/setenv/set -xg/')
end

