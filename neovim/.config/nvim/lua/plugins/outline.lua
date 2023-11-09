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

			local map = vim.api.nvim_set_keymap
			map('n', '<leader>o', '<cmd>AerialToggle!<cr>', {noremap = true, silent = true})
		end,
	},
}
