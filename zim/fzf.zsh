export FZF_DEFAULT_OPTS='--bind ctrl-d:preview-page-down,ctrl-u:preview-page-up'
alias fzf='fzf --preview "bat -p --style=plain --color=always {} | head -100" --height 70%'
export FZF_DEFAULT_OPTS="--height=90% --layout=reverse"
export FZF_DEFAULT_COMMAND='fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist,vendor} --type f'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
# export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'

export fzf_preview_cmd='bat --style=plain --color=always {}'

