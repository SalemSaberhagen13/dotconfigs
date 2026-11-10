--------------------------------
-- FLOATERS
--------------------------------
hl.window_rule({ match = { class = "pavucontrol" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })


--------------------------------
-- APPS
--------------------------------
hl.window_rule({
    match = { class = "org.kde.dolphin" },
    float = true,
    size = "800 550",
    opacity = "0.8 0.75"
})

hl.window_rule({
    match = { class = "org.gnome.Nautilus" },
    float = true,
    animation = "popin",
    size = "800 550",
    opacity = "0.8 0.4 override"
})

hl.window_rule({
    match = { class = "discord" },
    workspace = "9",
    opacity = "1.0 1.0 override"
})

hl.window_rule({ match = { class = "spotify" }, workspace = "9" })

--------------------------------
-- OPACITY
--------------------------------
hl.window_rule({ match = { class = "firefox" }, opacity = "1.0 1.0 override" })
hl.window_rule({ match = { class = "jetbrains-pycharm" }, opacity = "1.0 1.0 override" })
hl.window_rule({ match = { class = "chromium" }, opacity = "1.0 1.0 override" })
hl.window_rule({ match = { class = "Docker Desktop" }, opacity = "1.0 1.0 override" })
hl.window_rule({ match = { class = "dev.zed.Zeddev.zed.Ze" }, opacity = "1.0 1.0 override" })


--------------------------------------
-- MONITORS AND WORKSPACES
--------------------------------------
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = HDMI2K, default = (i == 1) })
end
for i = 6, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = HDMIFH })
end
