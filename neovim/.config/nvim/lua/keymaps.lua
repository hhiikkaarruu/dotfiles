local h = require('helpers.map')
local noremap = { noremap = true }

------------------------------
-- base keymaps
------------------------------
-- set leader to space
h.nmap(' ', '', {})
vim.g.mapleader = ' '

-- for english keyboard
h.nmap(';', ':', noremap)
h.nmap(':', ';', noremap)
h.vmap(';', ':', noremap)
h.vmap(':', ';', noremap)

-- for wrapped line
h.nmap('j', 'gj')
h.nmap('k', 'gk')
h.vmap('j', 'gj')
h.vmap('k', 'gk')

-- esc is really far away from home position
h.imap('kj', '<esc>')

-- it is convenient, but do not do it on your own
h.nmap('ZZ', '<nop>')
h.nmap('ZQ', '<nop>')

-- i wish it was the default
h.nmap('Y', 'y$')

-- do not fly on your own
h.nmap('*', '*N')
h.nmap('#', '#n')

-- show full path on <C-g>
h.nmap('<c-g>', '1<c-g>')

-- disable yank with x and s
h.nmap('x', '"_x')
h.nmap('X', '"_X')
h.vmap('x', '"_x')
h.vmap('X', '"_X')
h.xmap('x', '"_x')
h.xmap('X', '"_X')
h.nmap('s', '"_s')
h.nmap('S', '"_S')
h.vmap('s', '"_s')
h.vmap('S', '"_S')
h.xmap('s', '"_s')
h.xmap('S', '"_S')

-- disable yank with p in visual mode
h.vmap('p', 'P')
h.vmap('P', 'p')
h.xmap('p', 'P')
h.xmap('P', 'p')

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
-- refer to plugins/tabline.lua
------------------------------

------------------------------
-- window keymaps
------------------------------
-- window switching
h.nmap('<c-j>', '<c-w>j')
h.nmap('<c-k>', '<c-w>k')
h.nmap('<c-h>', '<c-w>h')
h.nmap('<c-l>', '<c-w>l')

------------------------------
-- window keymaps
------------------------------
h.nmap('<c-n>', '<cmd>cnext<cr>')
h.nmap('<c-p>', '<cmd>cprev<cr>')

------------------------------
-- motion keymaps
------------------------------
-- same indent moving
h.nmap('{', '<cmd>call search("^". matchstr(getline("."), "\\(^\\s*\\)") ."\\%<" . line(".") . "l\\S", "be")<cr>')
h.nmap('}', '<cmd>call search("^". matchstr(getline("."), "\\(^\\s*\\)") ."\\%>" . line(".") . "l\\S", "e")<cr>')

-- word searching
h.nmap('<leader>/', '/<c-u>\\<\\><left><left>', noremap)

------------------------------
-- nvimdiff keymaps
------------------------------
-- get from local
h.nmap('<leader>1', '<cmd>diffget LOCAL<cr>')
-- get from base
h.nmap('<leader>2', '<cmd>diffget BASE<cr>')
-- get from remote
h.nmap('<leader>3', '<cmd>diffget REMOTE<cr>')

------------------------------
-- terminal keymaps
------------------------------
-- open terminal in small splited window
h.nmap('<leader>s', '<cmd>split| wincmd j| resize 15| terminal<cr>')

-- esc hehave as esc
h.tmap('<esc>', '<c-\\><c-n>')

h.tmap('<c-j>', '<c-\\><c-n><c-w>j')
h.tmap('<c-k>', '<c-\\><c-n><c-w>k')
h.tmap('<c-h>', '<c-\\><c-n><c-w>h')
h.tmap('<c-l>', '<c-\\><c-n><c-w>l')

