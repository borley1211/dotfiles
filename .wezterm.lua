local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキーム
config.color_scheme = 'Default (dark) (terminal.sexy)'

-- 背景透過
config.window_background_opacity = 0.95

-- フォント
config.font = wezterm.font 'Monaspace Neon'
config.font_size = 14.0

-- RETURN
return config

