local wezterm = require 'wezterm'
local config = wezterm.config_builder()

------------------------------
-- window settings
------------------------------
-- window size
config.initial_rows = 45
config.initial_cols = 160

-- window transparent
config.window_background_opacity = 0.85

------------------------------
-- font settings
------------------------------
wezterm.font("HackGen Console NF", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 14

------------------------------
-- sound settings
------------------------------
config.audible_bell = 'Disabled'

return config

