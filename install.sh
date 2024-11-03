#!/bin/bash

BOLD="\033[1m"
BOLD_RESET="\033[0m"
NEW_LINE="\n"

# GitHub raw URL for the configuration files
ZSHRC_URL="https://raw.githubusercontent.com/mtt-merz/simple-zsh/main/.zshrc"
ZSH_ALIASES_URL="https://raw.githubusercontent.com/mtt-merz/simple-zsh/main/.zsh_aliases"

# Backup existing configuration if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
if [ -f "$HOME/.zsh_aliases" ]; then
    echo "Backing up existing .zsh_aliases to .zsh_aliases.bak"
    mv "$HOME/.zsh_aliases" "$HOME/.zsh_aliases.bak"
fi

# Download the configuration from GitHub
echo "Downloading configuration files from GitHub"
curl -s "$ZSHRC_URL" -o "$HOME/.zshrc"
curl -s "$ZSH_ALIASES_URL" -o "$HOME/.zsh_aliases"

echo "The configuration has been downloaded and set up successfully."

# Source the new configuration
echo "Sourcing the new configuration"
source "$HOME/.zshrc"

# Create .zsh_local if it doesn't exist
echo "Creating .zsh_local if it doesn't exist"
if [ ! -f "$HOME/.zsh_local" ]; then
    touch "$HOME/.zsh_local"
fi

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
