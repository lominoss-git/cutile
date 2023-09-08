local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'nord'

config.font = wezterm.font("Iosevka")
config.font_size = 18.0

config.window_close_confirmation = 'NeverPrompt'

config.audible_bell = 'Disabled'

config.window_padding = {
    left = 12,
    right = 12,
    top = 12,
    bottom = 12,
}

config.enable_tab_bar = false

return config
