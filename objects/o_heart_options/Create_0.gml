// In o_optionsmenu Create event
menu_items = [
    "Fullscreen",
    "Border",
    "Window Size",
    "No Heal",
    "No Hit",
    "Volume"
];
menu_index = 0; // currently selected option
window_scales = [0.5,1,2];
window_scale_labels = ["x0.5","x1","x2"];


image_alpha = 0;
target_alpha = 0; // Start invisible
fade_speed = 0.05;

target_x = 310; // Left of menu text
target_y = 350; // First option position

global.fullscreen = false;
if(!variable_global_exists("border_enabled")){
	global.border_enabled = false;
}
if(!variable_global_exists("window_scale_index")){
	global.window_scale_index = 1;
}
global.window_scale_index = floor(clamp(global.window_scale_index,0,array_length(window_scales)-1));
global.window_scale = window_scales[global.window_scale_index];
global.no_heal = false;
global.no_hit = false;
global.volume = 1;        // actual game volume
global.display_volume = global.volume; // used for bar animation
