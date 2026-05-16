hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME",cursortheme)
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME",cursortheme)

hl.env("QT_QPA_PLATFORMTHEME","qt6ct")

-- *fix* wayland blurriness (https://wiki.hypr.land/Configuring/XWayland/#hidpi-xwayland)
-- comment this if you are experiencing issues with electron apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")