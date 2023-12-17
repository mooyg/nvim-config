local wk = require("which-key")

-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1
wk.register({
	["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
	["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Grep through files" },
})
vim.keymap.set("n", "o", "o<esc>")
vim.keymap.set("n", "<C-B>", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>LspRestart typescript-language-server<cr>")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon a file" })
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Harpoon menu" })
vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end, { silent = true })
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end, { silent = true })
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end, { silent = true })
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end, { silent = true })
vim.keymap.set("n", "<leader>5", function()
	ui.nav_file(5)
end, { silent = true })
vim.keymap.set("n", "<leader>6", function()
	ui.nav_file(6)
end, { silent = true })
vim.keymap.set("n", "<leader>7", function()
	ui.nav_file(7)
end, { silent = true })
vim.keymap.set("n", "<leader>8", function()
	ui.nav_file(8)
end, { silent = true })
vim.keymap.set("n", "<leader>9", function()
	ui.nav_file(9)
end, { silent = true })
vim.keymap.set("n", "<leader>0", function()
	ui.nav_file(10)
end, { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>vl", require("lsp_lines").toggle, { desc = "Toggle LSP line diagnostics" })
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
