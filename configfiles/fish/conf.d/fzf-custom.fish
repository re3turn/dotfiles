set -U FZF_TMUX_HEIGHT "80%"
set -U FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse --border"
set -U FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
set -U FZF_FIND_FILE_OPTS "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
