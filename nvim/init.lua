vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.title = true

vim.opt.scrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.inccommand = "split"

vim.opt.whichwrap:append "<>[]hl"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wq<CR>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "Nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")

require("config.lazy")
