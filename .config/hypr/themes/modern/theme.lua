---
--- ANIMATIONS
---
-- Define Curves
hl.curve("wind",   { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.05} } })
hl.curve("winIn",  { type = "bezier", points = { {0.1, 1.1},   {0.1, 1.1}  } })
hl.curve("winOut", { type = "bezier", points = { {0.3, -0.3},  {0, 1}      } })
hl.curve("liner",  { type = "bezier", points = { {1, 1},       {1, 1}      } })

-- Global Animation State
hl.animation({ leaf = "global",      enabled = true, speed = 10, bezier = "default" })

-- Define Animations
hl.animation({ leaf = "windows",     enabled = true, speed = 6,  bezier = "wind",   style = "slide" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 6,  bezier = "winIn",  style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5,  bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5,  bezier = "wind",   style = "slide" })
hl.animation({ leaf = "border",      enabled = true, speed = 1,  bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner" })
hl.animation({ leaf = "fade",        enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5,  bezier = "wind" })


--
-- THEME CONFIG
--
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border = foreground,
            inactive_border = "rgba(595959aa)",
        },
    },

    decoration = {
        rounding       = 20,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 4,
            vibrancy  = 0.1696,
            xray 	  = false
        },
    },

    animations = {
        enabled = true,
    },
})


--
-- LAYER RULES
--
local blur_layers = { "waybar", "vicinae", "swaync-control-center", "swaync-notification-window", "rofi", "swayosd", "gtk-layer-shell" }

for _, namespace in ipairs(blur_layers) do
    hl.layer_rule({ name = "blur-and-alpha-" .. namespace, match = { namespace = namespace }, blur = true, ignore_alpha = 0.5 })
end