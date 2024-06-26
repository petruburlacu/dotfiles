
-- line default relative number
vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.signcolumn = 'yes:2' -- Always show the signcolumn, otherwise it would shift the text each time

vim.cmd([[set scrolloff=10]])
vim.cmd([[set sidescrolloff=35]])

vim.o.backup = false -- This is recommended by coc
vim.o.swapfile = false
vim.o.writebackup = false -- This is recommended by coc

-- whitespace characters
vim.wo.list = true
vim.opt.listchars = { tab = '→ ', trail = '•', extends = '»', precedes = '«' }

-- Terminal colors
vim.opt.termguicolors = true
vim.g.t_Co = 256

vim.opt.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.opt.pumheight = 10 --Makes pop-up menu smaller

vim.opt.fileencoding = 'utf-8' -- The encoding written to file

vim.opt.conceallevel = 0 -- TO see `` in markdown files

-- Indent
vim.opt.autoindent = true
vim.g.smartindent = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- insert space characters whenever the tab key is pressed
vim.o.expandtab = true

-- don't wrap default check `keymaps.lua` for conditional warp for some filetypes
-- disable wrapping for all filetypes
vim.opt.wrap = false

-- Error format
vim.bo.errorformat = [[
    %E%f:%l:%c: %trror: %m,%-Z%p^,%+C%.%#
    %D%*a: Entering directory [`']%f
    %X%*a: Leaving directory [`']%f
    %-G%.%#
]]



