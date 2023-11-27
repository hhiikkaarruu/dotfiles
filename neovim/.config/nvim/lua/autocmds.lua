local autocmd = vim.api.nvim_create_autocmd

------------------------------
-- terminal autocmds
------------------------------
autocmd('TermOpen', {
	pattern = '*',
	command = 'startinsert',
})

autocmd('WinEnter', {
	pattern = 'term://*',
	command = 'startinsert',
})

------------------------------
-- clipboard autocmds
------------------------------
autocmd('TextYankPost', {
	pattern = '*',
	command = 'call system("/mnt/c/Windows/System32/clip.exe", @")',
})

