vim.cmd('autocmd!')

vim.api.nvim_create_user_command('R', function()
	vim.cmd('tabf ' .. '~/.config/nvim')
end, {})

------------------------------
-- encode settings
------------------------------
vim.scriptencoding = 'utf-8'

------------------------------
-- python settings
------------------------------
vim.g.python3_host_prog = os.execute('echo -n $(which python3)')

