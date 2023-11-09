local n = 'n'
local i = 'i'
local v = 'v'
local noremap = {noremap = true}
local noremap_silent = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map(n, ' ', '', {})
vim.g.mapleader = ' '

------------------------------
-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
------------------------------

------------------------------
-- base keymaps
------------------------------
-- for english keyboard
map(n, ';', ':', noremap)
map(n, ':', ';', noremap)
map(v, ';', ':', noremap)
map(v, ':', ';', noremap)

-- for wrapped line
map(n, 'j', 'gj', noremap_silent)
map(n, 'k', 'gk', noremap_silent)
map(v, 'j', 'gj', noremap_silent)
map(v, 'k', 'gk', noremap_silent)

-- esc is really far away from home position
map(i, 'kj', '<esc>', noremap_silent)

-- it is convenient, but do not do it on your own
map(n, 'ZZ', '<nop>', noremap_silent)
map(n, 'ZQ', '<nop>', noremap_silent)

-- i wish it was the default
map(n, 'Y', 'y$', noremap_silent)

-- do not fly on your own
map(n, '*', '*N', noremap_silent)
map(n, '#', '#n', noremap_silent)

-- show full path on <C-g>
map(n, '<c-g>', '1<c-g>', noremap_silent)


------------------------------
-- tab keymaps
-- use buffer instead of tab !! comment out !!
------------------------------
-- open file in new tab
-- map(n, 'tf', ':<c-u>tabf ', noremap)

-- duplicate current tab
-- map(n, 'tt', '<c-w>v<c-w>T', noremap_silent)

-- tab switching
-- map(n, 'tl', 'gt', noremap_silent)
-- map(n, 'th', 'gT', noremap_silent)
-- map(n, '<Tab>', 'gt', noremap_silent)
-- map(n, '<S-Tab>', 'gT', noremap_silent)

-- gf in new tab
-- map(n, 'gf', '<c-w>gf', noremap_silent)
-- map(n, 'gF', '<c-w>gF', noremap_silent)

-- tag jump in new tab
-- map(n, '<c-]>', ':<c-u>tab stj <c-R>=expand("<cword>")<cr><cr>', noremap_silent)

------------------------------
-- buffer keymaps
------------------------------
-- buffer switching
map(n, 'tl', '<cmd>bnext<cr>', noremap_silent)
map(n, 'th', '<cmd>bprev<cr>', noremap_silent)

-- quit current buffer
map(n, '<leader>q', '<cmd>bprev<cr><cmd>bd#<cr>', noremap_silent)

------------------------------
-- window keymaps
------------------------------
-- window switching
map(n, '<c-j>', '<c-w>j', noremap_silent)
map(n, '<c-k>', '<c-w>k', noremap_silent)
map(n, '<c-h>', '<c-w>h', noremap_silent)
map(n, '<c-l>', '<c-w>l', noremap_silent)

------------------------------
-- useful keymaps
------------------------------
-- same indent moving
map(n, '{', ':<c-u>call search("^". matchstr(getline("."), "\\(^\\s*\\)") ."\\%<" . line(".") . "l\\S", "be")<cr>', noremap_silent)
map(n, '}', ':<c-u>call search("^". matchstr(getline("."), "\\(^\\s*\\)") ."\\%>" . line(".") . "l\\S", "e")<cr>', noremap_silent)

-- word searching
map(n, '<leader>/', '/<c-u>\\<\\><left><left>', noremap)

