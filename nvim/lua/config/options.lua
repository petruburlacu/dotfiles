-- Core options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cursorline = true
opt.colorcolumn = "80"

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.timeoutlen = 300

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Misc
opt.completeopt = "menu,menuone,noselect"
opt.showmode = false
opt.wrap = false
