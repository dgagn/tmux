#/bin/bash

TMP_DIR=/tmp/pane

current_dir=$(tmux display-message -p -F "#{pane_current_path}")
default_dir=$current_dir
echo $current_dir > $TMP_DIR

while [ "$current_dir" != "/" ]; do
    if [ -d "$current_dir/.git" ]; then
        break
    fi
    current_dir=$(dirname "$current_dir")
done

if [ "$current_dir" == "/" ]; then
    current_dir=$default_dir
fi

if [ $(tmux list-panes | wc -l) -eq 1 ]; then
    tmux new-session -d -s scratch 2> /dev/null
    tmux join-pane -p 35 -s scratch
    # if not already current dir cd
    if [ $(tmux display-message -p -F "#{pane_current_path}") != $current_dir ]; then
        tmux send-keys "cd $current_dir" C-m
    fi
else
    tmux new-session -d -s scratch 2> /dev/null
    tmux move-pane -t scratch
fi
