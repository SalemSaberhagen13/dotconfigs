-- Directions
local H = "left"
local J = "down"
local K = "up"
local L = "right"

-- Commands
local ide1 = "zeditor"
-- $ide1 = WAYLAND_DISPLAY='' zeditor
local ide2 = "pycharm"
local switch_audio = BINFOLDER .. "/switch_audio_source.sh"
-- slurp just gives back the area of the screen and resolution
local screenshot_area = "grim -t jpeg -q 100 -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).jpg"
local screenshot = "grim -t jpeg -q 100 ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).jpg"
local whatsapp = "chromium --app=https://web.whatsapp.com/"
local ai_app = "firefox --new-window https://perplexity.ai"
local ranger = "kitty -e zsh -c \"ranger; zsh\""
local launcher = BINFOLDER .. "/bemenu.sh"
local clipboard = BINFOLDER .. "/clipboard.sh"


----------------------------------
-- APPLICATION START            --
----------------------------------

-----------------------------
-- Apps
-----------------------------
hl.bind("SUPER + Q", hl.dsp.exec_cmd(TERMINAL))
hl.bind("SUPER + W", hl.dsp.exec_cmd(BROWSER1))
hl.bind("SUPER + C", hl.dsp.exec_cmd(ide1 .. " -n"))                    -- New zeditor window
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("[workspace 2] " .. ide2)) -- Pycharm
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd(ide1 .. " ~/.config"))       -- Open dotfiles
hl.bind("SUPER + D", hl.dsp.exec_cmd(F_MANAGER1))                       -- Open file manager


-----------------------------
-- Utilities
-----------------------------
hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("wlogout --protocol layer-shell"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(WAYBAR))
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd("swaylock"))                                -- Lock screen
hl.bind("SUPER + I", hl.dsp.exec_cmd("hyprctl switchxkblayout " .. KEYBOARD .. " next")) -- Change keyboard layout
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(launcher))                                        -- Run bemenu app laucher
hl.bind("ALT + V", hl.dsp.exec_cmd(clipboard))                                           -- Run clipman with bemenu as tool
hl.bind("SUPER + S", hl.dsp.exec_cmd(screenshot_area))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(screenshot))                                -- Screenshot all screen/s
hl.bind("SUPER + A", hl.dsp.exec_cmd(switch_audio))                                      -- Switch audio output device
hl.bind("SUPER + ALT + G", hl.dsp.exec_cmd(GAMMASTEP))                                   -- Bluelight sucks bad
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd(GAMMASTEP .. " movie"))
hl.bind("SUPER + ALT + X", hl.dsp.exec_cmd(GAMMASTEP .. " xtreme"))
hl.bind("SUPER + ALT + D", hl.dsp.exec_cmd("killall -9 gammastep"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("okular"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("xournalpp"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("[workspace 9] spotify"))



----------------------------------
-- WINDOW MANAGEMENT            --
----------------------------------
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind("SUPER + ALT + T", hl.dsp.exec_cmd("shutdown 0"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("reboot"))
hl.bind("SUPER + E", hl.dsp.layout("togglesplit"))

-- RESIZE
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize attivo con mainMod + CTRL + arrow keys
hl.bind("SUPER + CTRL + right", hl.dsp.window.resize({ x = 150, y = 0, relative = true }))
hl.bind("SUPER + CTRL + left", hl.dsp.window.resize({ x = -150, y = 0, relative = true }))
hl.bind("SUPER + CTRL + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + CTRL + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))
-- Vim keybinds
hl.bind("SUPER + CTRL + l", hl.dsp.window.resize({ x = 150, y = 0, relative = true }))
hl.bind("SUPER + CTRL + h", hl.dsp.window.resize({ x = -150, y = 0, relative = true }))
hl.bind("SUPER + CTRL + k", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + CTRL + j", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

for _, bind_info in ipairs({
    { "h", H },
    { "j", J },
    { "k", K },
    { "l", L },
}) do
    local key = bind_info[1]
    local direction = bind_info[2]
    -- move focus
    hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = direction }))
    -- move window
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
    -- moves into GROUP
    hl.bind("SUPER + SHIFT + " .. direction, hl.dsp.window.move({ into_group = direction }))
        -- also valid
        -- hl.bind("SUPER + SHIFT + " .. direction, hl.dsp.window.move({ direction = direction, group_aware = true }))

end

----------------------------------
-- GROUPS
----------------------------------
hl.bind("SUPER + G", hl.dsp.group.toggle()) -- toggle group
hl.bind("SUPER + Tab", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + Tab", hl.dsp.group.prev())
hl.bind("SUPER + SHIFT + G", hl.dsp.group.lock({ action= "toggle" }))
-- move into group is declared in a for loop above here

----------------------------------
-- WORKSPACES
----------------------------------
for i = 1, 10 do
    local key = i % 10
    -- focus
    hl.bind("SUPER + " .. tostring(key), hl.dsp.focus({ workspace = i }))
    -- move window silently to workspace
    hl.bind("SUPER + SHIFT + " .. tostring(key), hl.dsp.window.move({ workspace = i, follow = false }))
    -- move window to workspace and follows
    hl.bind("SUPER + CTRL + SHIFT + " .. tostring(key), hl.dsp.window.move({ workspace = i, follow = true }))
end

-- move to adiacent workspace
hl.bind("SUPER + left", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + right", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + M", hl.dsp.exec_cmd("hyprctl dispatch movecurrentworkspacetomonitor r"))
