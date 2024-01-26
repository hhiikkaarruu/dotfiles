return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				styles = {
					comments = {italic = false},
					keywords = {italic = false},
				},

				-- reference: https://www.colordic.org/
				on_colors = function(colors)
					colors.comment = "#a9a9a9" -- darkgray
				end,

				on_highlights = function(highlights)
					highlights.LineNr = {
						fg = "#808080" -- gray
					}
				end,
			})


			-- vim.cmd([[colorscheme tokyonight]])
			vim.cmd([[colorscheme tokyonight-night]])
			-- vim.cmd([[colorscheme tokyonight-storm]])
			-- vim.cmd([[colorscheme tokyonight-day]])
			-- vim.cmd([[colorscheme tokyonight-moon]])
		end,
	},
}

