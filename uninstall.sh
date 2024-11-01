#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Remove symbolic links and restore backup
restore_backup() {
    echo -e "${YELLOW}Removing current configuration...${NC}"
    
    # Remove current .zshrc
    rm -f ~/.zshrc
    
    # Restore most recent backup if it exists
    backup_file=$(ls -t ~/.zshrc.backup.* 2>/dev/null | head -n1)
    if [ -n "$backup_file" ]; then
        mv "$backup_file" ~/.zshrc
        echo -e "${GREEN}Previous configuration restored${NC}"
    fi
}

# Clean up custom files
cleanup_custom_files() {
    echo -e "${YELLOW}Would you like to remove custom files (~/.zsh_aliases, ~/.zsh_local)? (y/n)${NC}"
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        rm -f ~/.zsh_aliases ~/.zsh_local
        echo -e "${GREEN}Custom files removed${NC}"
    fi
}

# Main uninstallation process
main() {
    echo -e "${GREEN}Starting uninstallation...${NC}"
    
    restore_backup
    cleanup_custom_files
    
    echo -e "${GREEN}Uninstallation complete!${NC}"
    echo -e "${YELLOW}Note: Dependencies (zsh, zsh-autosuggestions, zsh-syntax-highlighting) were not removed.${NC}"
    echo -e "${YELLOW}You can remove them using your package manager if desired.${NC}"
}

main