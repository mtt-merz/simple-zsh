#!/bin/bash

# GitHub raw URL for the .zshrc file
URL="https://raw.githubusercontent.com/mtt-merz/simple-zsh/claude/.zshrc"

# Check if the current shell is Zsh
if [ -z "$ZSH_VERSION" ]; then
    echo "Current shell is not Zsh. Switching to Zsh..."

    # Check if Zsh is installed; install if necessary
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing Zsh..."
        
        # Attempt to install Zsh (Debian/Ubuntu-based systems)
        if command -v apt &> /dev/null; then
            sudo apt update && sudo apt install -y zsh
        elif command -v yum &> /dev/null; then
            sudo yum install -y zsh
        elif command -v brew &> /dev/null; then
            brew install zsh
        else
            echo "Unsupported package manager. Install Zsh manually and re-run the script."
            exit 1
        fi
    fi

    # Change the default shell to Zsh if it's not set
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting Zsh as the default shell..."
        chsh -s "$(which zsh)"
    fi

    # Restart the script in Zsh
    echo "Restarting the script in Zsh..."
    exec zsh "$0"  # Re-run this script with Zsh
    exit 0
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

# Download the .zshrc from GitHub
echo "Downloading .zshrc from $URL"
curl -s "$URL" -o "$HOME/.zshrc"

# Confirm completion
if [ $? -eq 0 ]; then
    echo ".zshrc has been downloaded and set up successfully."

    # Source the new .zshrc
    echo "Sourcing the new .zshrc"
    source "$HOME/.zshrc"
else
    echo "Failed to download .zshrc. Please check the URL and try again."
fi