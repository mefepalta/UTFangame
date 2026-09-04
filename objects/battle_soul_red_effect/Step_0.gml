if (instance_exists(battle_soul))
{
	x=battle_soul.x
	y=battle_soul.y
	sprite_index=battle_soul.sprite_index
	image_index=0
}

if (image_alpha <= 0) { instance_destroy(); }
