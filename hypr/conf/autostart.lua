-- $mountonedrive = rclone mount oneunipd: /home/salem/UniPD/ --vfs-cache-mode full --vfs-cache-poll-interval 1m --vfs-cache-max-size 128G --vfs-cache-max-age 10h --vfs-write-back 5m --cache-chunk-total-size 64G
local mountMEGA = (
    "rclone mount MEGA: /home/salem/MEGA/ --vfs-cache-mode full --vfs-cache-poll-interval 1m --vfs-cache-max-size 128G --vfs-cache-max-age 10h --vfs-write-back 5m --cache-chunk-total-size 64G"
)
local random_wallpaper = BINFOLDER .. "/awww_random.py"
-- $wallpaper1 = swww img ~/Pictures/vapor/vapor02.jpg --outputs HDMI-A-2
-- $wallpaper2 = swww img ~/Pictures/vapor/vert/dolphin_resized.png --outputs DP-2
-- $set_gtk_theme = gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Dark'
local set_gtk_color = "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
local discord = BINFOLDER .. "/discord.sh"

local autostart = {
    HOME .. "/.config/hypr/xdg-portal-hyprland",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
    "awww-daemon -f xrgb",
    WAYBAR,
    "mako",
    "blueman-applet",
    "nm-applet --indicator",
    "wl-paste -t text --watch clipman store",
    "wl-paste -p -t text --watch clipman store -P --histpath=" .. HOME .. "/.local/share/clipman-primary.json",
    GAMMASTEP .. " --automatic",
    "[workspace 9 silent] " .. discord,
    random_wallpaper,
    set_gtk_color,
    mountMEGA,
    "[workspace 10 silent] docker desktop start",
}

hl.on(
    "hyprland.start",
    function()
        for _, cmd in ipairs(autostart) do
            hl.exec_cmd(cmd)
        end
    end
)
