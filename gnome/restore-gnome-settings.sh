#!/bin/bash

# GNOME Settings Restoration Script
# This script restores GNOME desktop and extension settings from dotfiles

set -e

GNOME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🎨 Restoring GNOME Settings"
echo "==========================="
echo ""

# Function to load dconf settings
load_settings() {
    local conf_file="$1"
    local dconf_path="$2"

    if [ -f "$conf_file" ]; then
        echo "✓ Loading $conf_file -> $dconf_path"
        dconf load "$dconf_path" < "$conf_file"
    else
        echo "⚠  Warning: $conf_file not found, skipping..."
    fi
}

# Restore desktop settings
echo "📱 Restoring desktop settings..."
load_settings "$GNOME_DIR/gnome-desktop.conf" "/org/gnome/desktop/"

# Restore shell settings
echo "🐚 Restoring shell settings..."
load_settings "$GNOME_DIR/gnome-shell.conf" "/org/gnome/shell/"

# Restore extension settings
echo "🔌 Restoring extension settings..."
load_settings "$GNOME_DIR/extensions/all-extensions.conf" "/org/gnome/shell/extensions/"

# Install custom themes
echo "🎨 Installing custom themes..."
if [ -d "$GNOME_DIR/themes" ]; then
    mkdir -p "$HOME/.local/share/themes"
    for theme_dir in "$GNOME_DIR/themes"/*; do
        if [ -d "$theme_dir" ]; then
            theme_name=$(basename "$theme_dir")
            cp -r "$theme_dir" "$HOME/.local/share/themes/"
            echo "  ✓ Installed theme: $theme_name"
        fi
    done
else
    echo "⚠  No custom themes found, skipping..."
fi

# Set wallpaper
echo "🖼️  Setting wallpaper..."
if [ -f "$GNOME_DIR/wallpapers/wallpaper.png" ]; then
    # Copy wallpaper to backgrounds directory
    mkdir -p "$HOME/.local/share/backgrounds"
    cp "$GNOME_DIR/wallpapers/wallpaper.png" "$HOME/.local/share/backgrounds/wallpaper.png"

    # Set both light and dark wallpapers
    gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.local/share/backgrounds/wallpaper.png"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.local/share/backgrounds/wallpaper.png"
    echo "✓ Wallpaper set"
else
    echo "⚠  Warning: Wallpaper not found, skipping..."
fi

# Enable extensions
echo "🔌 Enabling extensions..."
if [ -f "$GNOME_DIR/enabled-extensions.txt" ]; then
    while IFS= read -r extension; do
        echo "  Enabling: $extension"
        gnome-extensions enable "$extension" 2>/dev/null || echo "    ⚠  Could not enable $extension (might not be installed)"
    done < "$GNOME_DIR/enabled-extensions.txt"
else
    echo "⚠  Warning: enabled-extensions.txt not found, skipping..."
fi

echo ""
echo "✅ GNOME settings restored!"
echo ""
echo "📝 Note: You may need to:"
echo "   1. Log out and log back in for all changes to take effect"
echo "   2. Install missing GNOME extensions manually"
echo "   3. Restart GNOME Shell (Alt+F2, type 'r', press Enter)"
echo ""
