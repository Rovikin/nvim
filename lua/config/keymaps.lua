local map = vim.keymap.set

map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>a")

map("n", "<C-h>", ":noh<CR>")

-- Navigasi buffer
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<C-x>", ":bd<CR>")

map("n", "<C-q>", ":q<CR>")

map("n", "<C-w>h", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-w>l", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-w>j", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-w>k", "<C-w>k", { desc = "Go to upper window" })

vim.g.mapleader = " "

-- Find (Telescope)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find text" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Find recent files" })

-- LSP (saat attach)
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>lf", function()
	require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 5000 })
end, { desc = "Format" })
map("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP info" })
map("n", "<leader>ls", ":LspRestart<CR>", { desc = "LSP restart" })

-- Git
map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
map("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Git blame" })
map("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Next git hunk" })
map("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "Prev git hunk" })
map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

-- Diagnostic (LSP errors)
map("n", "<leader>dd", function()
	vim.diagnostic.open_float({ scope = "b" })
end, { desc = "Show diagnostic" })
map("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "<leader>dp", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })

map("n", "<leader>dl", ":Telescope diagnostics<CR>", { desc = "List diagnostics" })

map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Delete all buffers except current" })

map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
