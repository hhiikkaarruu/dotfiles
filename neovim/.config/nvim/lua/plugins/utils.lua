return {
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require('Comment').setup()
			local map = vim.api.nvim_set_keymap
			map('n', '<leader>c', 'gcc', {})
			map('v', '<leader>c', 'gc', {})
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		lazy = false,
		config = function()
			require('ibl').setup()
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					'lua',
					'go',
				},
				highlight = {enable = true},
				indent = {enable = true},
			}
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {},
	},
}
