# Dotfiles

This repository serves as the single source of truth for my Linux development environment. Configuration files are stored here and symlinked to their appropriate locations.

## 📦 What's Included

- **Neovim** - Complete Neovim configuration with LSP, Treesitter, and modern plugins
- **Ghostty** - Terminal emulator configuration
- **Starship** - Cross-shell prompt configuration
- **Zsh** - Shell configuration with Oh My Zsh integration
- **Git** - Global git configuration and ignore patterns
- **GNOME** - Desktop environment settings, extensions, and wallpaper
- **Secrets Management** - Secure handling of API keys and tokens

## 📁 Structure

```
dotfiles/
├── nvim/                    # Neovim configuration
│   ├── init.lua            # Entry point
│   ├── lua/
│   │   ├── config/         # Core config (options, keymaps)
│   │   └── plugins/        # Plugin configurations
│   └── lazy-lock.json      # Plugin version lock file
├── ghostty/                 # Ghostty terminal config
│   └── config/
├── starship/                # Starship prompt config
│   └── starship.toml
├── zsh/                     # ZSH configuration
│   ├── .zshrc              # Main ZSH config
│   └── .zsh_secrets.example # Secrets template
├── git/                     # Git configuration
│   ├── .gitconfig          # Global git config
│   └── ignore              # Global gitignore
├── gnome/                   # GNOME desktop environment
│   ├── extensions/         # Extension settings
│   ├── wallpapers/         # Desktop wallpapers
│   ├── gnome-desktop.conf  # Desktop settings
│   ├── gnome-shell.conf    # Shell settings
│   ├── enabled-extensions.txt
│   └── restore-gnome-settings.sh
├── install.sh               # Installation script
├── .gitignore              # Git ignore rules
└── README.md               # This file
```

## 🚀 Installation

### First Time Setup

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/Development/git/dotfiles
   cd ~/Development/git/dotfiles
   ```

2. **Run the installation script:**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. **Set up your secrets:**
   ```bash
   # Edit the secrets file with your actual API keys
   nano ~/.zsh_secrets
   ```

4. **Reload your shell:**
   ```bash
   source ~/.zshrc
   # or
   exec zsh
   ```

### What the Install Script Does

The `install.sh` script will:
- Create symlinks from `~/.config/` and `~/` to the corresponding files/directories in this repo
- Automatically backup existing configs with timestamps (e.g., `.zshrc.backup.20250130_143022`)
- Prompt you before overwriting any existing files
- Set up the secrets file from the template if it doesn't exist

## 🔐 Secrets Management

API keys and other sensitive information are **NOT** stored in this repository. Instead:

1. **Secrets are stored locally** in `~/.zsh_secrets` (gitignored)
2. **A template is provided** at `zsh/.zsh_secrets.example` showing the format
3. **The .zshrc sources secrets** automatically if the file exists

### Setting Up Secrets

```bash
# Copy the example file
cp ~/Development/git/dotfiles/zsh/.zsh_secrets.example ~/.zsh_secrets

# Edit and add your actual API keys
nano ~/.zsh_secrets
```

### Example Secrets File

```bash
# ~/.zsh_secrets
export ANTHROPIC_API_KEY="sk-ant-api03-..."
export OPENAI_API_KEY="sk-..."
export GITHUB_TOKEN="ghp_..."
```

**Important:**
- Never commit `~/.zsh_secrets` to version control
- The `.gitignore` file is configured to exclude it
- Update `.zsh_secrets.example` if you add new secrets (without actual values)

## 🔄 How Symlinks Work

The symlink approach means:
- Your actual config files live in this git repository
- `~/.config/nvim` is a symbolic link pointing to `~/Development/git/dotfiles/nvim`
- Changes you make in `~/.config/nvim` are actually modifying files in this repo
- You can commit and push changes directly from your config directory

**Example:**
```bash
# These two paths point to the same files:
ls ~/.config/nvim/init.lua
ls ~/Development/git/dotfiles/nvim/init.lua
```

## 📝 Daily Workflow

### Making Changes

Edit your configs as normal in `~/.config/`:
```bash
nvim ~/.config/nvim/lua/plugins/lsp.lua
```

### Committing Changes

Since configs are symlinked, changes are automatically in the repo:
```bash
cd ~/Development/git/dotfiles
git status              # See what you've changed
git add .
git commit -m "feat: add new LSP server"
git push
```

## ➕ Adding New Configurations

### 1. Add Config to Dotfiles

```bash
# Example: Adding tmux config
mkdir -p ~/Development/git/dotfiles/tmux
cp ~/.tmux.conf ~/Development/git/dotfiles/tmux/
```

### 2. Update install.sh

Add symlink logic for your new config:

```bash
# Tmux config
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
    echo "Installing Tmux config..."
    create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
fi
```

### 3. Run Install Script

```bash
cd ~/Development/git/dotfiles
./install.sh
```

### 4. Update README

Document your new configuration in this README!

## 🛠️ Prerequisites

Before using these dotfiles, ensure you have:

- **Neovim** 0.10+ - `sudo apt install neovim` or build from source
- **Git** - For cloning and managing dotfiles
- **Oh My Zsh** - Run: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- **Starship** - `curl -sS https://starship.rs/install.sh | sh`
- **Ghostty** - Download from https://ghostty.org
- **Node.js** - For some Neovim LSP servers (via nvm)
- **Rust** - For some tools and LSP servers
- **Python** - For some Neovim plugins

### ZSH Plugins

The .zshrc uses these Oh My Zsh plugins (install them):

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

## 🔧 Troubleshooting

### Symlink Already Exists

If you get "already exists" errors:
- The script will offer to backup and replace
- Or manually remove: `rm ~/.config/nvim` (if it's a symlink)

### Secrets Not Loading

Check if secrets file exists and is sourced:
```bash
ls -la ~/.zsh_secrets
cat ~/.zshrc | grep zsh_secrets
```

### Config Not Updating

If changes don't appear to work:
```bash
# Check if symlink is correct
ls -la ~/.config/nvim

# Should show: ~/.config/nvim -> /home/user/Development/git/dotfiles/nvim
```

## 🗑️ Removing Configurations

To unlink a configuration:

```bash
# Remove the symlink (files stay safe in repo)
rm ~/.config/nvim

# Or restore from backup
mv ~/.config/nvim.backup.20250130_143022 ~/.config/nvim
```

## 📚 Configuration Details

### Neovim

- **Plugin Manager:** lazy.nvim
- **LSP:** Native Neovim LSP with mason.nvim for server management
- **Completion:** nvim-cmp with multiple sources
- **Treesitter:** Syntax highlighting and code understanding
- **File Explorer:** neo-tree.nvim
- **Fuzzy Finder:** fzf-lua
- **Git Integration:** gitsigns, fugitive
- **AI Integration:** Claude Code integration

Key features:
- Language servers for Lua, TypeScript, Python, Rust
- Automatic treesitter parser installation
- Beautiful Catppuccin theme
- Vim-like file navigation in Neo-tree (`h`/`l`)

### Zsh

- **Framework:** Oh My Zsh
- **Theme:** Starship (overrides Oh My Zsh theme)
- **Plugins:**
  - `git` - Git aliases and functions
  - `zsh-autosuggestions` - Fish-like suggestions
  - `fast-syntax-highlighting` - Command syntax highlighting

### Starship

Cross-shell prompt with:
- Git status integration
- Directory truncation
- Command duration display
- Custom styling

### Ghostty

Terminal emulator configuration with:
- Custom fonts and colors
- Performance optimizations
- Keybinding customizations

### Git

Global git configuration including:
- User name and email
- Default branch (main)
- Global gitignore patterns (Claude settings, etc.)

### GNOME Desktop

Complete desktop environment configuration:
- **Extensions:** blur-my-shell, user-theme, tiling-assistant, clipboard-indicator, Vitals, and more
- **Desktop Settings:** Wallpaper, themes, interface preferences
- **Shell Settings:** Keybindings, launcher, and workspace configuration
- **Restoration Script:** Automated script to restore all GNOME settings

**Installed Extensions:**
- blur-my-shell - Beautiful blur effects
- user-theme - Custom shell themes
- tiling-assistant - Advanced window tiling
- clipboard-indicator - Clipboard manager
- Vitals - System monitoring
- And more...

**To restore GNOME settings:**
```bash
cd ~/Development/git/dotfiles
./gnome/restore-gnome-settings.sh
```

## 🤝 Contributing

This is a personal dotfiles repository, but feel free to:
- Fork it and adapt it to your needs
- Open issues if you find bugs
- Suggest improvements via pull requests

## 📄 License

This repository is available for personal use. Feel free to use it as inspiration for your own dotfiles!

## 🙏 Acknowledgments

- Neovim community for excellent plugins
- Oh My Zsh project
- Starship prompt project
- Catppuccin theme maintainers
