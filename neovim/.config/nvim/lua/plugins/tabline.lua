return {
	{
		'akinsho/bufferline.nvim',
		lazy = false,
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('bufferline').setup({
				options = {
					-- mode = 'tabs',
					diagnostics = 'nvim_lsp',
					separator_style = 'thin', -- slant, thick
					offsets = {
						{
							filetype = 'NvimTree',
							text = nil,
						},
					},
				},
			})
		end,
	},
}

