#!/bin/sh
pushd ~/.dotfiles/delphin
sudo nixos-rebuild switch --flake .#delphin
popd
