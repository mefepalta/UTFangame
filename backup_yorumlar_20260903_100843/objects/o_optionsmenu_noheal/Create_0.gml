image_alpha = 0;
target_alpha = 0; // Start invisible
fade_speed = 0.05;

toggled = false;
default_sprite = s_tinymenu_noheal;
active_sprite = s_tinymenu_noheal_1;

is_active = false;
is_selected = false;

if (is_selected) {
    sprite_index = s_tinymenu_noheal_1;
} else {
    sprite_index = s_tinymenu_noheal;
}
