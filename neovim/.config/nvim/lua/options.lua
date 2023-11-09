local o = vim.opt
-- local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo
-- local go = vim.go

------------------------------
-- global options
------------------------------
------------------------------
-- window-local options
------------------------------
------------------------------
-- buffer-local options
------------------------------
------------------------------
-- g-local options
------------------------------

------------------------------
-- display settings
------------------------------
o.number = true
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 0

-- search settings
o.ignorecase = true
o.smartcase = true
o.wrapscan = false

-- undo settings
o.undofile = true

-- change directory to openning file's directory
o.autochdir = true

-- make tab completion behavior like bash in ex mode
o.wildmode = 'list:longest:full'

-- do not auto-wrap comments
o.formatoptions:remove({'r', 'o'})

-- show matched bracket
o.showmatch = true
o.matchtime = 1

-- TrueColor
o.termguicolors = true

-- switch buffer even if it is not saved
o.hidden = true

