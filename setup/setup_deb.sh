#!/bin/bash

# Setup script for installing FunkyShellSearch (fss) dependencies and
# configuration

# Navigate to the root directory of the fss project
cd "$(dirname "$0")"/../ || exit
FSS_ROOT_DIR="$(pwd)"

echo "FSS root directory: $FSS_ROOT_DIR"

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install The Silver Searcher (ag)
echo "Installing The Silver Searcher (ag)..."
sudo apt-get install -y silversearcher-ag

# Install fd (fd-find on Debian)
echo "Installing fd (as fd-find)..."
sudo apt-get install -y fd-find

# Creating a symbolic link for fd if it's named fdfind
if command -v fdfind &>/dev/null; then
    echo "Creating a symbolic link for 'fd'..."
	sudo ln -snf "$(which fdfind)" /usr/local/bin/fd
fi

# Install fzf
echo "Installing fzf..."
sudo apt-get install -y fzf

# Install grep (usually pre-installed)
echo "Ensuring grep is installed..."
sudo apt-get install -y grep

# Install pdfgrep
echo "Installing pdfgrep..."
sudo apt-get install -y pdfgrep

# Install additional utilities
echo "Installing additional utilities..."

# Install chafa
sudo apt-get install -y chafa

# Install feh
sudo apt-get install -y feh

# Install mediainfo
sudo apt-get install -y mediainfo

# Install mpv
sudo apt-get install -y mpv

# Install Neovim
sudo apt-get install -y neovim

# Install pdftotext (part of poppler-utils)
sudo apt-get install -y poppler-utils

# Install zathura
sudo apt-get install -y zathura

echo "Installation of dependencies completed."

# Make the scripts in the tools directory executable
echo "Making scripts executable..."
chmod +x "$FSS_ROOT_DIR"/tools/*

# Function to update shell configuration file
update_shell_config() {
    local shell_config="$1"
    echo "Updating $shell_config..."

    # Check if FSS_ROOT_DIR is already set in the configuration
    if ! grep -q "FSS_ROOT_DIR" "$shell_config"; then
        echo "export FSS_ROOT_DIR=\"$FSS_ROOT_DIR\"" >> "$shell_config"
        echo "export PATH=\"$FSS_ROOT_DIR/tools:\$PATH\"" >> "$shell_config"
    else
        echo "FSS_ROOT_DIR already set in $shell_config"
    fi
}

# Update .bashrc and .zshrc if they exist
[ -f "$HOME/.bashrc" ] && update_shell_config "$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && update_shell_config "$HOME/.zshrc"

# Copy the default configuration file to the user's .config/fss directory
echo "Copying the default configuration file to your .config/fss directory..."
mkdir -p "$HOME/.config/fss"
cp "$FSS_ROOT_DIR/config/fss.conf" "$HOME/.config/fss/fss.conf"

echo "Configuration file copied. You can modify it according to your needs at ~/.config/fss/fss.conf"

echo "FunkyShellSearch (fss) setup completed successfully!"
