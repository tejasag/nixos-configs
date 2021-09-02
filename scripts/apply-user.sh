#!/bin/sh
pushd ~/.dotfiles/delphin
nix build .#homeManagerConfigurations.tejasagarwal.activationPackage
./result/activate
popd
