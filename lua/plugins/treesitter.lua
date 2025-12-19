return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = { "javascript", "typescript", "tsx", "lua", "svelte", "css", "html", "vimdoc", "query" },
	},
	config = function(_, opts)
		require("nvim-treesitter").setup({ opts })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
