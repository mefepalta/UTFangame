with (battle_enemy_engage)
{
	// Sans senaryo geregi sahne disindaysa (17-18. turlar) alphasi 0 oluyor ama
	// bu bir bloklama degil; blok sprite'i o sirada hic gorunmemeli.
	if (p2_offstage)
	{
		other.image_alpha = 0;
		other.image_index = 0;
		other.image_speed = 0;
	}
	else
	{
		if (p2_head_alpha == 0)
		{
			other.image_alpha = 1;
		}
		if (p2_head_alpha == 1)
		{
			other.image_alpha = 0;
		    other.image_index = 0;
			other.image_speed = 0;
		}
	}
}
if (sprite_index == spr_p2_comeatmebro)
{
	image_speed = 1;
}
// Sans'in ciziim konumunu takip et (hizalama onu yana kaydirabiliyor)
if (instance_exists(battle_enemy_engage))
{
    x_origin = battle_enemy_engage.p2_draw_x + x_offset;
}

if (shake_time > 0) {
    x = x_origin + random_range(-shake_strength, shake_strength);
    shake_time--;
} else {
    x = x_origin;
}

if (image_index > 12) and (image_index < 13)
{
	shakemoment = true;
}
else
{
	shakemoment = false;
}
if (shakemoment == true)
{
	shake_time = 6;
}
else
{
	shake_time = 0;
}