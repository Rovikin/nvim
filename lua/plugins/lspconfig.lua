return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/lazydev.nvim" },
	},
	cmd = { "LspInfo", "LspInstall", "LspUnInstall" },
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		local sign = function(opts)
			vim.fn.sign_define(opts.name, {
				texthl = opts.name,
				text = opts.text,
				numhl = "",
			})
		end

		sign({ name = "DiagnosticSignError", text = "✘" })
		sign({ name = "DiagnosticSignWarn", text = "▲" })
		sign({ name = "DiagnosticSignHint", text = "⚑" })
		sign({ name = "DiagnosticSignInfo", text = "»" })

		vim.diagnostic.config({
			virtual_text = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
		})
	end,
	config = function()
		local lspconfig = vim.lsp.config
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
			end,
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"emmet_language_server",
				"svelte",
				"lua_ls",
			},
			handlers = {
				function(server)
					lspconfig[server].capabilities = lsp_capabilities
				end,
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
						filetypes = {
							"css",
							"eruby",
							"html",
							"javascript",
							"javascriptreact",
							"less",
							"sass",
							"scss",
							"pug",
							"typescriptreact",
						},
						capabilities = lsp_capabilities,
					})
				end,
			},
		})
	end,
}
