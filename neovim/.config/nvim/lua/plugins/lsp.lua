return {
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		dependencies = {
			{
				'williamboman/mason.nvim',
				cmd = 'Mason',
				build = ':MasonUpdate',
				opts = {},
			},
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			-- 'creativenull/efmls-configs-nvim',
		},
		config = function()
			local autocmd = vim.api.nvim_create_autocmd

			local ls = {
				'lua_ls', -- lua language server
				-- 'groovyls', -- groovy language server - Installation failed for Package(name=groovy-language-server) error=spawn: bash failed with exit code 1 and signal 0.
				-- 'java_language_server', -- java language server -- can not install
				'jdtls', -- java language server

				-- 'efm',
			}
			if vim.fn.executable('python3') == 1 then
				table.insert(ls, 'pylsp') -- python language server
			end
			if vim.fn.executable('go') == 1 then
				table.insert(ls, 'gopls') -- go language server
			end
			if vim.fn.executable('npm') == 1 then
				table.insert(ls, 'bashls') -- bash language server
				table.insert(ls, 'eslint') -- javascript language server
				table.insert(ls, 'ts_ls') -- typescript language server
			end

			local mason_lspconfig = require('mason-lspconfig')
			mason_lspconfig.setup({
				ensure_installed = ls,
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
			local h = require('helpers.map')
			h.nmap('<leader>e', vim.diagnostic.open_float)
			h.nmap('<leader>l', vim.diagnostic.setloclist)

			-- use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					------------------------------
					-- buffer local mappings
					------------------------------
					local opts = { buffer = ev.buf }
					h.nmap('K', vim.lsp.buf.hover, opts)

					h.nmap('gD', vim.lsp.buf.declaration, opts)
					h.nmap('gd', vim.lsp.buf.definition, opts)
					h.nmap('gi', vim.lsp.buf.implementation, opts)
					h.nmap('gr', vim.lsp.buf.references, opts)

					-- h.nmap('<c-k>', vim.lsp.buf.signature_help, opts)
					h.nmap('<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					h.nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					h.nmap('<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
					h.nmap('<space>D', vim.lsp.buf.type_definition, opts)
					h.nmap('<space>rn', vim.lsp.buf.rename, opts)
					h.nmap('<space>ca', vim.lsp.buf.code_action, opts)
					h.vmap('<space>ca', vim.lsp.buf.code_action, opts)

					h.nmap('<space>f', function() vim.lsp.buf.format({ async = true }) end, opts)
				end,
			})

			-- ------------------------------
			-- -- efm-langserver settings
			-- ------------------------------
			-- lspconfig.efm.setup({
			-- 	init_options = {
			-- 		documentFormatting = true,
			-- 		documentRangeFormatting = true,
			-- 	},
			-- 	settings = {
			-- 		rootMarkers = {
			-- 			".git/",
			-- 		},
			-- 		languages = {
			-- 			lua = {
			-- 				{
			-- 					formatCommand = "stylua --color Never --config-path ~/.config/.stylua.toml -",
			-- 					lintIgnoreExitCode = true,
			-- 				},
			-- 				{
			-- 					lintCommand = "luacheck --no-color --quiet --config ~/.config/.luacheckrc -",
			-- 					lintFormats = { "%f:%l:%c: %m" },
			-- 					lintIgnoreExitCode = true,
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- 	filetypes = {
			-- 		"lua",
			-- 	},
			-- })

			-- local languages = require('efmls-configs.defaults').languages()
			-- lspconfig.efm.setup(vim.tbl_extend('force',
			-- 	{
			-- 		filetypes = vim.tbl_keys(languages),
			-- 		settings = {
			-- 			rootMarkers = { '.git/' },
			-- 			languages = languages,
			-- 		},
			-- 		init_options = {
			-- 			documentFormatting = true,
			-- 			documentRangeFormatting = true,
			-- 		},
			-- 	},
			-- 	{}
			-- ))


			-- comment out because stevearc/conform.nvim will do the following
			------------------------------
			-- go settings
			------------------------------
			-- auto goimports
			autocmd('BufWritePre', {
				pattern = '*.go',
				callback = function()
					local params = vim.lsp.util.make_range_params()
					params.context = { only = { 'source.organizeImports' } }

					-- buf_request_sync defaults to a 1000ms timeout. Depending on your
					-- machine and codebase, you may want longer. Add an additional
					-- argument after params if you find that you have to write the file
					-- twice for changes to be saved.
					-- E.g., vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
					local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
								vim.lsp.util.apply_workspace_edit(r.edit, enc)
							end
						end
					end

					vim.lsp.buf.format({ async = false })
				end
			})

			-- format on save
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('FormatOnSave', {}),
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
