--[[
  ****************
    Imports & Misc
  ****************
]]
local wezterm = require 'wezterm'
local act = wezterm.action

-- Always start maximized
local mux = wezterm.mux
wezterm.on(
    "gui-startup", function()
    local tab, pane, window = mux.spawn_window {}
    window:gui_window():maximize()
end)

return {
    --[[
  ****************
    Appearance
  ****************
  ]]
    color_scheme = "Catppuccin Mocha", -- Uncomment for Home
    -- color_scheme = "Catppuccin Frappe", -- Uncomment for Work
    font = wezterm.font(
        "Source Code Pro", { weight = "DemiBold" }
    ),
    disable_default_key_bindings = true,
    default_cursor_style = "SteadyBlock",
    enable_tab_bar = false,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    animation_fps = 60,
    --[[
  ****************
    Behavior
  ****************
  ]]
    default_prog = { "pwsh.exe", "-NoLogo", "-WorkingDirectory",  "~" },
    skip_close_confirmation_for_processes_named = { nil },
    exit_behavior = "Hold",
    --[[
  ****************
    KEYBINDS
  ****************
  ]]
    leader = { key = ' ', mods = 'CTRL' },
    keys = {
        { key = 'Enter',  mods = 'ALT',        action = act.ToggleFullScreen },
        { key = '+',      mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
        { key = '-',      mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
        { key = "'",      mods = 'LEADER',     action = act.SpawnCommandInNewTab { domain = 'CurrentPaneDomain' } },
        { key = "h",      mods = 'LEADER',     action = act.SpawnCommandInNewTab { domain = 'DefaultDomain' } },
        { key = 'C',      mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
        { key = 'n',      mods = 'LEADER',     action = act.SpawnWindow },
        { key = 'V',      mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'k',      mods = 'LEADER',     action = act.ActivateTabRelative(1) },
        { key = 'j',      mods = 'LEADER',     action = act.ActivateTabRelative( -1) },
        { key = 't',      mods = 'LEADER',     action = act.ShowTabNavigator },
        { key = 'p',      mods = 'LEADER',     action = act.PaneSelect },
        { key = 'X',      mods = 'LEADER',     action = act.ActivateCopyMode },
        { key = '[',      mods = 'LEADER',     action = act.ShowLauncher },
        { key = 'Q',      mods = 'LEADER',     action = act.CloseCurrentTab { confirm = true } },
        { key = 'q',      mods = 'LEADER',     action = act.CloseCurrentPane { confirm = true } },
        { key = 'w',      mods = 'LEADER',     action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
        { key = 'd',      mods = 'LEADER',     action = act.ScrollByPage( -1) },
        { key = 'u',      mods = 'SHIFT',      action = act.ScrollByPage(1) },
        { key = 'Insert', mods = 'SHIFT',      action = act.PasteFrom 'PrimarySelection' },
        { key = 'Insert', mods = 'CTRL',       action = act.CopyTo 'PrimarySelection' },
        { key = 'Copy',   mods = 'NONE',       action = act.CopyTo 'Clipboard' },
        { key = 'Paste',  mods = 'NONE',       action = act.PasteFrom 'Clipboard' },
    }
}
