-- https://alexplescan.com/posts/2024/08/10/wezterm/

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Use the gruvbox theme which matches the system appearance.
if wezterm.gui and wezterm.gui.get_appearance():find("Dark") then
	config.color_scheme = 'GruvboxDark'
else
	config.color_scheme = 'GruvboxLight'
end

config.window_decorations = 'RESIZE'

config.scrollback_lines = 1000000

config.default_prog = { '/usr/local/bin/fish', '-l' }

config.leader = { key = 'f', mods = 'CTRL' }

-- Match Tmux Pain Control. 
config.keys = {
  {
    key = '|',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Down'),
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Up'),
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Left'),
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection('Right'),
  },
  {
    key = 'J',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Down', 4 },
  },
  {
    key = 'K',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Up', 4 },
  },
  {
    key = 'H',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Left', 4 },
  },
  {
    key = 'L',
    mods = 'LEADER',
    action = wezterm.action.AdjustPaneSize { 'Right', 4 },
  },
}

return config
