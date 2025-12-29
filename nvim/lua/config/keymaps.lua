-- Set space as leader key (already set in init.lua before plugins load)
local keymap = vim.keymap

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Clear search highlighting
keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Save file
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- Quit
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all without saving" })

-- Plugin Management (Lazy.nvim)
keymap.set("n", "<leader>p", ":Lazy<CR>", { desc = "Open Lazy plugin manager" })

-- Buffer navigation
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Navigation group (windows & explorer)
keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>nf", ":Neotree focus<CR>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>ne", "<C-w>w", { desc = "Focus next window" })
keymap.set("n", "<leader>np", "<C-w>W", { desc = "Focus previous window" })
keymap.set("n", "<leader>no", ":only<CR>", { desc = "Close all other windows" })
keymap.set("n", "<leader>ns", ":split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>nv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>nc", ":close<CR>", { desc = "Close current window" })
keymap.set("n", "<leader>n=", "<C-w>=", { desc = "Equalize window sizes" })

-- Tab navigation
keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs" })
keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tf", ":tabfirst<CR>", { desc = "First tab" })
keymap.set("n", "<leader>tl", ":tablast<CR>", { desc = "Last tab" })
keymap.set("n", "<leader>tm", ":tabmove ", { desc = "Move tab to position" })

-- Buffer operations (expanded)
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bf", ":bfirst<CR>", { desc = "First buffer" })
keymap.set("n", "<leader>bl", ":blast<CR>", { desc = "Last buffer" })
keymap.set("n", "<leader>bs", ":new<CR>", { desc = "New buffer (horizontal split)" })
keymap.set("n", "<leader>bv", ":vnew<CR>", { desc = "New buffer (vertical split)" })
keymap.set("n", "<leader>ba", ":badd ", { desc = "Add buffer from file" })

-- Search and Edit group
keymap.set("n", "<leader>sw", "/\\<lt><C-r><C-w>\\><CR>", { desc = "Search word under cursor (exact match)" })
keymap.set("n", "<leader>sW", "/\\<lt><C-r><C-w>\\>\\C<CR>", { desc = "Search word (case-sensitive)" })
keymap.set("n", "<leader>ss", "/", { desc = "Search forward" })
keymap.set("n", "<leader>sS", "?", { desc = "Search backward" })
keymap.set("n", "<leader>sn", "n", { desc = "Next search result" })
keymap.set("n", "<leader>sN", "N", { desc = "Previous search result" })
keymap.set("n", "<leader>sr", ":%s/", { desc = "Search and replace" })
keymap.set("v", "<leader>sr", ":s/", { desc = "Search and replace in selection" })
keymap.set("n", "<leader>sc", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Copy/Paste helpers
keymap.set("n", "<leader>sy", "yy", { desc = "Copy (yank) line" })
keymap.set("v", "<leader>sy", "y", { desc = "Copy (yank) selection" })
keymap.set("n", "<leader>sp", "p", { desc = "Paste after cursor" })
keymap.set("n", "<leader>sP", "P", { desc = "Paste before cursor" })
keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all text" })
keymap.set("n", "<leader>sd", "dd", { desc = "Delete (cut) line" })
keymap.set("v", "<leader>sd", "d", { desc = "Delete (cut) selection" })

-- Text manipulation
keymap.set("n", "<leader>su", "viwU<Esc>", { desc = "Uppercase word" })
keymap.set("n", "<leader>sl", "viwu<Esc>", { desc = "Lowercase word" })
keymap.set("n", "<leader>sj", "J", { desc = "Join line below" })
keymap.set("v", "<leader>si", ">gv", { desc = "Indent selection" })
keymap.set("v", "<leader>sI", "<gv", { desc = "Unindent selection" })

-- Format (will use LSP formatter when available)
keymap.set("n", "<leader>sf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file (LSP)" })
keymap.set("v", "<leader>sf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format selection (LSP)" })

-- Motions/Cursor movements
keymap.set("n", "<leader>mh", "0", { desc = "Start of line" })
keymap.set("n", "<leader>ml", "$", { desc = "End of line" })
keymap.set("n", "<leader>mj", "G", { desc = "End of file" })
keymap.set("n", "<leader>mk", "gg", { desc = "Start of file" })
keymap.set("n", "<leader>mm", "%", { desc = "Jump to matching bracket" })
keymap.set("n", "<leader>mw", "w", { desc = "Next word" })
keymap.set("n", "<leader>mb", "b", { desc = "Previous word" })
keymap.set("n", "<leader>me", "e", { desc = "End of word" })
keymap.set("n", "<leader>m{", "{", { desc = "Previous paragraph/block" })
keymap.set("n", "<leader>m}", "}", { desc = "Next paragraph/block" })
keymap.set("n", "<leader>m^", "^", { desc = "First non-blank character" })
keymap.set("n", "<leader>mg", "G", { desc = "Go to line (type number first)" })
keymap.set("n", "<leader>mG", "gg", { desc = "Go to first line" })
keymap.set("n", "<leader>m<", "[[", { desc = "Previous function/section" })
keymap.set("n", "<leader>m>", "]]", { desc = "Next function/section" })

-- Text objects (useful for selecting/editing)
keymap.set("n", "<leader>mi(", "vi(", { desc = "Select inside parentheses" })
keymap.set("n", "<leader>mi{", "vi{", { desc = "Select inside braces" })
keymap.set("n", "<leader>mi[", "vi[", { desc = "Select inside brackets" })
keymap.set("n", "<leader>mi'", "vi'", { desc = "Select inside single quotes" })
keymap.set('n', '<leader>mi"', 'vi"', { desc = "Select inside double quotes" })
keymap.set("n", "<leader>ma(", "va(", { desc = "Select around parentheses" })
keymap.set("n", "<leader>ma{", "va{", { desc = "Select around braces" })
keymap.set("n", "<leader>ma[", "va[", { desc = "Select around brackets" })
keymap.set("n", "<leader>maw", "vaw", { desc = "Select around word" })
keymap.set("n", "<leader>miw", "viw", { desc = "Select inside word" })
