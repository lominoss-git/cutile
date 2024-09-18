return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    lazy = false,
    keys = {
        {
            "<leader>o",
            "<cmd>Oil<CR>",
        },
    },
    opts = {
        default_file_explorer = true,
        columns = {
            {"permissions", highlight = "Question"},
            {"size", highlight = "Comment"},
            {"mtime", highlight = "Title"},
        },
        view_options = {
            show_hidden = true,
        },
        preview = {
            border = "single",
        },
        progress = {
            border = "single",
        },
    },
}
