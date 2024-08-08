return {
    dir = "~/.config/nvim/local-plugins/mellow.nvim",
    config = function()
        vim.g.mellow_italic_comments = false
        vim.cmd.colorscheme("mellow")
    end,
}
