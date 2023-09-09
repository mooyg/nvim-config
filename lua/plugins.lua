return {
	"nvim-lua/plenary.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").tsserver.setup({
				capabilities = capabilities,
			})
			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
			})
			require("lspconfig").svelteserver.setup({
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
					"svelte"
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
					}
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
}
