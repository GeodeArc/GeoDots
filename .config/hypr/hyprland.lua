--
-- Hyprland Config (Lua)
-- @GeodeArc 2026
--

-- 
-- GLOBAL
--
broswer = '$(cat $HOME/Dots/Options/browser)'
terminal = '$(cat $HOME/Dots/Options/terminal)'

--
-- PERMS
--
hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")

--
-- SOURCE (main config)
--
require("config.general")
require("config.input")
require("config.keybinds")
require("config.monitors")
require("config.rules")
require("config.startup")
require("config.variables")

--
-- SOURCE (customizable config)
--
require("definitions.apptype")
require("definitions.cursortheme")
require("definitions.player")
require("definitions.colors")

--
-- SOURCE (theme)
--
require("theme")