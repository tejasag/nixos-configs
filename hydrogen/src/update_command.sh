input=${args[input]}

pushd ~/.dotfiles
if [ $input ]; then
    info "Updating the '$input' input..."
    RESULT=$(nix flake lock --impure --update-input $input)
    success "Successfully updated the '$input' flake!"
else
    info "Updating all inputs..."
    RESULT=$(nix flake update --impure)
    success "Successfully updated all inputs!"
fi
popd






