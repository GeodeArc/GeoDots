-- 
-- DEFAULT WINDOW RULES
-- 
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "office-and-photoshop-fixes",
    match = { class = "^(Microsoft Word|Microsoft Excel|Microsoft PowerPoint|Photoshop|File Explorer)$" },
    suppress_event   = "fullscreen maximize activate activatefocus",
    no_initial_focus = true,
    fullscreen       = true,
    no_anim          = true,
    border_size      = 0,
    no_shadow        = true,
    no_blur          = true,
    xray             = 0,
    opaque           = true,
})

--
-- GEODOTS WINDOW RULES
--
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = { 1150, 600}, center = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, size = { 850, 550}, center = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true, center = true })
hl.window_rule({ match = { class = "waypaper" }, float = true, size = { 800, 600}, center = true })
hl.window_rule({ match = { title = "Calculator" }, float = true, size = { 380, 600}, center = true })
hl.window_rule({ match = { class = "com.nokyan.Resources" }, float = true, size = { 1150, 600}, center = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true, size = { 1150, 600}, center = true })
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true, size = { 640, 360}, pin = true, move = { 0, 0} })

--
-- LAYER RULES
--


--
-- WORKSPACE RULES
--