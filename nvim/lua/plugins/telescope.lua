return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
	{
	    "<leader>f",
	    function() require("telescope.builtin").find_files() end,
	},
    },
    opts = {
        defaults = {
	    layout_config = { prompt_position = "top" },
	    sorting_strategy = "ascending",
            prompt_prefix = "λ ",
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
    },
}
