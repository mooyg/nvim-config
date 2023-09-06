return {
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"neovim/nvim-lspconfig",
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
		config = function()
			require("mason").setup()
		end,
	},
}