local opt = vim.opt
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.clipboard = "unnamed"
opt.number = true
opt.guifont = { "Fira Code", "h12" }
vim.g.mapleader = " "
opt.termguicolors = true
vim.opt.cindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
opt.signcolumn = "yes"
opt.relativenumber = true
require("moonlight").set()
