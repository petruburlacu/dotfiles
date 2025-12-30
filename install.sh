#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "🔧 Dotfiles Installation Script"
echo "================================"
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

        echo "⚠  $target already exists"
        read -p "   Backup and replace? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            backup="$target.backup.$(date +%Y%m%d_%H%M%S)"
            mv "$target" "$backup"
            echo "   Backed up to $backup"
        else
            echo "   Skipping $target"
            return
        fi
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "✓ Linked $target -> $source"
}

echo "📦 Installing configuration files..."
echo ""

# Neovim config
if [ -d "$DOTFILES_DIR/nvim" ]; then
    echo "Installing Neovim config..."
    create_symlink "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
fi

# Ghostty config
if [ -d "$DOTFILES_DIR/ghostty/config" ]; then
    echo "Installing Ghostty config..."
    create_symlink "$DOTFILES_DIR/ghostty/config" "$CONFIG_DIR/ghostty"
fi

# Starship config
if [ -f "$DOTFILES_DIR/starship/starship.toml" ]; then
    echo "Installing Starship config..."
    create_symlink "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"
fi

# ZSH config
if [ -f "$DOTFILES_DIR/zsh/.zshrc" ]; then
    echo "Installing ZSH config..."
    create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
fi

# Git config
if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    echo "Installing Git config..."
    create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

# Git global ignore
if [ -f "$DOTFILES_DIR/git/ignore" ]; then
    echo "Installing Git global ignore..."
    mkdir -p "$CONFIG_DIR/git"
    create_symlink "$DOTFILES_DIR/git/ignore" "$CONFIG_DIR/git/ignore"
fi

# Setup secrets file
echo ""
echo "🔐 Setting up secrets file..."
if [ ! -f "$HOME/.zsh_secrets" ]; then
    if [ -f "$DOTFILES_DIR/zsh/.zsh_secrets.example" ]; then
        echo "⚠  Secrets file not found. Creating from example..."
        cp "$DOTFILES_DIR/zsh/.zsh_secrets.example" "$HOME/.zsh_secrets"
        echo "✓ Created ~/.zsh_secrets"
        echo "⚠  IMPORTANT: Edit ~/.zsh_secrets and add your actual API keys!"
    fi
else
    echo "✓ ~/.zsh_secrets already exists"
fi

echo ""
echo "✅ Done! Dotfiles installed successfully."
echo ""
echo "📝 Next steps:"
echo "   1. Edit ~/.zsh_secrets and add your API keys"
echo "   2. Reload your shell: source ~/.zshrc"
echo "   3. Restart your terminal or run: exec zsh"
echo ""
echo "🎨 Optional: Restore GNOME settings"
echo "   To restore GNOME desktop settings, extensions, and wallpaper:"
echo "   $DOTFILES_DIR/gnome/restore-gnome-settings.sh"
echo ""
