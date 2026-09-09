res_override = false;
image_speed = 0;
res_idle_sprite[DIR.UP] = s_box;
res_idle_sprite[DIR.DOWN] = s_box;
res_idle_sprite[DIR.LEFT] = s_box;
res_idle_sprite[DIR.RIGHT] = s_box;
audio_play_sound(chest_close, 0, false);
if(instance_exists(char_player)){
    char_player._moveable_chest = true;
    char_player._moveable_box = true;
}