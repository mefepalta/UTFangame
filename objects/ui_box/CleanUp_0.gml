if(instance_exists(char_box)){
    with(char_box){
        res_override = true;
        sprite_index = s_box_sprite_closing;
        image_index = 0;
        image_speed = 0.5;
        alarm[1] = 24;
    }
}
// Diğer instance_destroy satırları aynı kalacak
if(instance_exists(_inst_inventory)){
	instance_destroy(_inst_inventory);
}
if(instance_exists(_inst_box)){
	instance_destroy(_inst_box);
}
if(instance_exists(_inst_item_inventory)){
	instance_destroy(_inst_item_inventory);
}
if(instance_exists(_inst_item_box)){
	instance_destroy(_inst_item_box);
}
if(instance_exists(_inst_finish)){
	instance_destroy(_inst_finish);
}