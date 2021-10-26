mod=${args[module]}

if [ "$mod" == "hm" ] || [ "$mod" == "home-manager" ]; then
    info "Rebuilding Home-Manager configurations...\n"
    RESULT=$(~/.dotfiles/scripts/apply-user.sh 2>&1)
    if echo "${RESULT}" | grep "error"; then
        echo "${RESULT}" | awk 'NR==10{exit} $1 ~ /at.*|[0-9]+|\|/' 
        error 'Could not rebuild the home-manager configurations.'
    else
       success 'Successfully rebuilt and switched the home-manager configurations!'
    fi
else
    info "Rebuilding NixOS configurations...\n"
    RESULT=$(~/.dotfiles/scripts/apply-system.sh 2>&1)
    if echo "${RESULT}" | grep "error"; then
        echo "${RESULT}" | awk '$1 ~ /at.*|[0-9]+|\|/' 
        error 'Could not rebuild the system configurations.'
    else
       success 'Successfully rebuilt and switched the system configurations!'
    fi
fi
