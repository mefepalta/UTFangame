image_yscale = random_range(0.9,1.1);
if (place_meeting(x, y, battle_soul))
    if !(instance_exists(hurtkr))
         instance_create_depth(0, 0, 0, hurtkr);