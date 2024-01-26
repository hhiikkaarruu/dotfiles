local autocmd = vim.api.nvim_create_autocmd

------------------------------
-- terminal autocmds
------------------------------
-- change to insert mode when focus terminal
autocmd('TermOpen', {
	pattern = '*',
	command = 'startinsert',
})
autocmd('WinEnter', {
	pattern = 'term://*',
	command = 'startinsert',
})

-- do not add baffer
autocmd('TermOpen', {
	pattern = '*',
	command = 'if bufwinnr("") > 0 | setlocal nobuflisted | endif',
})


------------------------------
-- clipboard autocmds
------------------------------
autocmd('TextYankPost', {
	pattern = '*',
	command = 'call system("/mnt/c/Windows/System32/clip.exe", @")',
})

