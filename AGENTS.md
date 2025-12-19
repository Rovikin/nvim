# Neovim Configuration Context

## Project Overview

This is a minimal and efficient Neovim configuration built from scratch with essential features for modern development workflows. The configuration uses lazy.nvim as the plugin manager and follows a modular approach with separate files for different aspects of the setup.

### Architecture and Structure

The configuration is organized into the following main components:

- `init.lua`: Main entry point that loads the different modules
- `/lua/config/`: Contains core configuration files:
  - `settings.lua`: Basic Neovim options and settings
  - `keymaps.lua`: Keyboard mappings and shortcuts
  - `lazy.lua`: Plugin manager (lazy.nvim) setup
- `/lua/plugins/`: Individual plugin configurations as separate files
  - `init.lua`: Core plugins (colorscheme, autopairs, conform, comment)
  - `cmp.lua`: Completion engine (nvim-cmp)
  - `gitsigns.lua`: Git integration
  - `lspconfig.lua`: Language Server Protocol configuration
  - `mason.lua`: Package manager for LSP servers
  - `telescope.lua`: Fuzzy finder
  - `treesitter.lua`: Syntax highlighting and parsing
  - `typescript-tools.lua`: TypeScript-specific tools
  - `which-key.lua`: Key binding documentation

### Technologies Used

- **Neovim**: Version 0.9+ (required for the lua configuration)
- **Plugin Manager**: lazy.nvim
- **Colorscheme**: Catppuccin (with Mocha flavor)
- **Completion Engine**: nvim-cmp with LSP, snippet, buffer, and path sources
- **Treesitter**: For enhanced syntax highlighting
- **LSP**: Neovim's built-in LSP client with mason for server management
- **Formatters**: Conform.nvim with biome, prettierd, stylua formatters
- **Fuzzy Finder**: Telescope with fzf-native extension

## Key Features

### Core Functionality
- Modern LSP support with code completion, diagnostics, and formatting
- File detection and syntax highlighting for JavaScript, TypeScript, Svelte, Lua, CSS, HTML, and more
- Git integration through gitsigns for showing line changes
- Auto-completion with snippets support
- Efficient file navigation and buffer management

### Formatting
- Automatic formatting on save with conform.nvim
- Support for JavaScript/TypeScript with biome and prettierd
- Lua formatting with stylua
- Svelte and CSS formatting with prettierd

### Navigation & Search
- Telescope integration for fuzzy finding files, buffers, and text
- Custom keybindings for buffer navigation
- Window management shortcuts

## Key Bindings

### General Shortcuts
- `<Tab>`: Switch to the next buffer
- `<S-Tab>`: Switch to the previous buffer
- `<C-x>`: Close the current buffer
- `<C-s>`: Save the current file
- `<C-q>`: Quit the current window
- `<leader>`: Spacebar (set as leader key)
- `<C-h>`: Clear search highlights

### File Navigation (Telescope)
- `<leader>ff`: Find files
- `<leader>fg`: Live grep (search text)
- `<leader>fb`: Find buffers
- `<leader>fh`: Find help tags
- `<leader>fr`: Find recent files

### LSP Functions
- `gd`: Go to definition
- `gD`: Go to declaration
- `gi`: Go to implementation
- `gr`: Find references
- `K`: Show hover information
- `<leader>lr`: Rename symbol
- `<leader>la`: Code action
- `<leader>lf`: Format file
- `<leader>li`: LSP info
- `<leader>ls`: Restart LSP

### Diagnostics
- `<leader>dd`: Show diagnostic
- `<leader>dn`: Next diagnostic
- `<leader>dp`: Previous diagnostic
- `<leader>dl`: List diagnostics

### Git Integration (Gitsigns)
- `<leader>gs`: Git status
- `<leader>gb`: Toggle Git blame
- `<leader>gn`: Next git hunk
- `<leader>gp`: Previous git hunk
- `<leader>gh`: Preview hunk
- `<leader>gr`: Reset hunk

### Window Management
- `<C-w>h/j/k/l`: Navigate between windows
- `<A-j>/k`: Move lines up/down in visual mode

## Installation

1. Install Neovim (version 0.9+) and Git
2. Clone this repository to `~/.config/nvim`
3. Launch Neovim (`nvim`), which will automatically install lazy.nvim and all plugins

After installation, the plugins will be automatically downloaded and configured.

## Development Conventions

- Modular configuration approach with separate files for each concern
- Consistent use of leader key for plugin-related functions
- Proper separation between core settings, keymaps, and plugin configurations
- Use of Treesitter for enhanced syntax highlighting
- LSP-first approach for language-specific features
- Consistent formatting with automatic application on save

## Testing and Verification

Since this is a Neovim configuration rather than typical software, testing is done by:
1. Opening Neovim with the configuration
2. Verifying that plugins load correctly
3. Testing key bindings and functionality
4. Opening different file types to ensure proper language support