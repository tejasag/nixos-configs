info "Rebuilding NixOS configurations in TESTING MODE...\n"
RESULT=$(~/.dotfiles/scripts/test-system.sh 2>&1)
if echo "${RESULT}" | grep "error"; then
    echo "${RESULT}" | awk '$1 ~ /at.*|[0-9]+|\|/' 
    error 'Could not rebuild the system configurations.'
else
   success 'Successfully rebuilt and switched the system configurations!'
fi
