return {
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    dependencies = { "kkharji/sqlite.lua" },
    keys = {
      {
        "<C-p>",
        "<cmd>Legendary<cr>",
        mode = { "n", "v" },
        desc = "Open command palette",
      },
      {
        "<leader><leader>",
        "<cmd>Legendary<cr>",
        mode = { "n", "v" },
        desc = "Open command palette",
      },
    },
    opts = {
      -- Include builtins by default
      include_builtin = true,
      include_legendary_cmds = true,

      -- Automatically add which-key tables
      auto_register_which_key = true,

      -- Select from these with fzf or native vim.ui.select
      select_prompt = "Command Palette",

      -- Settings for different item types
      keymaps = {
        -- Will show all keymaps
      },
      commands = {
        -- Will show all commands including plugin commands
      },
      funcs = {
        -- Will show registered functions
      },
      autocmds = {
        -- Will show autocommands
      },

      -- Scratchpad for temporary notes
      scratchpad = {
        view = "float",
        results_view = "float",
        keep_contents = true,
      },

      -- Sort items by frequency of use
      sort = {
        frecency = {
          db_root = vim.fn.stdpath("data") .. "/legendary/",
          max_timestamps = 10,
        },
      },

      -- Extensions
      extensions = {
        lazy_nvim = true,
        which_key = {
          auto_register = true,
          do_binding = false,
          use_groups = true,
        },
      },
    },
    config = function(_, opts)
      require("legendary").setup(opts)

      -- Add custom commands to legendary
      require("legendary").commands({
        {
          ":Lazy",
          description = "Open Lazy plugin manager",
        },
        {
          ":Mason",
          description = "Open Mason LSP installer (when LSP is configured)",
        },
        {
          ":checkhealth",
          description = "Check Neovim health",
        },
        {
          ":LspInfo",
          description = "Show LSP information (when LSP is configured)",
        },
        {
          ":w",
          description = "Save current file",
        },
        {
          ":wq",
          description = "Save and quit",
        },
        {
          ":q!",
          description = "Quit without saving",
        },
        {
          ":split",
          description = "Split window horizontally",
        },
        {
          ":vsplit",
          description = "Split window vertically",
        },
        {
          ":tabnew",
          description = "Open new tab",
        },
        {
          ":only",
          description = "Close all windows except current",
        },
      })

      -- Add helpful workflow functions
      require("legendary").funcs({
        -- Basic operations
        {
          function()
            vim.cmd("nohlsearch")
          end,
          description = "Clear search highlighting",
        },
        {
          function()
            local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })
            print("Open buffers: " .. buf_count)
          end,
          description = "Count open buffers",
        },
        {
          function()
            vim.cmd("messages")
          end,
          description = "Show message history",
        },

        -- Help and documentation
        {
          function()
            local help_text = [[
QUICK REFERENCE - Key Combinations:

Essential Navigation:
  <Space>       - Leader key (shows command menu)
  <C-p>         - Command Palette (search everything!)
  <C-h/j/k/l>   - Move between windows
  <S-h/l>       - Previous/Next buffer

File Explorer:
  <Space> e     - Toggle file explorer
  <Space> n f   - Focus file explorer

Find (Fuzzy Search):
  <Space> f f   - Find files
  <Space> f g   - Search text (grep)
  <Space> f b   - Find buffers

Common Edits:
  <C-/>         - Toggle comment
  <Space> s w   - Search word under cursor
  <Space> s r   - Search and replace

Motions:
  <Space> m m   - Jump to matching bracket
  <Space> m h/l - Start/End of line
  <Space> m k/j - Start/End of file

Press any key to close...
]]
            vim.notify(help_text, vim.log.levels.INFO)
          end,
          description = "[HELP] Quick reference guide",
        },
        {
          function()
            local copy_paste_help = [[
COPY/PASTE GUIDE:

Copying (Yank):
  yy            - Copy current line
  <Space> s y   - Copy line (leader way)
  (visual) y    - Copy selection
  yiw           - Copy word under cursor
  yi(           - Copy inside parentheses

Pasting:
  p             - Paste after cursor
  P             - Paste before cursor
  <Space> s p   - Paste after (leader way)

System Clipboard:
  "+y           - Copy to system clipboard
  "+p           - Paste from system clipboard
  (Note: clipboard = "unnamedplus" is enabled)

Deleting (also copies to register):
  dd            - Delete (cut) line
  dw            - Delete word
  di(           - Delete inside parentheses

Press any key to close...
]]
            vim.notify(copy_paste_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to copy and paste",
        },
        {
          function()
            local window_help = [[
WINDOW MANAGEMENT:

Splitting:
  <Space> n s   - Split horizontal
  <Space> n v   - Split vertical
  :split        - Split horizontal
  :vsplit       - Split vertical

Navigation:
  <C-h/j/k/l>   - Move between windows
  <Space> n e   - Focus next window
  <Space> n p   - Focus previous window
  <C-w>w        - Cycle through windows

Closing:
  <Space> n c   - Close current window
  <Space> n o   - Close all other windows
  :only         - Close all but current

Resizing:
  <C-Up/Down>   - Resize height
  <C-Left/Right>- Resize width
  <Space> n =   - Equalize sizes

Press any key to close...
]]
            vim.notify(window_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to manage windows and splits",
        },
        {
          function()
            local search_help = [[
SEARCH & REPLACE:

Basic Search:
  /pattern      - Search forward
  ?pattern      - Search backward
  n             - Next result
  N             - Previous result

Search Word Under Cursor:
  *             - Search forward
  #             - Search backward
  <Space> s w   - Search (exact match)
  <Space> s W   - Search (case-sensitive)

Replace:
  :%s/old/new/g     - Replace all in file
  :%s/old/new/gc    - Replace with confirmation
  <Space> s r       - Start replace command
  (visual) :s/old/new/g - Replace in selection

Clear Highlights:
  <Esc>         - Clear search highlight
  <Space> s c   - Clear highlight (leader)

Press any key to close...
]]
            vim.notify(search_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to search and replace",
        },
        {
          function()
            local tab_buffer_help = [[
TABS VS BUFFERS:

Buffers (recommended for most workflows):
  <Space> f b   - List all buffers
  <S-h/l>       - Previous/Next buffer
  <Space> b n/p - Next/Previous buffer
  <Space> b d   - Delete buffer

Tabs (for different workspaces):
  <Space> t t   - New tab
  <Space> t n/p - Next/Previous tab
  <Space> t c   - Close tab
  gt / gT       - Next/Previous tab (Vim way)

Tip: Buffers are like open files, tabs are like
workspaces. Most people use buffers more often!

Press any key to close...
]]
            vim.notify(tab_buffer_help, vim.log.levels.INFO)
          end,
          description = "[HELP] Understanding tabs vs buffers",
        },
        {
          function()
            local selection_help = [[
TEXT SELECTION & OBJECTS:

Visual Mode:
  v             - Character-wise visual
  V             - Line-wise visual
  <C-v>         - Block-wise visual

Select Inside (i):
  vi(           - Inside parentheses
  vi{           - Inside braces
  vi[           - Inside brackets
  vi"           - Inside quotes
  viw           - Inside word
  <Space> m i ( - Inside parens (leader)

Select Around (a):
  va(           - Around parentheses (includes parens)
  va{           - Around braces
  vaw           - Around word
  <Space> m a ( - Around parens (leader)

Common Workflow:
  1. Position cursor inside text
  2. Type vi( or va{
  3. Text is selected!
  4. Then: y (copy), d (delete), c (change)

Press any key to close...
]]
            vim.notify(selection_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to select text and code blocks",
        },
        {
          function()
            local format_indent_help = [[
FORMATTING & INDENTING:

Indenting Selection:
  (visual) >    - Indent right
  (visual) <    - Indent left
  <Space> s i   - Indent selection (stays in visual)
  <Space> s I   - Unindent selection
  >>            - Indent current line right
  <<            - Indent current line left

Auto-Indent:
  =             - Auto-indent current line
  (visual) =    - Auto-indent selection
  gg=G          - Auto-indent entire file

Formatting (requires LSP):
  <Space> s f   - Format file or selection
  (LSP will format according to language rules)

Tab Settings:
  Auto-detected by vim-sleuth plugin
  Or set in lua/config/options.lua

Common Workflow:
  1. Select text in visual mode (V or v)
  2. Press > or < to indent
  3. Press . to repeat indentation
  4. Or use <Space>sf to auto-format

Press any key to close...
]]
            vim.notify(format_indent_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to format and indent code",
        },
        {
          function()
            local lsp_help = [[
LSP (LANGUAGE SERVER PROTOCOL) - IDE Features:

Setup:
  1. Open a code file (e.g., .py, .js, .lua)
  2. LSP auto-starts if language server installed
  3. Use :Mason to install language servers
  4. Use :LspInfo to check status

Autocompletion:
  <C-Space>     - Trigger completion
  <Tab>         - Next suggestion
  <S-Tab>       - Previous suggestion
  <CR>          - Accept completion
  <C-u/d>       - Scroll docs

Navigation (<Space>l prefix):
  gd            - Go to definition
  gD            - Go to declaration
  gi            - Go to implementation
  gr            - Show references
  gt            - Go to type definition
  K             - Hover documentation
  <C-k>         - Signature help

Code Actions (<Space>l):
  <Space> l r   - Rename variable/function
  <Space> l a   - Code actions (fixes, refactors)
  <Space> l f   - Format file
  <Space> s f   - Format selection

Diagnostics (Errors/Warnings):
  <Space> l d   - Show diagnostic details
  <Space> l j   - Next diagnostic
  <Space> l k   - Previous diagnostic
  <Space> l q   - List all diagnostics
  <Space> l i   - LSP Info

Common Workflows:
  Rename: Position cursor, <Space>lr, type new name
  Fix error: <Space>la, select fix
  See docs: Position cursor, press K

Press any key to close...
]]
            vim.notify(lsp_help, vim.log.levels.INFO)
          end,
          description = "[HELP] How to use LSP (autocomplete, go to def, etc.)",
        },
      })
    end,
  },
}
