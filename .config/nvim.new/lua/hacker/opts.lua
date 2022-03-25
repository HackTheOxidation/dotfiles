-- General options for Vim/NVim
local options = {
  backup = false,					                        -- don't create backup files
  clipboard = "unnamedplus",			                -- allow nvim to use system clipboard
  completeopt = { "menuone", "noselect" }, 	      -- options for cmp
  conceallevel = 0,				                        -- show `` in markdown files
  fileencoding = "utf-8",				                  -- set file encoding to utf-8
  hlsearch = true,					                      -- highlight all search results
  ignorecase = true,				                      -- ignore case in search patterns
  mouse = "a",					                          -- enable mouse support
  showtabline = 2,					                      -- always show tabs
  smartcase = true,				                        -- enable smart case
  smartindent = true,				                      -- enable smart indentation
  swapfile = false,				                        -- don't create a swapfile
  timeoutlen = 1000,				                      -- decrease waittime for timeouts
  undofile = true, 				                        -- enable persistant undo
  updatetime = 300,				                        -- decrease updatetime for completions
  writebackup = false,				                    -- disable backups
  expandtab = true,				                        -- convert tabs to spaces
  shiftwidth = 2,					                        -- number of spaces per indentation
  tabstop = 2,					                          -- 2 spaces for a tab
  number = true,					                        -- show line numbers
  signcolumn = "yes",				                      -- always show the sign column
}

vim.api.nvim_command('colorscheme everforest')

for k, v in pairs(options) do
  vim.opt[k] = v
end
