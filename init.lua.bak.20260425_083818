-- ========================================================
-- INIT.LUA TERMUX SAFE + COPILOT + NvimTree + IBL
-- ========================================================

-- 1️⃣ Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.signcolumn = 'yes'
vim.opt.numberwidth = 1
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = { tab = '│ ', trail = '·' }

-- 2️⃣ Leader key
vim.g.mapleader = " "

-- 3️⃣ Plugin manager (packer.nvim)
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'github/copilot.vim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use { 'nvim-treesitter/nvim-treesitter' }
  use {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│", tab_char = "│" },
        exclude = { filetypes = { "help", "alpha", "dashboard", "neo-tree", "toggleterm" } }
      })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- 4️⃣ Copilot Config (DITARUH SEBELUM KEYMAP)
-- Ini buat fix pesan "Disabled for filetype"
vim.g.copilot_filetypes = {
    ["*"] = true,
    [""] = true, -- Ini penting buat handle empty filetype
}
vim.g.copilot_no_tab_map = true -- Matiin Tab biar gak bentrok sama Indent

-- 5️⃣ Treesitter setup
pcall(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "bash", "lua" }, -- Tambah lua biar init.lua lu berwarna
    highlight = { enable = true },
    indent = { enable = true },
  }
end)

-- 6️⃣ NvimTree setup
require('nvim-tree').setup({
  view = { width = 30, side = 'left' },
  renderer = { indent_markers = { enable = true } },
  update_focused_file = { enable = true },
})

-- 7️⃣ Keymaps
-- General
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<C-x>', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':q<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

-- Insert mode save
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')

-- COPILOT KEYMAP (Pake Alt + Enter atau Ctrl + J biar gak ganggu spasi)
-- Lu tadi pake <C-i>, itu sebenernya sama kayak <Tab> di banyak terminal. Bahaya.
-- Kita pake <C-j> aja yang standar buat Copilot.
vim.keymap.set('i', '<C-j>', 'copilot#Accept("<CR>")', {
    expr = true,
    replace_keycodes = false,
    silent = true
})

-- Shortcut buat dismiss atau next suggestion
vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-e>', '<Plug>(copilot-dismiss)')

-- ========================================================
-- DONE
-- ========================================================
