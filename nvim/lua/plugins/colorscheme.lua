return {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        integrations = {
            lazy = false,
            telescope = false,
        },
        highlight_overrides = {
            NormalNC = { bg = "#161617" },
        },
    },
    config = function()
        vim.cmd.colorscheme("oldworld")
    end,
}
