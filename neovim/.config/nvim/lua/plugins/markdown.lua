return {
	{
		'iamcco/markdown-preview.nvim',
		ft = { 'markdown' },
		build = function()
			require('lazy').load({ plugins = { 'markdown-preview.nvim' } })
			vim.fn["mkdp#util#install"]()
		end,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	},
	-- {
	-- 	"ixru/nvim-markdown",
	-- 	ft = { 'markdown' },
	-- 	opts = {},
	-- },
	-- {
	-- 	'MeanderingProgrammer/render-markdown.nvim',
	-- 	opts = {},
	-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- 	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- 	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	-- },
	-- {
	-- 	"bullets-vim/bullets.vim",
	-- 	ft = { 'markdown' },
	-- },
	-- {
	-- 	'bullets-vim/bullets.vim',
	-- 	ft = { 'markdown' },
	-- 	config = function()
	-- 		-- default
	-- 		-- vim.g.bullets_outline_levels = {'ROM', 'ABC', 'num', 'abc', 'rom', 'std-', 'std*', 'std+'}
	-- 		vim.g.bullets_outline_levels = { 'std-' }
	-- 		vim.g.bullets_set_mappings = 0
	--
	-- 		local h = require('helpers.map')
	-- 		local regex_bullet_line_somewhere = '^[%s]*[%-%+%*]%s.*$'
	-- 		local regex_bullet_line_initial = '^[%s]*[%-%+%*]%s$'
	--
	-- 		h.nmap('o', function()
	-- 			if string.match(vim.fn.getline('.'), regex_bullet_line_somewhere) then
	-- 				return '<Plug>(bullets-newline)'
	-- 			else
	-- 				return 'o'
	-- 			end
	-- 		end, { expr = true, noremap = true, silent = true })
	--
	-- 		h.imap('<cr>', function()
	-- 			if string.match(vim.fn.getline('.'), regex_bullet_line_somewhere) then
	-- 				return '<Plug>(bullets-newline)'
	-- 			else
	-- 				return '<cr>'
	-- 			end
	-- 		end, { expr = true, noremap = true, silent = true })
	--
	-- 		h.imap('<tab>', function()
	-- 			if string.match(vim.fn.getline('.'), regex_bullet_line_initial) then
	-- 				return '<Plug>(bullets-demote)'
	-- 			else
	-- 				return '<tab>'
	-- 			end
	-- 		end, { expr = true, noremap = true, silent = true })
	--
	-- 		h.imap('<bs>', function()
	-- 			if string.match(vim.fn.getline('.'), regex_bullet_line_initial) then
	-- 				return '<Plug>(bullets-promote)'
	-- 			else
	-- 				return '<bs>'
	-- 			end
	-- 		end, { expr = true, noremap = true, silent = true })
	-- 	end,
	-- },
}
