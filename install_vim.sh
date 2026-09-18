#!/bin/bash

# Part D: Package management scripts

if dpkg -l | grep -q "^ii\s*vim"; then
    echo "Vim is already installed"
else
    echo "Installing Vim..."
    sudo apt update && sudo apt install -y vim
fi

