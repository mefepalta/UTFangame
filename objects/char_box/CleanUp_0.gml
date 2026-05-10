ds_list_destroy(_collision_list);
if(instance_exists(char_box)){
    with(char_box){
        res_override = true;
        sprite_index = s_box_sprite_closing;
        image_index = 0;
        image_speed = 0.5;
        alarm[1] = 14;
    }
}
if(instance_exists(char_player)){
    char_player._moveable_chest = true;
}