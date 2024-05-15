-- keys.lua
-- Custom Keymappings

local opts = { noremap = true, silent = true }        -- options for remapping keys

local term_opts = { silent = true }                   -- option for remapping keys in terminal mode

local keymap = vim.api.nvim_set_keymap                -- local var to keymap api

-- Remap "Space" as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"


-- Normal --
-- window navigation
keymap("n", "<leader>w", "<C-w>", opts)               -- C-w shortcut

-- window creation
keymap("n", "<leader>v", "<C-w>v", opts)              -- split window vertically

-- buffer navigation
keymap("n", "<leader>b", ":bnext<cr>", opts)          -- switch to next buffer
keymap("n", "<leader-S>b", ":bprevious<cr>", opts)    -- switch to previous buffer
keymap("n", "<leader>d", ":bdelete!<cr>", opts)       -- delete current buffer

-- saving and quitting
keymap("n", "<leader>q", ":wq!<cr>", opts)            -- save and quit the current buffer


-- Visual --
-- indent mode
keymap("v", "<", "<gv", opts)                         -- indent left
keymap("v", ">", ">gv", opts)                         -- indent right

-- move text
keymap("v", "<A-j>", ":m .+1<CR>==", opts)            -- move text down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)            -- move text up
keymap("v", "p", '"_dP', opts)


-- Visual Block --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)         -- move text block down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)         -- move text block up
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)     -- move text block down
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)     -- move text block up


-- Terminal --
-- terminal navigation
keymap("t", "<leader>w", "<C-\\><C-N><C-w>", term_opts)   -- C-w shortcut
keymap("t", "<ESC>", "<C-\\><C-n>", term_opts)            -- quit the terminal

-- Launchers --
keymap("n", "<leader>e", ":Lex 30<cr>", opts)         -- open netrw
keymap("n", "<leader>t", ":ToggleTerm<cr>", opts)     -- open terminal
keymap("n", "<leader>f", ":Telescope fd<cr>", opts)   -- run find files (Telescope)
keymap("n", "<leader>r", ":Telescope live_grep<cr>", opts)   -- run grep (Telescope)
