// In o_optionsmenu Create event
menu_items = [
    "Fullscreen",
    "No Heal",
    "No Hit",
    "Volume"
];
menu_index = 0; // currently selected option


image_alpha = 0;
target_alpha = 0; // Start invisible
fade_speed = 0.05;

target_x = 310; // Left of menu text
target_y = 350; // First option position

global.fullscreen = false;
global.no_heal = false;
global.no_hit = false;
global.volume = 1;        // actual game volume
display_volume = global.volume; // used for bar animation

