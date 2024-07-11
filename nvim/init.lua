vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = false
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.cindent = true
vim.opt.autoindent = true

vim.opt.termguicolors = true

vim.opt.title = true

vim.opt.scrolloff = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.showmode = false

vim.opt.whichwrap:append "<>[]hl"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wq<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "Nzzzv")
vim.keymap.set("n", "N", "nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    { "tpope/vim-fugitive" },

    {
        "m4xshen/autoclose.nvim",
        event = "VeryLazy",
        config = function()
            require("autoclose").setup()
        end,
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
}

local opts = {}

require("lazy").setup(plugins, opts)

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = { "lua", "rust", "python" },
    highlight = { enable = true },
    indent = { enable = true },
})

local ts_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", ts_builtin.find_files, {})
