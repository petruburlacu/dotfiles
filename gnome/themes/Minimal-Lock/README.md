# Minimal Lock Screen Theme

A custom GNOME Shell theme that provides a minimal lock screen experience.

## Features

- **Hidden User Avatar**: Removes the user profile picture/icon from the lock screen
- **Clean Layout**: Just the password input box and nothing else
- **Based on Yaru-purple-dark**: Inherits all other styling from your current theme

## What It Hides

- User profile picture/avatar
- User icon on both lock screen and unlock dialog
- Unnecessary spacing where the avatar was

## What It Keeps

- Everything else from Yaru-purple-dark theme
- All colors, fonts, and styling
- Wallpaper and background
- All other GNOME Shell elements

## Installation

This theme is automatically installed by the `restore-gnome-settings.sh` script.

Manual installation:
```bash
cp -r Minimal-Lock ~/.local/share/themes/
dconf write /org/gnome/shell/extensions/user-theme/name "'Minimal-Lock'"
```

## Requirements

- GNOME Shell
- user-theme extension (enabled)
- Yaru-purple-dark theme (base theme)

## Customization

Edit `gnome-shell/gnome-shell.css` to customize the lock screen further.

## Reverting

To go back to the original theme:
```bash
dconf write /org/gnome/shell/extensions/user-theme/name "'Yaru-purple-dark'"
```
