#/bin/bash

# TMP_DIR=/tmp/pane
#
# current_dir=$(tmux display-message -p -F "#{pane_current_path}" 2> /dev/null)
# default_dir=$current_dir
# echo $current_dir > $TMP_DIR
#
# while [ "$current_dir" != "/" ]; do
#     if [ -d "$current_dir/.git" ]; then
#         break
#     fi
#     current_dir=$(dirname "$current_dir")
# done
#
# if [ "$current_dir" == "/" ]; then
#     current_dir=$default_dir
# fi
#
# tmux new-session -d -s scratch
# if [ $(tmux list-panes | wc -l) -eq 1 ]; then
#     tmux join-pane -p 35 -s scratch
#     tmux kill-pane -t scratch.1
#     tmux new-session -d -s scratch
#
#     if [ $(tmux display-message -p -F "#{pane_current_path}" 2> /dev/null) != $current_dir ]; then
#         tmux send-keys "cd $current_dir" C-m 2> /dev/null
#     fi
# else
#     tmux join-pane -t scratch.1
# fi

if [ "${PANE_COUNT}" = 1 ]; then
    tmux split-window -c "#{pane_current_path}"
  elif [ -n "${PANE_ZOOMED}" ]; then
    tmux select-pane -t:.-
  else
    tmux resize-pane -Z -t1
  fi
