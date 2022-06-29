#!/bin/sh
pushd ~/.dotfiles/
if [[ $1 == "minimal" ]] ; then
   home-manager switch --flake .#minimal
else
   home-manager switch --flake .#tejasagarwal
fi
popd
