return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { "filename", "location", "progress" },
            lualine_x = { "diff", "branch" },
            lualine_y = {},
            lualine_z = { "filetype" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename", "location" },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
    },
}
