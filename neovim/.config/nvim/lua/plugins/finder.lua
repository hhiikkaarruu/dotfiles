return {
	{
		'nvim-telescope/telescope.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
			},
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							['<c-h>'] = 'which_key',
						},
					},
				},
				winblend = 20,
			})
			telescope.load_extension('fzf')

			local h = require('helpers.map')
			local builtin = require('telescope.builtin')
			h.nmap('ff', builtin.find_files)
			h.nmap('fg', builtin.live_grep)
			h.nmap('fb', builtin.buffers)
			h.nmap('fh', builtin.help_tags)
		end,
	},
}

