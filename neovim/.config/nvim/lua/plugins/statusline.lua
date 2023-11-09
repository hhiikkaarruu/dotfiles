return {
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('lualine').setup({
				options = {
					icon_enabled = true,
					theme = 'auto',
				},
			})
		end,
	},
}
