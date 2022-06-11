#!/usr/bin/env bash

kill -9 $(pgrep -f 'polybar') >/dev/null 2>&1

polybar-msg cmd quit >/dev/null 2>&1

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Launching polybar"

polybar -c ./polybar.ini main 
