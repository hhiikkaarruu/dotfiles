local h = require('helpers.map')

return {
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require('Comment').setup()
			-- h.nmap('<leader>c', 'gcc', {})
			-- h.vmap('<leader>c', 'gc', {})
			vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', {})
			vim.api.nvim_set_keymap('v', '<leader>c', 'gc', {})
		end,
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		lazy = false,
		config = function()
			local highlight = {
				'CursorColumn',
				'Whitespace',
			}
			require('ibl').setup({
				indent = {
					highlight = highlight,
					char = '',
				},
				whitespace = {
					highlight = highlight,
				},
				scope = {
					enabled = false,
				},
			})
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					'vimdoc',
					'lua',
					'go',
					'bash',
					'python',
					'typescript',
					'groovy',
					'java',
					'csv',
					'markdown',
					'markdown_inline',
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"m00qek/baleia.nvim",
		lazy = false,
		config = function()
			vim.g.baleia = require("baleia").setup({ })

			-- Command to colorize the current buffer
			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			-- Command to show logs 
			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('nvim-autopairs').setup()

			h.imap('<c-f>', '<c-g>U<right>')
		end,
	},
}

