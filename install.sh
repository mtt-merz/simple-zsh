#!/bin/bash

# GitHub raw URL for the .zshrc file
URL="https://raw.githubusercontent.com/mtt-merz/simple-zsh/main/.zshrc"

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

# Download the .zshrc from GitHub
echo "Downloading .zshrc from $URL"
curl -s "$URL" -o "$HOME/.zshrc"

echo ".zshrc has been downloaded and set up successfully."

# Source the new .zshrc
echo "Sourcing the new .zshrc"
source "$HOME/.zshrc"else

# Download and source zsh-autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Donwload and source zsh-syntaz-highlighting
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
