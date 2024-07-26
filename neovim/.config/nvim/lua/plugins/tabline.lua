return {
	{
		'akinsho/bufferline.nvim',
		lazy = false,
		-- add following to avoid Segments must be a list error
		branch = "main",
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
			local h = require('helpers.map')

			-- tab switching
			h.nmap('tl', '<cmd>BufferLineCycleNext<cr>')
			h.nmap('th', '<cmd>BufferLineCyclePrev<cr>')

			-- tab moving
			h.nmap('<leader>bn', '<cmd>BufferLineMoveNext<cr>')
			h.nmap('<leader>bp', '<cmd>BufferLineMovePrev<cr>')

			-- quit current buffer
			h.nmap('<leader>q', '<cmd>BufferLineCyclePrev<cr><cmd>bd#<cr>')
		end,
	},
}

