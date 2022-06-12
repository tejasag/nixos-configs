#!/bin/sh
pushd ~/.dotfiles/

if [[ $1 == "minimal" ]] ; then
    nix build .#minimal
else
    nix build .#main
fi

./result/activate
popd
