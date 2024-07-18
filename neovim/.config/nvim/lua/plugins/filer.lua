return {
	{
		'nvim-tree/nvim-tree.lua',
		lazy = false,
		config = function()
			local var_g = vim.api.nvim_set_var
			var_g('loaded_netrw', 1)
			var_g('loaded_netrwPlugin', 1)

			local function my_on_attach(bufnr)
				local api = require('nvim-tree.api')

				-- local function opts(desc)
				--   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				-- end

				-- -- copy default mappings here from defaults in next section
				-- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
				-- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
				-- ---
				-- OR use all default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- remove <C-e> thet act Open: In Place(api.node.open.replace_tree_buffer)
				vim.keymap.del('n', '<C-e>', { buffer = bufnr })

				-- -- override a default
				-- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))
				--
				-- -- add your mappings
				-- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
				-- ---
			end

			require('nvim-tree').setup({
				sort_by = 'case_sensitive',
				view = {
					width = '25%',
					side = 'right',
					signcolumn = 'no',
					preserve_window_proportions = true,
				},
				on_attach = my_on_attach,
			})
			local h = require('helpers.map')
			-- h.nmap('<leader>t', '<cmd>NvimTreeToggle<cr>')
			h.nmap('<leader>t', '<cmd>NvimTreeFindFileToggle<cr>')
			-- h.nmap('<C-t>', require('nvim-tree.api.tree.change_root_to_parent'), {buffer = bufnr, noremap = true, silent = true, nowait = true})

			-- close when only nvim-tree buffer
			-- References: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
			vim.api.nvim_create_autocmd("QuitPre", {
				callback = function()
					local tree_wins = {}
					local floating_wins = {}
					local wins = vim.api.nvim_list_wins()
					for _, w in ipairs(wins) do
						local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
						if bufname:match("NvimTree_") ~= nil then
							table.insert(tree_wins, w)
						end
						if vim.api.nvim_win_get_config(w).relative ~= '' then
							table.insert(floating_wins, w)
						end
					end
					if 1 == #wins - #floating_wins - #tree_wins then
						-- Should quit, so we close all invalid windows.
						for _, w in ipairs(tree_wins) do
							vim.api.nvim_win_close(w, true)
						end
					end
				end
			})

			-- require('nvim-tree.api').tree.toggle({focus = false, find_file = true})
		end,
	},
}
