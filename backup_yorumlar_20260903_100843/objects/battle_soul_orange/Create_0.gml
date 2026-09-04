event_inherited();

moveable = 1
dir = -1
alarm[0] = 1
p = part_type_create()
part_type_alpha2(p, 1, 0)
part_type_life(p, 25, 25)
part_type_sprite(p, 16, 0, 0, 0)
part_type_orientation(p, image_angle, image_angle, 0, 0, 0)
instance_create_depth(battle_soul.x,battle_soul.y,0,battle_soul_orange_effect)