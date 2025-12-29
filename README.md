# dotfiles

My minimal configuration for Arch Linux, Neovim, terminal, and more.

## Overview

This repository serves as the single source of truth for my Linux dotfiles. Configuration files are stored here and symlinked to their appropriate locations in `~/.config/`.

## Structure

```
dotfiles/
├── nvim/           # Neovim configuration
├── install.sh      # Installation script
└── README.md       # This file
```

As you add more configurations, create new directories (e.g., `alacritty/`, `tmux/`, `zsh/`) and update the install script.

## Installation

### First Time Setup

1. Clone this repository:
   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   ./install.sh
   ```

The script will:
- Create symlinks from `~/.config/` to the corresponding directories in this repo
- Automatically backup existing configs with a timestamp (e.g., `nvim.backup.20250129_123456`)
- Prompt you before overwriting any existing files

### Adding New Configurations

1. Create a new directory in the repo for your config:
   ```bash
   mkdir -p ~/dotfiles/alacritty
   # Add your config files
   ```

2. Add the symlink logic to `install.sh`:
   ```bash
   if [ -d "$DOTFILES_DIR/alacritty" ]; then
       create_symlink "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
   fi
   ```

3. Run `./install.sh` to create the symlink

### Manual Symlinking (Alternative)

If you prefer to create symlinks manually:

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

## How It Works

The symlink approach means:
- Your actual config files live in this git repository
- `~/.config/nvim` is just a symbolic link pointing to `~/dotfiles/nvim`
- Changes you make in `~/.config/nvim` are actually modifying files in this repo
- You can commit and push changes directly from your config directory

## Updating Configurations

Since your configs are symlinked, any changes you make are automatically reflected in this repository:

```bash
cd ~/dotfiles
git status              # See what configs you've changed
git add nvim/
git commit -m "Update nvim config"
git push
```

## Removing Configurations

To unlink a configuration:

```bash
rm ~/.config/nvim       # Remove the symlink
```

The actual files remain safe in this repository.

## Notes

- The install script will never delete your existing configs without creating a backup first
- Backups are timestamped so you can keep multiple versions
- Each time you run `install.sh`, it checks if symlinks are already correct 
