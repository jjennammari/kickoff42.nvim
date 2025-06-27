-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- true if Nerd Font Installed
vim.g.have_nerd_font = false -- set true if you have a nerdfont

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: if you have any doubts about what a plugin is doing or how to work with it
--		 try running `:help <plugin-name>`

require("lazy").setup({

	-- TODO: ADD NOTES RELEVANT TO UTIL PLUGINS BELOW
--	Basic Utitlity Plugins:
	{ import = "plugins.utils.gitsigns" },
	{ import = "plugins.utils.indent_line" },
	{ import = "plugins.utils.mini" },
	{ import = "plugins.utils.neo-tree" },
	{ import = "plugins.utils.nvim-treesitter" },
	{ import = "plugins.utils.telescope" },
	{ import = "plugins.utils.todo-comments" },
	{ import = "plugins.utils.vim-sleuth" },
	{ import = "plugins.utils.which-key" },

-- Theme Related Plugins:
-- if you want to add a theme to the theme-stash file so you can modify it
-- (e.g.: to make it transparent) load it in the vim-options file
	{ import = "plugins.themes.switcheroo" },	-- PREVIEW many themes
	{ import = "plugins.themes.themery" },		-- LOAD themes you already have saved in stash
	{ import = "plugins.themes.theme-stash" },	-- FIX: make neko-night work

-- NOTE: this is relevant for 42 school students
	{ import = "plugins.42.42-norminette" }, -- keybinds inside plugin file
	{ import = "plugins.42.42-header" },	 -- TODO: add your user and email inside the plugin file

--	LSP Related Plugins:
	{ import = "plugins.LSP.lazydev" },
	-- NOTE:
	-- the LSP config in the file below is what works for me, edit it if you need to;
	-- LSP related keybinds inside the vim-options file (search for LSP)
	{ import = "plugins.LSP.nvim-lspconfig" }, -- TODO: needs cleanup

	-- auto-format and auto-completion plugins below;
	-- I personally don't use them so if you want to load them they might need some tweaking
--	{ import = "plugins.LSP.conform_autoformat" },
--	{ import = "plugins.LSP.nvim-cmp_autocompletion" },

	-- AI Related Plugins:
	{ import = "plugins.AI.copilot" },     -- modified version of the original copilot plugin
	{ import = "plugins.AI.copilotChat" }, -- CoPilot vscode-like chat window, check file and github on how to use

-- 	{ import = "plugins.snacks_dashboard" },
--	{ import = "plugins.alpha" },
-- 	{ import = "plugins.persistence" },

}, {
	ui = {
	-- If you are using a Nerd Font: set icons to an empty table which will use the
	-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

require("vim-options")
