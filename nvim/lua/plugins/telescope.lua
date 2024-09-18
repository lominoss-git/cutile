return {
    {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
	    {
			"<leader>f",
			function() require("telescope.builtin").find_files() end,
	    },
	},
	opts = {
	    defaults = {
		layout_config = { prompt_position = "top", width = 0.7, height = 0.7 },
		sorting_strategy = "ascending",
		prompt_prefix = "λ ",
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	    },
	},
    },
}
