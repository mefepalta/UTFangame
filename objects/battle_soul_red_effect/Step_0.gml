if (instance_exists(battle_soul))
{
	x=battle_soul.x
	y=battle_soul.y
	sprite_index=battle_soul.sprite_index
	image_index=0
	image_angle=battle_soul.image_angle
}

if (image_alpha <= 0) { instance_destroy(); }
