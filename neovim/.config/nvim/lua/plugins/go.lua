local go_plugins = {}

if vim.fn.executable('go') == 1 then
	-- {
	-- 	'fatih/vim-go',
	-- 	ft = 'go',
	-- },
	-- {
	-- 	'leoluz/nvim-dap-go',
	-- 	ft = 'go',
	-- 	dependencies = {
	-- 		'mfussenegger/nvim-dap',
	-- 		'rcarriga/nvim-dap-ui',
	-- 		'theHamsta/nvim-dap-virtual-text',
	-- 	},
	-- 	config = function()
	-- 		require('dap-go').setup()
	-- 		require('dapui').setup()
	-- 		require('nvim-dap-virtual-text').setup()
	--
	-- 		local h = require('helpers.map')
	-- 		local dap = require('dap')
	--
	-- 		------------------------------
	-- 		-- nvim-dap keymaps
	-- 		------------------------------
	-- 		local widgets = require('dap.ui.widgets')
	-- 		h.nmap('<F9>', function() dap.continue() end)
	-- 		h.nmap('<F10>', function() dap.step_over() end)
	-- 		h.nmap('<F11>', function() dap.step_into() end)
	-- 		h.nmap('<F12>', function() dap.step_out() end)
	-- 		h.nmap('<leader>db', function() dap.toggle_breakpoint() end)
	-- 		-- h.nmap('<leader>dB', function() dap.set_breakpoint() end)
	-- 		h.nmap('<leader>dm', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
	-- 		h.nmap('<leader>dr', function() dap.repl.open() end)
	-- 		h.nmap('<leader>dl', function() dap.run_last() end)
	-- 		h.nmap('<leader>dh', function() widgets.hover() end)
	-- 		h.vmap('<leader>dh', function() widgets.hover() end)
	-- 		h.nmap('<leader>dp', function() widgets.preview() end)
	-- 		h.vmap('<leader>dp', function() widgets.preview() end)
	-- 		h.nmap('<leader>df', function() widgets.centered_float(widgets.frames) end)
	-- 		h.nmap('<leader>ds', function() widgets.centered_float(widgets.scopes) end)
	--
	-- 		------------------------------
	-- 		-- nvim-dap settings
	-- 		------------------------------
	-- 		local dapui = require('dapui')
	-- 		-- open nvim-dap-ui windows automatically when execute nvim-dap
	-- 		dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
	-- 		-- close nvim-dap-ui windows automatically when terminate nvim-dap
	-- 		dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
	-- 		-- close nvim-dap-ui windows automatically when exit nvim-dap
	-- 		dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
	--
	-- 		------------------------------
	-- 		-- nvim-dap-go keymaps
	-- 		------------------------------
	-- 		local dapgo = require('dap-go')
	-- 		h.nmap('<leader>dg', function() dapgo.debug_test() end)
	-- 		h.nmap('<leader>dG', function() dapgo.debug_last_test() end)
	-- 	end,
	-- }
	table.insert(go_plugins, {
		'ray-x/go.nvim',
		ft = { 'go', 'gomod' },
		event = { 'CmdlineEnter' },
		dependencies = {
			'ray-x/guihua.lua',
			'neovim/nvim-lspconfig',
			'nvim-treesitter/nvim-treesitter',
			'mfussenegger/nvim-dap',
			'rcarriga/nvim-dap-ui',
			'theHamsta/nvim-dap-virtual-text',
			'nvim-telescope/telescope-dap.nvim'
		},
		config = function()
			require('go').setup()
		end,
		build = ':lua require("go.install").update_all_sync()',
	})
else
	print("command not found: go")
end

return go_plugins
