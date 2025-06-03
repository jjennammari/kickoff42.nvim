return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			transparent = false, --  NOTE: set to true if you want transparent background
			styles = {
				comments = { italic = false }, -- Disable italics in comments
			},
		})
	end,
}
