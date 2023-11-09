return {
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			'neovim/nvim-lspconfig',
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',

		},
		config = function()
			local cmp = require('cmp')
			local map = cmp.mapping
			cmp.setup({
				sources = {
					{name = 'nvim_lsp'},
					{name = 'path'},
					{name = 'buffer'},
					{name = 'cmdline'},
					{name = 'vsnip'},
				},
				mapping = map.preset.insert({
					['<c-p>'] = map.select_prev_item(),
					['<c-n>'] = map.select_next_item(),
					['<s-space>'] = map.complete(),
					['<c-e>'] = map.abort(),
					['<c-l>'] = map.confirm({select = true}),
				}),
				snippet = {
					-- avoid error: snippet engine is not configured
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
			})
		end,
	},
}
