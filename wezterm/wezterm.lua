local wezterm = require 'wezterm'    -- needed for font function
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  
  skip_close_confirmation_for_processes_named = {nil},
  animation_fps = 30,
  exit_behavior = "Hold",
  default_cursor_style = "SteadyBlock",
  
  -- Default Shell
  default_prog = {"pwsh.exe", "-NoLogo"},
  
  -- ColorSchemes and font settings
  color_scheme = "Catppuccin Frappe",
  font = wezterm.font("Source Code Pro", {weight = "DemiBold"}),
  
  
  -- window_padding = {
    -- left   = "1px",
    -- right  = "1px",
    -- top    = "1px",
    -- bottom = "1px",
  -- },
  
  enable_tab_bar = false,
  
  -- Leader Key and Leader + <Key> binds
  leader = { key = ' ', mods = 'SHIFT'},

   keys = {
    { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Next' },
    
    { key = 'v', mods = 'LEADER', action = wezterm.action.SplitPane {
      direction = "Right",
      size = { Percent = 35 },
      },
    },
    
    { key = '\\', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
    
   
    { key = "'", mods = 'LEADER', action = wezterm.action.SpawnCommandInNewTab},
    { key = 'k', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1)},
    
    -- ShowLauncher binds
  
    -- Show default launcher
    { key = '[', mods = 'LEADER', action = wezterm.action.ShowLauncher },
    
    -- Show w/ Keybinds
    { key = 't', mods = 'LEADER', action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|KEY_ASSIGNMENTS'
    }},
    
    -- ShowLauncher w/ Workspaces
    { key = 'w', mods = 'LEADER', action = wezterm.action.ShowLauncherArgs { 
      flags = 'FUZZY|WORKSPACES'
    }},
    
    -- ShowLauncher w/ tabs
    { key = 't', mods = 'LEADER', action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|TABS'
    }}
  }
  
} 