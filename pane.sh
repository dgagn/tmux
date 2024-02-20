#/bin/bash

if [[ $(tmux display-message -p '#S') == 'scratch' ]] 
then
    tmux detach-client
    tmux kill-session -t scratch
    tmux popup -d '#{pane_current_path}' -E -h 35% -w 100% -y 65% 'tmux attach -t scratch || tmux new -s scratch'
else
    tmux kill-session -t scratch
fi
