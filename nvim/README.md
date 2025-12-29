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
- **Syntax Highlighting**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Advanced syntax parsing and highlighting

### Git Integration
- **Git Signs**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Show git changes in gutter
- **Git Interface**: [vim-fugitive](https://github.com/tpope/vim-fugitive) - Complete git interface

### AI Features
- **Claude Integration**: [claudecode.nvim](https://github.com/coder/claudecode.nvim) - Interactive AI assistant with chat interface, code explanations, fixes, and more

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

#### Plugin Management (`<leader>p`)
| Key | Action |
|-----|--------|
| `<leader>p` | Open Lazy plugin manager |

**Lazy.nvim Interface Commands:**
- Press `I` to install missing plugins
- Press `U` to update plugins
- Press `S` to sync (install + update + clean)
- Press `X` to clean unused plugins
- Press `C` to check for updates
- See `[HELP] How to manage plugins` in command palette for detailed guide

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

#### Git Integration (`<leader>g`)
Visual git integration with signs in the gutter and powerful git commands:

**Git Signs:**
- `│` = Added line
- `~` = Changed line
- `_` = Deleted line
- Appears automatically in git repositories

**Gitsigns Commands:**
| Key | Action |
|-----|--------|
| `<leader>gs` | Stage hunk (stage this change) |
| `<leader>gr` | Reset hunk (undo this change) |
| `<leader>gS` | Stage entire buffer |
| `<leader>gR` | Reset entire buffer |
| `<leader>gp` | Preview hunk (see what changed) |
| `<leader>gb` | Blame line (who changed this) |
| `<leader>gB` | Toggle line blame (always show) |
| `<leader>gd` | Diff this file |
| `]h` / `[h` | Next/previous hunk |

**Fugitive Commands:**
| Key | Action |
|-----|--------|
| `<leader>gg` | Git status (interactive) |
| `<leader>gc` | Git commit |
| `<leader>gP` | Git push |
| `<leader>gp` | Git pull |
| `<leader>gl` | Git log |

**Common Workflow:**
```
Review changes:
1. Press <leader>gp to preview each hunk
2. Press ]h to go to next change

Stage and commit:
1. Press <leader>gs to stage hunks
2. Press <leader>gc to commit
3. Press <leader>gP to push
```

#### Claude AI (`<leader>c`)
Interactive AI assistant with chat interface powered by Claude Sonnet 4.5:

**⚠️ READ-ONLY MODE ENABLED**

Claude is configured to provide **suggestions only** and will **NOT modify files directly**. You maintain full control and implement all changes yourself. This ensures:
- ✅ Full control over your codebase
- ✅ Learning by doing
- ✅ No accidental modifications
- ✅ Review before applying changes

**Setup:**
Set your API key in environment variable:
```bash
export ANTHROPIC_API_KEY="your-api-key-here"
```

Add to `~/.bashrc` or `~/.zshrc` to make it permanent.

**Features:**
- 💬 Interactive chat window (side panel)
- ⚡ Streaming responses in real-time
- 📝 Persistent conversation history
- 💡 Suggestions-only mode (no file modifications)
- 📋 Manual code insertion via `<leader>ci`

**Claude Commands:**
| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle Claude chat window |
| `<leader>ce` | Explain code/selection |
| `<leader>cf` | Fix code/selection |
| `<leader>co` | Optimize code/selection |
| `<leader>cr` | Refactor code/selection |
| `<leader>ct` | Generate tests |
| `<leader>cd` | Add documentation |
| `<leader>cn` | New chat conversation |
| `<leader>ci` | Insert response at cursor |
| `<leader>ch` | Show chat history |
| `<leader>cC` | Clear current chat |

**Chat Interface:**
The chat window opens as a side panel (right side, 40% width) with:
- Real-time streaming responses
- Syntax-highlighted code blocks
- Scrollable conversation history
- Easy navigation with Enter to send messages

**How Read-Only Mode Works:**
1. **Ask Claude** for help via chat or quick actions
2. **Claude analyzes** and provides suggestions with code examples
3. **You review** the suggestions in the chat panel
4. **You implement** changes yourself (copy/paste or type)
5. **Optional**: Use `<leader>ci` to insert Claude's code at cursor

**Usage:**
- **Chat mode**: Open with `<leader>cc`, type question, press Enter
- **Quick actions**: Get suggestions for fixes, refactors, tests, etc.
- **Visual mode**: Select code first for targeted suggestions
- **Implementation**: You copy/paste or manually apply all changes

**Examples:**
```
Interactive Chat:
1. Press <leader>cc (chat window opens on right)
2. Type: "How do I handle errors in Python?"
3. Press Enter to send
4. Watch streaming response appear
5. Continue conversation naturally

Explain Code:
1. Select code in visual mode
2. Press <leader>ce
3. Chat window opens with explanation

Fix Bugs:
1. Position cursor on buggy code
2. Press <leader>cf
3. Claude suggests fixes in chat panel

Insert Code:
1. Ask Claude for code in chat
2. Press <leader>ci
3. Response inserted at cursor position

Generate Tests:
1. Open function to test
2. Press <leader>ct
3. Claude generates test cases in chat
4. Use <leader>ci to insert them
```

**Configuration:**
- Mode: READ-ONLY (suggestions only, no autonomous file modifications)
- System prompt: Configured to never edit files directly
- See `CLAUDE.md` in project root for detailed configuration

**Powered by:** Claude Sonnet 4.5 via [claudecode.nvim](https://github.com/coder/claudecode.nvim)

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
- `[HELP] How to use Git integration` - Git signs, staging, commits, and more
- `[HELP] How to manage plugins` - Lazy.nvim, Mason, and Treesitter management
- `[HELP] How to use Claude AI` - AI-powered code assistance

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

### Managing Plugins

**Quick Access:** Press `<leader>p` or run `:Lazy` to open the plugin manager interface.

**Common Tasks:**

1. **Update all plugins:**
   - Press `<leader>p` to open Lazy
   - Press `U` to update all plugins
   - Or run `:Lazy update`

2. **Sync plugins** (install missing + update + clean):
   - Press `<leader>p` to open Lazy
   - Press `S` to sync
   - Or run `:Lazy sync`

3. **Install new plugin:**
   - Add plugin spec to any file in `lua/plugins/`
   - Save the file (Lazy auto-detects changes)
   - Press `<leader>p` and then `I` to install
   - Restart Neovim

4. **Remove plugin:**
   - Delete or comment out plugin from `lua/plugins/`
   - Save the file
   - Press `<leader>p` and then `X` to clean
   - Restart Neovim

**Update Treesitter parsers:**
```
:TSUpdate
```

**Update LSP servers:**
```
:Mason
```
Then press `U` to update installed servers.

For detailed instructions, press `<C-p>` and search for `[HELP] How to manage plugins`.

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

## Advanced Features Setup

### Treesitter (Syntax Highlighting)

Treesitter provides advanced syntax highlighting and code parsing. It's already configured and will automatically install parsers for supported languages.

**Auto-installed languages:**
Lua, Python, JavaScript, TypeScript, Rust, Go, HTML, CSS, JSON, YAML, Markdown, Bash, C, C++

**Additional text objects:**
- `af` / `if` - Function (around/inside)
- `ac` / `ic` - Class (around/inside)
- `aa` / `ia` - Parameter/argument (around/inside)
- `]f` / `[f` - Next/previous function
- `]c` / `[c` - Next/previous class

### Git Integration Setup

Git features work automatically in git repositories:
1. Open a file in a git repo
2. Git signs appear in the gutter automatically
3. Use `<leader>g` commands to interact with git

### Claude AI Setup

1. Get API key from https://console.anthropic.com/
2. Set environment variable:
   ```bash
   echo 'export ANTHROPIC_API_KEY="your-key"' >> ~/.bashrc
   source ~/.bashrc
   ```
3. Restart your shell or run `source ~/.bashrc`
4. Open Neovim and press `<leader>cc` to open the chat window!

**Features:**
- Interactive chat interface with streaming responses
- Code-aware quick actions (suggestions only)
- Persistent conversation history
- Manual code insertion (you control when/what gets inserted)
- **Read-only mode**: Claude never modifies files autonomously

**Read-Only Workflow:**
- Claude provides suggestions and code examples in chat
- You review and decide what to implement
- You manually apply changes (copy/paste or type)
- Full control and learning experience

## Future Additions

Possible enhancements:
- Debugging support (DAP)
- Additional AI providers (GitHub Copilot, etc.)
- More language-specific plugins
- Project management features

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
