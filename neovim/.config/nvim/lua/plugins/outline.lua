return {
	{
		'stevearc/aerial.nvim',
		lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('aerial').setup({
				placement = 'edge',
			})
			local h = require('helpers.map')
			h.nmap('<leader>o', '<cmd>AerialToggle!<cr>')
		end,
	},
}

