---------------------------------------------
-- GENERAL
---------------------------------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 15,
        border_size = 2,
        col = {
            active_border = "rgb(fbf1c7)",
            inactive_border = "rgba(928374aa)"
        },
        layout = "dwindle",
    },
    misc = {
        disable_hyprland_logo = true,
    },
    decoration = {
        rounding = 10,
        inactive_opacity = 0.8,
        blur = {
            enabled = true,
            size = 7,
            passes = 4,
            new_optimizations = true,
        }
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        force_split = 0,
        smart_split = false,
        smart_resizing = true,
    },
    group = {
        col = {
            border_active = "0xffff9900",
            border_inactive = "0xff000000",
        },
        groupbar = {
            enabled = true,
            font_size = 15,
            text_color = "0xffffffff",
            render_titles = true,
            col = {
                active = "0xfff9e2af",
                inactive = "0xff45475a",
            },
        },
    },
    input = {
        kb_layout = "us,it",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.5, -- 0 means no modification.
        numlock_by_default = true,
        touchpad = {
            natural_scroll = true,
        },
    },
})

---------------------------------------------
-- ANIMATIONS
---------------------------------------------
hl.curve("myBezier", { type = "bezier", points = { { 0.9, 0 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6,  bezier = "default" })


---------------------------------------------
-- MONITORS
---------------------------------------------
hl.monitor({
    output = HDMI2K,
    mode = "2560x1440@180",
    position = "0x0",
    scale = 1,
})
hl.monitor({
    output = HDMIFH,
    mode = "2560x1440",
    position = "2560x-500",
    scale = 1,
    transform = 3,
})

---------------------------------------------
-- NVIDIA ENVIRONMENT VARS
---------------------------------------------

-- Forces hardware acceleration (GBM/DRM) for nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")

-- Activate EGL backend for nvidia (crucial for RTX gpus)
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

---------------------------------------------
-- QT/GTK / WAYLAND GENERICS
---------------------------------------------
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Tells electron apps to use wayland only if possible
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
