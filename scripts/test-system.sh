#!/bin/sh
pushd ~/.dotfiles/
sudo nixos-rebuild test --flake .#delphin
popd
