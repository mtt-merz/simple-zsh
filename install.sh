#!/bin/bash

BOLD="\033[1m"
BOLD_RESET="\033[0m"
NEW_LINE="\n"

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
source "$HOME/.zshrc"

# Download and source zsh-autosuggestions
echo "Downloading and sourcing zsh-autosuggestions"
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Donwload and source zsh-syntaz-highlighting
echo "Downloading and sourcing zsh-syntax-highlighting"
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Print success message
echo "${NEW_LINE}${BOLD}Installation complete!${BOLD_RESET}"
echo "Please restart your terminal for the changes to take effect."

echo "${NEW_LINE}To further customize your shell, you can:
- Edit your ~/.zshrc directly to change the default settings
- Add your custom aliases to ~/.zsh_aliases to keep them organized
- Add machine-specific configurations to ~/.zsh_local to keep them separate"
