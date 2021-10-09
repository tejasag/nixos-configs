#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
#!/bin/sh
pushd ~/.dotfiles/delphin
sudo nixos-rebuild switch --flake .#delphin
popd
