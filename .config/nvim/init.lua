vim.o.mouse = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartcase = true

vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = false }

map("", "<leader>w", ":w<CR>", opt)

map("", "q", "%", opt)
map("", "%", "q", opt)

map("", "H", "^", opt)
map("", "^", "H", opt)
map("", "L", "$", opt)
map("", "$", "L", opt)

map("n", "j", "gj", opt)
map("n", "gj", "j", opt)
map("n", "k", "gk", opt)
map("n", "gk", "k", opt)

map("n", "<BS>", ":nohl<CR>", {})

