return {
	{
		'nvim-tree/nvim-tree.lua',
		lazy = false,
		-- keys = {
		-- 	{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		-- },
		config = function()
			local var_g = vim.api.nvim_set_var
			var_g('loaded_netrw', 1)
			var_g('loaded_netrwPlugin', 1)

			require('nvim-tree').setup({
				sort_by = 'case_sensitive',
				view = {
					side = 'right',
				},
			})
			local map = vim.api.nvim_set_keymap
			map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {noremap = true, silent = true})

			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
						vim.cmd "quit"
					end
				end
			})

			-- require('nvim-tree.api').tree.toggle({focus = false, find_file = true})
		end,
	},
}
