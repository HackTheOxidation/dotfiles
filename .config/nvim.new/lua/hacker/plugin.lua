-- plugin.lua
-- Plugins with packer.nvim

-- Bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-- Plugins
return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"        -- Let packer.nvim manage itself
  
  -- Colorschemes
  use 'sainnhe/everforest'

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- Autopairs
  use "windwp/nvim-autopairs"

  -- GitSigns
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    -- tag = 'release' -- To use the latest release
  }

  -- ToggleTerm
  use "akinsho/toggleterm.nvim"

  -- Lean (and dependencies)
  use 'Julian/lean.nvim'
  use 'andrewradev/switch.vim'
  use 'tomtom/tcomment_vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
