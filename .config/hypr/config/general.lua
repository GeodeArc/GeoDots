hl.config({
	general = {
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
	},
	
	dwindle = {
        preserve_split = true,
    },

    misc = {
		force_default_wallpaper = 1,
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
		on_focus_under_fullscreen = 1,
		vrr = 0,
    },
    
    binds = {
		disable_keybind_grabbing = false
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = false,
		use_nearest_neighbor = false
	},

	cursor = {
		sync_gsettings_theme = true,
		enable_hyprcursor = true
	},
})