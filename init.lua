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

vim.g.mapleader = " "

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

pcall(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "bash", "lua" }, -- Tambah lua biar init.lua lu berwarna
    highlight = { enable = true },
    indent = { enable = true },
  }
end)

require('nvim-tree').setup({
  view = { width = 30, side = 'left' },
  renderer = { indent_markers = { enable = true } },
  update_focused_file = { enable = true },
})

vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<C-x>', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':q<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')

