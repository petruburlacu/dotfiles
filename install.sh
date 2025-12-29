#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "Config directory: $CONFIG_DIR"
echo ""

create_symlink() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ]; then
            existing_target=$(readlink -f "$target")
            if [ "$existing_target" = "$source" ]; then
                echo "✓ $target already linked correctly"
                return
            fi
        fi

        echo "⚠ $target already exists"
        read -p "  Backup and replace? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            backup="$target.backup.$(date +%Y%m%d_%H%M%S)"
            mv "$target" "$backup"
            echo "  Backed up to $backup"
        else
            echo "  Skipping $target"
            return
        fi
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "✓ Linked $target -> $source"
}

echo "Installing dotfiles..."
echo ""

# Neovim config
if [ -d "$DOTFILES_DIR/nvim" ]; then
    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
fi

# Add more config symlinks here as you expand
# Example:
# if [ -d "$DOTFILES_DIR/alacritty" ]; then
#     create_symlink "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
# fi

echo ""
echo "Done! Dotfiles installed successfully."
