#!/bin/bash

set -eu

echo "Installing Nix..."

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
rm $HOME/.bashrc
rm $HOME/.profile
$HOME/.local/bin/chezmoi cd
nix run nixpkgs#home-manager -- switch --flake .#airrnot

echo "Installation completed."
