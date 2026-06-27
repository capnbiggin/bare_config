-- Programs
local terminal      = "ghostty"
local browser1      = "zen-browser"
local browser2      = "vivaldi"
local browser3      = "google-chrome-stable"
local fileManager   = "thunar"
local notes1        = "obsidian"
local notes2        = "zennotes"
local editor1       = "code"
local editor2       = "zeditor"
local menu          = "~/.config/rofi/launchers/launcher-1.sh"
local capn_menu     = "~/.config/rofi/scripts/capn-menu.sh"
local power_menu    = "~/.config/rofi/scripts/capn-menu.sh power"
local wallpaper     = "~/.config/rofi/scripts/wallpapers.sh"
local cliphist      = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"
local waybar_toggle = "~/.config/waybar/scripts/launcher.sh"
local capture       = "~/.local/bin/screencap"

-- Sets "Windows" key as main modifier
local mod      = "SUPER"

-- Program binds
hl.bind(mod .. " + RETURN"       , hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + W"            , hl.dsp.exec_cmd(browser1))
hl.bind(mod .. " + SHIFT + W"    , hl.dsp.exec_cmd(browser2))
hl.bind(mod .. " + ALT + W"      , hl.dsp.exec_cmd(browser3))
hl.bind(mod .. " + E"            , hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + O"            , hl.dsp.exec_cmd(notes1))
hl.bind(mod .. " + SHIFT + O"    , hl.dsp.exec_cmd(notes2))
hl.bind(mod .. " + I"            , hl.dsp.exec_cmd(editor1))
hl.bind(mod .. " + SHIFT + I"    , hl.dsp.exec_cmd(editor2))
hl.bind(mod .. " + B"            , hl.dsp.exec_cmd(waybar_toggle))
hl.bind(mod .. " + CTRL + W"     , hl.dsp.exec_cmd(wallpaper))

-- Menu binds
hl.bind(mod .. " + ALT + SPACE"  , hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + SPACE", hl.dsp.exec_cmd(capn_menu))
hl.bind(mod .. " + CTRL + SPACE" , hl.dsp.exec_cmd(power_menu))
hl.bind(mod .. " + C"            , hl.dsp.exec_cmd(cliphist))

-- screencap
hl.bind(mod .. " + SHIFT + C"    , hl.dsp.exec_cmd(capture))

-- QUIT
hl.bind(mod .. " + Q"            , hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + Q"    ,
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Toggle Float
hl.bind(mod .. " + F"            , hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mod .. " + P"         , hl.dsp.window.pseudo())
-- hl.bind(mod .. " + J"         , hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mod + arrow keys
hl.bind(mod .. " + left"         , hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right"        , hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up"           , hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down"         , hl.dsp.focus({ direction = "down" }))
-- Move focus with mod + vim keys
hl.bind(mod .. " + H"            , hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L"            , hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K"            , hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J"            , hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key  , hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mod .. " + S"            , hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S"    , hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mod + scroll
hl.bind(mod .. " + mouse_down"   , hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up"     , hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272"    , hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273"    , hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume"   , hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume"   , hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute"          , hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute"       , hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp"    , hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown"  , hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
