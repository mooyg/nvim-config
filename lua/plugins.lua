return {
	"nvim-lua/plenary.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(client, bufnr)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
				-- other maps
			end

			require("lspconfig").tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
			})
			require("lspconfig").svelte.setup({
				capabilities = capabilities,
			})
			require("lspconfig").jsonls.setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSUpdate", "TSUninstall" },
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			{ "windwp/nvim-ts-autotag" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"astro",
					"css",
					"gitcommit",
					"gitignore",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"php",
					"tsx",
					"typescript",
					"toml",
					"vim",
					"vimdoc",
					"yaml",
					"svelte",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
	"folke/which-key.nvim",
	"shaunsingh/moonlight.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-tree/nvim-tree.lua",
		filters = {
			git_ignored = true,
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- Blank explicitly specified as per the repo
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
				}),
				 window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
			})
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					typescript = {
						require("formatter.filetypes.typescript").prettierd,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettierd,
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettierd,
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettierd,
					},
					json = {
						require("formatter.filetypes.json").prettierd,
					},
				},
			})
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>1", desc = "Harpoon buf 1" },
			{ "<leader>2", desc = "Harpoon buf 2" },
			{ "<leader>3", desc = "Harpoon buf 3" },
			{ "<leader>4", desc = "Harpoon buf 4" },
			{ "<leader>5", desc = "Harpoon buf 5" },
			{ "<leader>6", desc = "Harpoon buf 6" },
			{ "<leader>7", desc = "Harpoon buf 7" },
			{ "<leader>8", desc = "Harpoon buf 8" },
			{ "<leader>9", desc = "Harpoon buf 9" },
			{ "<leader>0", desc = "Harpoon buf 10" },
			{ "<leader>a", desc = "Harpoon add" },
			{ "<leader>h", desc = "Harpoon menu" },
		},
		config = function()
			require("harpoon")
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
		end,
	},
}
