local opt = vim.opt
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.clipboard = "unnamedplus"
opt.number = true
opt.guifont = { "Fira Code", "h12" }
vim.g.mapleader = " "
opt.termguicolors = true
require("moonlight").set()
