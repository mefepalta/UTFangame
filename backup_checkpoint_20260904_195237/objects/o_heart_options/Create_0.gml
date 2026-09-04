menu_items = [
    "Fullscreen",
    "Border",
    "Window Size",
    "No Heal",
    "No Hit",
    "Volume"
];
menu_index = 0;
window_scales = [0.5,1,2];
window_scale_labels = ["x0.5","x1","x2"];


image_alpha = 0;
target_alpha = 0;
fade_speed = 0.05;

target_x = 310;
target_y = 350;

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
global.volume = 1;
global.display_volume = global.volume;

optt = 0;
line_h = 14;

panel_w   = 250;
row_sp    = 22;
panel_cx  = 320;
panel_cy  = 240;
panel_top = 133;
panel_bot = 347;
title_y   = 149;
rows_y    = 175;
hint_y    = 319;
text_left = 229;
text_right = 423;
