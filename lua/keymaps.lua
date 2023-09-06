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
})
vim.keymap.set("n", "o", "o<esc>")
vim.keymap.set("n", "<C-B>", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<cr>")
