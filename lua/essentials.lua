local option = vim.opt
local buffer = vim.b
local global = vim.g

-- Global Option Settings --
option.showmode = false
option.expandtab = true
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.number = true
option.relativenumber = true
option.wildmenu = true
option.hlsearch = false 
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menuone", "noselect"}
option.cursorline = true
option.termguicolors = true
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')
option.exrc = true
option.wrap = false
option.splitright = true

-- Buffer Settings --
buffer.fileencoding = "utf-8"

-- Global Settings --
global.mapleader = " "		-- Leader key remapping

-- Key mappings --
-- Disable direction key in all mode --
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")

vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

-- move the selected line up and down in Vision mode --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>q", "<cmd>wq<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")
