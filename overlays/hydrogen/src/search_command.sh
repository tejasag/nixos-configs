#echo "# this file is located in 'src/search_command.sh'"
#echo "# code for 'h search' goes here"
#echo "# you can edit it freely and regenerate (it will not be overwritten)"
#inspect_args
pkg=${args[package]}
info "Searching the Nix repositories...."
nix search nixpkgs $pkg
