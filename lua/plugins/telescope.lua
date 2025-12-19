return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
				layout_config = {
					horizontal = {
						preview_width = 0.55,
					},
				},
				sorting_strategy = "ascending",
				prompt_prefix = " ",
				selection_caret = " ",
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
