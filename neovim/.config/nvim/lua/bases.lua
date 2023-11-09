vim.cmd('autocmd!')

vim.api.nvim_create_user_command('R', function()
	vim.cmd('tabf ' .. '~/.config/nvim')
end, {})
