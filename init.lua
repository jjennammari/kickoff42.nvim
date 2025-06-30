-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  NOTE: set true if a Nerd Font is installed
vim.g.have_nerd_font = false

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

-- the function BELOW is where you add your NeoVim plugins, through the Lazy Package Manager
-- to ADD a new plugin just create a .lua file for it inside the lua/ directory
-- in the file paste inside a return statement the config contents of the plugin (check the others for exemples)
-- then import it like I did below;
-- if the file is under a dir "plugins.[dir].[plugin_file_name]", else don't write the [dir] part.
-- to DISABLE a plugin just comment the line where the plugin is imported
require("lazy").setup({
--  NOTE: if you have any doubts about what a plugin is doing or how to work with it
--		  try running `:help [plugin_name]`

--	Basic Utitlity Plugins:
	{ import = "plugins.utils.gitsigns" },
	-- adds git related signs to the gutter and utilities for managing changes
	{ import = "plugins.utils.indent_line" },
	-- adds a guiding line in indented blocks
	{ import = "plugins.utils.mini" },
	-- adds a variety of helpful tools to NeoVim, check file for keybinds and github
	{ import = "plugins.utils.neo-tree" },
	-- file system browser, open with [\] key
	{ import = "plugins.utils.nvim-treesitter" }, -- must have language parsing tool and library
	{ import = "plugins.utils.telescope" },
	-- great fuzzy finder, try `:help Telescope` for more info
	{ import = "plugins.utils.todo-comments" },
	-- adds a bunch of helpful keywords like the NOTE that I've been using, check plugin file to see all the available ones
	{ import = "plugins.utils.vim-sleuth" },
	-- this plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
	-- might run into issues with Norminette, try disabling it if this is happening
	{ import = "plugins.utils.which-key" },
	-- great plugin if you're still learning neovim keybinds,
	-- shows you follow-up keystrokes based what key you pressed first

--	Theme Related Plugins:
--	if you want to add a theme to the theme-stash file so you can modify it
--	(e.g.: to make it transparent) load it in the vim-options file
	{ import = "plugins.themes.switcheroo" },
	-- PREVIEW many themes
	{ import = "plugins.themes.themery" },
	-- LOAD themes you already have saved in stash
	{ import = "plugins.themes.theme-stash" },

--	Dashboard Plugins:
	{ import = "plugins.snacks" },
	{ import = "plugins.persistence" },

--	42 School Related Plugins:
	{ import = "plugins.42.42-norminette" },
	-- keybinds inside plugin file
	{ import = "plugins.42.42-header" },
	--  TODO: add your user and email inside the plugin file

--	LSP Related Plugins:
	{ import = "plugins.LSP.lazydev" },
	-- NOTE:
	-- the LSP config in the file below is what works for me
	-- I commented a lot of functionalities, check the file and edit to your liking
	-- LSP related keybinds in the plugin and also in the vim-options file
	{ import = "plugins.LSP.nvim-lspconfig" },
--	auto-format and auto-completion plugins below;
--	I personally don't use them so if you want to load them uncomment the 2 imports below
--	ps: they might need some tweaking in their config functions
--	{ import = "plugins.LSP.conform_autoformat" },
--	{ import = "plugins.LSP.nvim-cmp_autocompletion" },

--	AI Related Plugins:
	{ import = "plugins.AI.copilot" },
	-- modified version of the original copilot plugin
	{ import = "plugins.AI.copilotChat" }
	-- CoPilot vscode-like chat window, check file and github on how to use

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
