// char_box User Event 0 başına:
if(instance_exists(char_player)){
    char_player._moveable_chest = false;
    char_player._moveable_box = false;
}
res_override = true;
sprite_index = s_box_sprite_opening;
image_index = 0;
image_speed = 0.5;
audio_play_sound(chest_open,2,false);
alarm[0] = 22;