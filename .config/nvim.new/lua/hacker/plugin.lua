-- plugin.lua
-- Plugins with Lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
return require("lazy").setup({  

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "mhartington/formatter.nvim",
  "mfussenegger/nvim-lint",

  -- Linting
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  
  -- Colorschemes
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" }
    },
    opts = function()
      local cmp = require("cmp")
      local conf = {
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
        },
        snippet = {
          expand = function(args)
            -- Comes from vsnip
            fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        })
      }
      return conf
    end
  },

  -- Snippets
  "L3MON4D3/LuaSnip", --snippet engine

  -- Autopairs
  "windwp/nvim-autopairs",

  -- ToggleTerm
  "akinsho/toggleterm.nvim",

  -- Lean (and dependencies)
  'Julian/lean.nvim',
  'andrewradev/switch.vim',
  'tomtom/tcomment_vim',

  "nvim-lua/plenary.nvim",
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  -- GitSigns
  { 
    "lewis6991/gitsigns.nvim", 
    dependencies = { 
        "nvim-lua/plenary.nvim" 
    },
    tag = 'release' -- To use the latest release
  },

  -- Git client
  "tpope/vim-fugitive",

  -- Telescope
  { 
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- FSharp
  "ionide/Ionide-vim",

  -- DAP
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",

  -- Sneak
  "justinmk/vim-sneak",
})
