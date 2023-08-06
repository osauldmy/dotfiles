#!/bin/bash

# Taken from: https://github.com/amracks/tgs

TASK_DIR="$TASKDATA" || "~/.task"
DIRTY=0

while read x; do
  DIRTY=1
done

if [ ${DIRTY} -eq 1 ]; then
  cd "$TASK_DIR"
  git commit -m "Hook Commit" *.data
  # Uncomment if will use with multiple computers
  git pull --rebase -q
  git push -q
fi
