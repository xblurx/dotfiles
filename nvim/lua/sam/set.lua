vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.encoding = "utf-8"
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true


vim.opt.termguicolors = true
vim.opt.background = "dark" 
vim.cmd("colorscheme oxocarbon")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.scrolloff = 8 

vim.opt.updatetime = 50

vim.g.mapleader = " "

-- Set to auto read when a file is changes from the outside
vim.opt.autoread = true

-- Always show the status line
vim.opt.laststatus = 0

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- autopairs alternative
-- vim.api.nvim_set_keymap("i", "(", "<cmd>lua vim.api.nvim_feedkeys('()', 'in', true)<CR><esc>i", {noremap = true})
-- vim.api.nvim_set_keymap("i", "{", "<cmd>lua vim.api.nvim_feedkeys('{}', 'in', true)<CR><esc>i", {noremap = true})
-- vim.api.nvim_set_keymap("i", "[", "<cmd>lua vim.api.nvim_feedkeys('[]', 'in', true)<CR><esc>i", {noremap = true})
-- vim.api.nvim_set_keymap("i", "[", "<cmd>lua vim.api.nvim_feedkeys('[]', 'in', true)<CR><esc>i", {noremap = true})
-- vim.api.nvim_set_keymap("i", "\"", "<cmd>lua vim.api.nvim_feedkeys('\"\"', 'in', true)<CR><esc>i", {noremap = true})
-- vim.api.nvim_set_keymap("i", "\'", "<cmd>lua vim.api.nvim_feedkeys('\\\'\\\'', 'in', true)<CR><esc>i", {noremap = true})
