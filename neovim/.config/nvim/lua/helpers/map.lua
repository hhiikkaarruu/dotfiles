------------------------------
-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
------------------------------
local helper = {}

for _, mode in pairs({ 'n', 'i', 'v', 'x', 't', 'c', 'o', 's' }) do
	helper[mode .. 'map'] = function(lhs, rhs, opts)
		vim.keymap.set(mode, lhs, rhs, opts or { noremap = true, silent = true })
	end
end

return helper
