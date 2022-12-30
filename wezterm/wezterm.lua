--[[
  ****************
    Imports & Misc
  ****************
]]
local wezterm = require 'wezterm'

-- Always start maximized
local mux = wezterm.mux
wezterm.on (
  "gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
  end )

return {
  --[[
  ****************
    Appearance
  ****************
  ]]
  color_scheme = "Catppuccin Mocha",
  font = wezterm.font( 
    "Source Code Pro", { weight = "DemiBold" }
  ),
  default_cursor_style = "SteadyBlock",
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  animation_fps = 30,
  
  --[[
  ****************
    Behavior
  ****************
  ]]
  default_prog = { "pwsh.exe", "-NoLogo" },
  skip_close_confirmation_for_processes_named = { nil },
  exit_behavior = "Hold",

  --[[ 
  ****************
    KEYBINDS
  ****************
  ]]   
  leader = { key = ' ', mods = 'SHIFT' },
  keys = {
    {
      -- Activate Next Pane
      key = 'j', 
      mods = 'LEADER', 
      action = wezterm.action.ActivatePaneDirection 'Next' 
    },
    { 
      -- Split Pane Vertically
      key = 'v',
      mods = 'LEADER',
      action = wezterm.action.SplitPane {
        direction = "Right",
        size = { Percent = 35 }}
    },
    { 
      -- Close Pane w/ Confirmation
      key = '\\',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentPane { 
        confirm = true }
    },
    { 
      -- New Tab
      key = "'",
      mods = 'LEADER',
      action = wezterm.action.SpawnCommandInNewTab
    },
    { 
      -- Activate Next Tab
      key = 'k', 
      mods = 'LEADER', 
      action = wezterm.action.ActivateTabRelative(1)
    },
    { 
      -- ShowLauncher
      key = '[',
      mods = 'LEADER', 
      action = wezterm.action.ShowLauncherArgs { 
        flags = 'FUZZY|COMMANDS' }
    },
    { 
      -- ShowLauncher w/ Workspaces
      key = 'w', 
      mods = 'LEADER', 
      action = wezterm.action.ShowLauncherArgs { 
        flags = 'FUZZY|WORKSPACES|TABS' }
    },
    { 
      -- ShowLauncher (Tabs)
      key = 't',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncherArgs {
        flags = 'FUZZY|TABS' }
    }}
} 