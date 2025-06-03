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

require("lazy").setup({
-- 	{ import = "plugins.themes.tokyonight" },
-- 	{ import = "plugins.themes.catppuccin" },
	-- NOTE: after setting a theme, add it to vim-options file

-- 	{ import = "plugins.42_header" },
	-- NOTE: change to your username and email inside the plugin file

-- 	{ import = "plugins.vim-sleuth" },
-- 	{ import = "plugins.gitsigns" },
-- 	{ import = "plugins.which-key" },
-- 	{ import = "plugins.telescope" },
-- 	{ import = "plugins.LSP.lazydev" },
-- 	{ import = "plugins.LSP.nvim-lspconfig" },
--	{ import = "plugins.LSP.nvim-cmp_autocompletion" },
--	{ import = "plugins.LSP.conform_autoformat" },
-- 	{ import = "plugins.todo-comments" },
-- 	{ import = "plugins.mini" },
-- 	{ import = "plugins.nvim-treesitter" },
-- 	{ import = "plugins.neo-tree" },
--	{ import = "plugins.alpha" },
-- 	{ import = "plugins.snacks_dashboard" },
-- 	{ import = "plugins.indent_line" },
--	{ import = "plugins.health" },
-- 	{ import = "plugins.switcheroo" },
-- 	{ import = "plugins.lush" },
-- 	{ import = "plugins.persistence" },
-- 	{ import = "plugins.themery" },
-- 	{ import = "plugins.AI.copilot" },
-- 	{ import = "plugins.AI.copilotChat" },
-- 	{ import = "plugins.golf" },
-- 	{ import = "plugins.42_norminette" }
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
