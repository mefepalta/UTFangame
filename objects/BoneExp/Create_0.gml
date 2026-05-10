depth=DEPTH_BATTLE.UI_HIGH
// x=Flash.x  ← SİL
// y=Flash.y  ← SİL
image_speed=1/4
gravity=0.1
gravity_direction=DIR.DOWN
speed=2.5
direction=random(360)
image_angle=0
image_index=random_range(0,2);
show_debug_message("Object: " + object_get_name(object_index) + " sprite: " + string(sprite_index));