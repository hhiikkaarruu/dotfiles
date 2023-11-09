return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		dependencies = {
			{
				'williamboman/mason.nvim',
				cmd = 'Mason',
				build = ':MasonUpdate',
				opts = {},
			},
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
				},
			})
			local lspconfig = require('lspconfig')
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			mason_lspconfig.setup_handlers({
				function(server)
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
}
