return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = true,
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 5000,
				},
				log_level = vim.log.levels.DEBUG,
				formatters_by_ft = {
					javascript = { "biome", "prettierd", stop_after_first = true },
					typescript = { "biome", "prettierd", stop_after_first = true },
					typescriptreact = { "biome", "prettierd", stop_after_first = true },
					svelte = { "prettierd" },
					json = { "biome" },
					lua = { "stylua" },
					css = { "prettierd" },
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {},
		},
	},
}
