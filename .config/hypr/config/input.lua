hl.config({
    input = {
        kb_layout  = "us",
        
        follow_mouse = 1,
        sensitivity = 0,
        
        touchpad = {
            scroll_factor = 0.6,
            natural_scroll = false,
            disable_while_typing = false,
            clickfinger_behavior = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "fullscreen"
})