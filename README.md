# Simple Zsh Configuration

A lightweight and efficient Zsh configuration without Oh My Zsh dependencies. This configuration provides advanced autocompletion, syntax highlighting, and useful defaults while maintaining speed and simplicity.

## Features

- Advanced autocompletion with menu selection
- Case-insensitive completion
- Syntax highlighting
- Command suggestions
- History management
- Directory stack navigation
- Sensible key bindings
- Custom aliases

## Prerequisites

- Zsh shell
- Git
- Package manager (apt, dnf, pacman, or brew)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/mtt-merz/simple-zsh.git ~/.simple-zsh
cd ~/.simple-zsh
```

2. Run the installation script:
```bash
./install.sh
```

The script will:
- Backup your existing ~/.zshrc if present
- Install required dependencies
- Create symbolic links
- Set Zsh as your default shell (optional)

## Manual Installation

If you prefer to install manually:

1. Install required packages:
   - For Ubuntu/Debian:
     ```bash
     sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting
     ```
   - For Fedora:
     ```bash
     sudo dnf install zsh zsh-autosuggestions zsh-syntax-highlighting
     ```
   - For Arch Linux:
     ```bash
     sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting
     ```
   - For macOS:
     ```bash
     brew install zsh zsh-autosuggestions zsh-syntax-highlighting
     ```

2. Copy the configuration files:
   ```bash
   cp zshrc ~/.zshrc
   ```

## Customization

- Edit `~/.zshrc` directly for personal customizations
- Add your custom aliases to `~/.zsh_aliases` if the file exists
- Add machine-specific configurations to `~/.zsh_local` if the file exists

## Uninstallation

Run the uninstallation script:
```bash
./uninstall.sh
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License - See LICENSE file for details