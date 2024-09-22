#!/bin/bash

set -eu

echo "Installing Nix..."

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
sudo chmod 666 /dev/tty
if [ -f "$HOME/.bashrc" ]; then
    rm "$HOME/.bashrc"
fi
if [ -f "$HOME/.profile" ]; then
    rm "$HOME/.profile"
fi

if [ -f "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi
if [ -f "$HOME/.zshenv" ]; then
    rm "$HOME/.zshenv"
fi

echo "Installation completed."
