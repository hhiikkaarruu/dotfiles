local o = vim.opt

------------------------------
-- encode settings
------------------------------
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

------------------------------
-- display settings
------------------------------
-- show line number
o.number = true
-- do not wrap line
o.wrap = false
-- number of spaces of tab
o.tabstop = 4
-- number of spaces of indent
o.shiftwidth = 4
-- enable true color
o.termguicolors = true
-- show matched bracket
o.showmatch = true
o.matchtime = 1
-- disable folding
o.foldenable = false

------------------------------
-- search settings
------------------------------
-- ignore when only lower case letter
o.ignorecase = true
-- obey when contain upper case letter
o.smartcase = true
-- do not loop
o.wrapscan = false

------------------------------
-- editor settings
------------------------------
-- change directory to openning file's directory
o.autochdir = true
-- enable permanent undo
o.undofile = true
-- switch buffer even if it is not saved
o.hidden = true
-- do not auto-wrap comments
o.formatoptions:remove({ 'r', 'o' })
-- disable mouse
o.mouse = ''

------------------------------
-- ex mode settings
------------------------------
-- make tab completion behavior like bash in ex mode
o.wildmode = 'list:longest:full'

