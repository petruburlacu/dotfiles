# Neovim Configuration

A minimal, modern Neovim configuration built with Lua and lazy.nvim.

## Features

### Core
- **Command Palette**: [legendary.nvim](https://github.com/mrjones2014/legendary.nvim) - **Press Ctrl+P to search ALL commands!**
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) - Fast and modern plugin manager
- **Theme**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) - Soothing pastel theme
- **Keybind Help**: [which-key.nvim](https://github.com/folke/which-key.nvim) - Discover keybindings

### LSP & IDE Features
- **LSP**: [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) - Easy LSP configuration
- **LSP Installer**: [Mason](https://github.com/williamboman/mason.nvim) - Install language servers easily
- **Autocompletion**: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Smart code completion
- **Snippets**: [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Code snippets

### Navigation & Editing
- **File Explorer**: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - Modern file explorer with sidebar
- **Fuzzy Finder**: [fzf-lua](https://github.com/ibhagwan/fzf-lua) - Fast fuzzy finder for files, text, and more
- **Quick Navigation**: [flash.nvim](https://github.com/folke/flash.nvim) - Fast movement with labels
- **Auto Pairs**: [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Automatic bracket/quote pairing
- **Comments**: [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Toggle comments with Ctrl+/
- **Indentation**: [vim-sleuth](https://github.com/tpope/vim-sleuth) - Auto-detect indentation settings
- **Indent Guides**: [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Rainbow indentation guides
- **Last Position**: [nvim-lastplace](https://github.com/ethanholz/nvim-lastplace) - Remember cursor position
- **Statusline**: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Minimal and fast statusline

## Structure

```
nvim/
├── init.lua                  # Entry point and lazy.nvim bootstrap
├── lua/
│   ├── config/
│   │   ├── options.lua       # Neovim core options
│   │   └── keymaps.lua       # General keymappings
│   └── plugins/
│       ├── colorscheme.lua   # Catppuccin theme configuration
│       ├── neo-tree.lua      # File explorer configuration
│       ├── fzf.lua           # Fuzzy finder configuration
│       ├── utilities.lua     # Utility plugins (autopairs, comment, etc.)
│       ├── lualine.lua       # Statusline configuration
│       ├── which-key.lua     # Keybind discovery configuration
│       ├── legendary.lua     # Command palette configuration
│       └── lsp.lua           # LSP, autocompletion, and snippets
└── README.md                 # This file
```

## Installation

1. Ensure Neovim 0.9+ is installed:
   ```bash
   nvim --version
   ```

2. Backup your existing config (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

3. Symlink this configuration (using the dotfiles install script):
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

4. Start Neovim:
   ```bash
   nvim
   ```

5. lazy.nvim will automatically install all plugins on first launch. Wait for installation to complete.

## Key Mappings

### Most Important Keys

| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | Normal/Visual | **COMMAND PALETTE - Search ALL commands!** |
| `<leader><leader>` | Normal/Visual | **COMMAND PALETTE (alternative)** |
| `<Space>` | Normal | Leader key (shows which-key menu) |

### General Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h/j/k/l>` | Normal | Navigate between windows |
| `<C-s>` | Normal | Save file |
| `<Esc>` | Normal | Clear search highlighting |
| `<S-h>` | Normal | Previous buffer |
| `<S-l>` | Normal | Next buffer |
| `<A-j/k>` | Normal/Visual | Move line/selection up/down |
| `<` / `>` | Visual | Indent left/right (stays in visual mode) |
| `p` | Visual | Paste without yanking replaced text |

### Leader Key Mappings

Press `<Space>` (leader) and wait - **which-key** will show available commands!

#### File Operations
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>q` | Quit current window |
| `<leader>Q` | Quit all without saving |

#### Fuzzy Finder (fzf-lua)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Recent files |
| `<leader>fw` | Find word under cursor |
| `<leader>fc` | Find commands |
| `<leader>fk` | Find keymaps |

#### Buffer Management (`<leader>b`)
| Key | Action |
|-----|--------|
| `<leader>bd` | Delete current buffer |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bf` | First buffer |
| `<leader>bl` | Last buffer |
| `<leader>bs` | New buffer (horizontal split) |
| `<leader>bv` | New buffer (vertical split) |
| `<leader>ba` | Add buffer from file |

#### Tab Management (`<leader>t`)
| Key | Action |
|-----|--------|
| `<leader>tt` | New tab |
| `<leader>tc` | Close tab |
| `<leader>to` | Close all other tabs |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |
| `<leader>tf` | First tab |
| `<leader>tl` | Last tab |
| `<leader>tm` | Move tab to position |

#### Navigation (`<leader>n`)
Essential window and file explorer navigation commands:

| Key | Action |
|-----|--------|
| `<leader>nt` | Toggle file explorer |
| `<leader>nf` | Focus file explorer |
| `<leader>ne` | Focus next window |
| `<leader>np` | Focus previous window |
| `<leader>ns` | Split window horizontally |
| `<leader>nv` | Split window vertically |
| `<leader>nc` | Close current window |
| `<leader>no` | Close all other windows |
| `<leader>n=` | Equalize window sizes |

#### Search & Edit (`<leader>s`)
Essential search, copy/paste, and text manipulation commands:

| Key | Action |
|-----|--------|
| `<leader>sw` | Search word under cursor (exact match) |
| `<leader>sW` | Search word under cursor (case-sensitive) |
| `<leader>ss` | Search forward |
| `<leader>sS` | Search backward |
| `<leader>sn` | Next search result |
| `<leader>sN` | Previous search result |
| `<leader>sr` | Search and replace |
| `<leader>sc` | Clear search highlight |
| `<leader>sy` | Copy (yank) line/selection |
| `<leader>sp` | Paste after cursor |
| `<leader>sP` | Paste before cursor |
| `<leader>sa` | Select all text |
| `<leader>sd` | Delete (cut) line/selection |
| `<leader>su` | Uppercase word |
| `<leader>sl` | Lowercase word |
| `<leader>sj` | Join line below |
| `<leader>si` | Indent selection (visual mode) |
| `<leader>sI` | Unindent selection (visual mode) |

#### Motions (`<leader>m`)
Essential cursor movements for navigating code:

| Key | Action |
|-----|--------|
| `<leader>mh` | Start of line |
| `<leader>ml` | End of line |
| `<leader>mk` | Start of file |
| `<leader>mj` | End of file |
| `<leader>mm` | Jump to matching bracket |
| `<leader>m^` | First non-blank character of line |
| `<leader>mw` | Next word |
| `<leader>mb` | Previous word |
| `<leader>me` | End of word |
| `<leader>m{` | Previous paragraph/block |
| `<leader>m}` | Next paragraph/block |
| `<leader>m<` | Previous function/section |
| `<leader>m>` | Next function/section |
| `<leader>mg` | Go to line (type number first) |
| `<leader>mG` | Go to first line |

**Text Objects (for selecting code):**
| Key | Action |
|-----|--------|
| `<leader>mi(` | Select inside parentheses () |
| `<leader>mi{` | Select inside braces {} |
| `<leader>mi[` | Select inside brackets [] |
| `<leader>mi'` | Select inside single quotes '' |
| `<leader>mi"` | Select inside double quotes "" |
| `<leader>ma(` | Select around parentheses (include parens) |
| `<leader>ma{` | Select around braces (include braces) |
| `<leader>ma[` | Select around brackets (include brackets) |
| `<leader>miw` | Select inside word |
| `<leader>maw` | Select around word |

#### LSP - IDE Features (`<leader>l`)
Modern IDE capabilities powered by Language Server Protocol:

**Setup:**
1. Open a code file (e.g., `.py`, `.js`, `.lua`, `.rs`)
2. Run `:Mason` to install language servers
3. LSP will auto-start when you open supported files

**Pre-installed Language Servers:**
- Lua (`lua_ls`)
- Rust (`rust_analyzer`)
- TypeScript/JavaScript (`ts_ls`)
- Python (`pyright`)
- Go (`gopls`)

**Autocompletion:**
| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion menu |
| `<Tab>` | Next suggestion / expand snippet |
| `<S-Tab>` | Previous suggestion |
| `<CR>` | Accept completion |
| `<C-u>` / `<C-d>` | Scroll documentation |

**Navigation:**
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Show all references |
| `gt` | Go to type definition |
| `K` | Show hover documentation |
| `<C-k>` | Show signature help |

**Code Actions:**
| Key | Action |
|-----|--------|
| `<leader>lr` | Rename variable/function |
| `<leader>la` | Code actions (fixes, refactors) |
| `<leader>lf` | Format file |
| `<leader>sf` | Format file or selection |

**Diagnostics (Errors & Warnings):**
| Key | Action |
|-----|--------|
| `<leader>ld` | Show diagnostic details |
| `<leader>lj` | Next diagnostic |
| `<leader>lk` | Previous diagnostic |
| `<leader>lq` | List all diagnostics |
| `<leader>li` | LSP info |

**Common Workflows:**
```
Rename variable:
1. Position cursor on variable
2. Press <leader>lr
3. Type new name
4. Press Enter

Fix error:
1. Position cursor on error
2. Press <leader>la
3. Select fix from menu

View documentation:
1. Position cursor on function/variable
2. Press K
```

### Comments

| Key | Mode | Action |
|-----|------|--------|
| `<C-/>` | Normal | Toggle line comment |
| `<C-/>` | Visual | Toggle comment on selection |
| `gbc` | Normal | Toggle block comment |

Note: On some terminals, `<C-/>` is registered as `<C-_>`.

### Flash Navigation

| Key | Mode | Action |
|-----|------|--------|
| `s` | Normal/Visual/Operator | Jump to location with labels |
| `S` | Normal/Visual/Operator | Jump to treesitter node |
| `r` | Operator | Remote flash |
| `R` | Visual/Operator | Treesitter search |

### File Explorer (Neo-tree)

When in Neo-tree:
| Key | Action |
|-----|--------|
| `<CR>` | Open file/directory |
| `S` | Open in horizontal split |
| `s` | Open in vertical split |
| `t` | Open in new tab |
| `a` | Add file |
| `A` | Add directory |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy to clipboard |
| `x` | Cut to clipboard |
| `p` | Paste from clipboard |
| `R` | Refresh |
| `?` | Show help |
| `q` | Close Neo-tree |

## Never Memorize Commands Again!

### Command Palette (The Most Important Feature)

**Press `<C-p>` or `<leader><leader>` to open the command palette** - a searchable list of EVERYTHING you can do in Neovim:

- ✅ **All keybindings** with descriptions
- ✅ **All commands** (`:w`, `:q`, `:Lazy`, etc.)
- ✅ **All plugin actions**
- ✅ **All functions**
- ✅ **Autocmds**
- ✅ **Builtin Vim commands**

Just type what you want to do (e.g., "save", "quit", "split", "grep") and it will show you everything related!

**Examples:**
```
<C-p> → type "save" → shows all ways to save files
<C-p> → type "split" → shows all splitting commands
<C-p> → type "buffer" → shows all buffer operations
<C-p> → type "help" → shows built-in help guides! ⭐
```

**Built-in Help Guides:**
The command palette includes searchable help documentation:
- `[HELP] Quick reference guide` - Essential key combinations cheat sheet
- `[HELP] How to copy and paste` - Complete copy/paste workflows
- `[HELP] How to manage windows and splits` - Window management guide
- `[HELP] How to search and replace` - Search & replace tutorial
- `[HELP] Understanding tabs vs buffers` - When to use each
- `[HELP] How to select text and code blocks` - Text objects explained
- `[HELP] How to format and indent code` - Formatting and indentation guide
- `[HELP] How to use LSP` - IDE features, autocomplete, go to definition, etc.

Just press `<C-p>` and type "help" to see all guides!

The command palette learns from your usage and shows frequently-used commands first.

### Other Discovery Methods

- **Press `<Space>`** and wait 300ms - **which-key** shows available leader key commands
- **Press `<leader>fk`** - Fuzzy search all keymaps
- **Press `<leader>fc`** - Fuzzy search all Vim commands
- **Press `<leader>fh`** - Search help documentation
- **In Neo-tree, press `?`** - Show file explorer keybindings

### You Don't Need to Remember Anything!

Just press `<C-p>` whenever you think "how do I...?" and search for it. The command palette is your safety net for discovering and executing any action without leaving Neovim or checking documentation.

## Customization

### Changing Options

Edit `lua/config/options.lua` to modify core Neovim settings like:
- Line numbers
- Indentation (tabs vs spaces, size)
- Search behavior
- Appearance (colors, cursor line, column)
- Splits, clipboard, undo settings

### Adding Keymaps

Edit `lua/config/keymaps.lua` to add or modify keybindings.

### Configuring Plugins

Each plugin has its own file in `lua/plugins/`. To modify a plugin's configuration:
1. Find the plugin file (e.g., `lua/plugins/fzf.lua`)
2. Edit the `opts` table or `config` function
3. Restart Neovim

### Adding New Plugins

Create a new file in `lua/plugins/` with the plugin specification:

```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or other lazy-loading trigger
    opts = {
      -- plugin options
    },
  },
}
```

lazy.nvim will automatically detect and install new plugins.

## Getting Started with LSP

The configuration includes full LSP support! Here's how to start using IDE features:

### First Time Setup

1. **Open a code file** (e.g., `test.py`, `main.rs`, `index.js`)

2. **Install language server**:
   ```
   :Mason
   ```
   - Press `i` on a language server to install
   - Press `q` to close Mason

3. **Restart Neovim** or run `:e` to reload the file

4. **Start coding!** You'll now have:
   - Autocompletion as you type
   - Error/warning highlights
   - Go to definition with `gd`
   - Hover docs with `K`
   - Rename with `<leader>lr`

### Supported Languages (Pre-configured)

- **Lua** - Already installed for Neovim config
- **Rust** - `rust_analyzer`
- **TypeScript/JavaScript** - `ts_ls`
- **Python** - `pyright`
- **Go** - `gopls`

To add more languages, open `:Mason` and install the language server!

### Quick Test

Try this to see LSP in action:

1. Create a Python file: `nvim test.py`
2. Type: `def hello():`
3. Press Enter and start typing - you'll see completions!
4. Hover over `def` and press `K` to see documentation

## Future Additions

Possible enhancements:
- Treesitter syntax highlighting (better code parsing)
- Debugging (DAP)
- Git integration (gitsigns)
- AI completion (GitHub Copilot, etc.)

## Troubleshooting

### Plugins not installing

Run `:Lazy` in Neovim and press `I` to install missing plugins.

### which-key not showing

Check if `timeoutlen` is set correctly in options. Press `<Space>` and wait 300ms.

### Neo-tree not opening on startup

This is normal if you open a file directly. Use `<leader>e` to toggle it.

### Colors look wrong

Ensure your terminal supports true colors. Add to your shell config:
```bash
export TERM=xterm-256color
```

## Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Lua Guide for Neovim](https://neovim.io/doc/user/lua-guide.html)
