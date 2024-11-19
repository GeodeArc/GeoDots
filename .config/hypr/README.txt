If Hyprlock looks wrong, make sure the resolution matches your current hyprlock config! 
Your resolution may not be here, just pick the closest and hope it looks decent. See line 12 for more.

If you have multiple monitors with different resoltuions, set your hyprlock preset to whatever the main display you want hyprlock to be on. This will make it look correct.

If you have multiple monitors, I would highly reccomend only showing everything below on ONE display. 
To do this, add your monitor after "monitor = " in every section below (run "hyprctl monitors | grep ID" to get monitors). 
DP-1, VGA-1, LVDS-1, HDMI-1, are examples of valid monitors.

These preset configs should work for ultrawide monitors, just make sure your vertical resolution matches the selected configs.

You may have a weird monitor resolution, such as some 16:10 or 4:3 displays. 
Unfortunately, I am unable to account for every resolution, and you will have to play around a bit if you have one of these. 
Select the closest vertical resolution to get started.

Tested vertical resolutions 720, 768 (use 720 preset), 900 (use 720 preset, bad), 1080, 1200 (use 1080 preset), 1440, 2160
Horizontal resolution shouldnt matter! dont worry.

Feel free to remove resolutions you dont have!
