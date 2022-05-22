#!/bin/sh
pushd ~/.dotfiles/

if [[ $1 == "minimal" ]] ; then
    nix build .#homeManagerConfigurations.minimal.activationPackage
else
    nix build .#homeManagerConfigurations.tejasagarwal.activationPackage
fi

./result/activate
popd
