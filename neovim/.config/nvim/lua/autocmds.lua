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
-- share clipboard with windows for neovim in wsl
if vim.fn.has("wsl") then
	autocmd('TextYankPost', {
		pattern = '*',
		command = 'call system("iconv -t sjis | /mnt/c/Windows/System32/clip.exe", @")',
	})
end

------------------------------
-- filetype autocmds
------------------------------
-- disable static analysis for env file
autocmd('BufEnter', {
	pattern = "*.env",
	callback = function(args)
		vim.diagnostic.disable(args.buf)
	end,
})

------------------------------
-- quickfix autocmds
------------------------------
-- automatically open quickfix after :grep
autocmd('QuickFixCmdPost', {
	pattern = '*grep*',
	command = 'cwindow',
})

-- do not list qf buffer
-- autocmd('QuickFixCmdPost', {
autocmd('QuickFixCmdPre', {
	pattern = '*',
	command = 'setlocal nobuflisted',
})
