HOME = os.getenv("HOME")
BINFOLDER = HOME .. "/.local/bin"

-- Input devices
KEYBOARD = "sino-wealth-usb-keyboard"
KEYBOARD2 = "semico-usb-keyboard"
HDMI2K = "DP-2"
HDMIFH = "DP-1"

-- Default applications
TERMINAL = "kitty"
BROWSER1 = "firefox"
BROWSER2 = "chromium"
F_MANAGER1 = "nautilus"
F_MANAGER2 = "thunar"
GAMMASTEP = BINFOLDER .. "/gammastep/gammastep_manager.sh"
WAYBAR = BINFOLDER .. "/launch_waybar.sh"

require("conf.conf")
require("conf.keybindings")
require("conf.rules")
require("conf.autostart")
