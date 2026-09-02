/*if(keyboard_check_pressed(vk_anykey))
{
	p1finalattack = true;
}*/
y = lerp(y, target_y, move_speedy);

if (p1finalattack == true)
{
	image_speed = 1;
	image_alpha = 1;
	p1finalattackval++;
}
if (image_index == 21)
{
	image_speed = 0;
	image_alpha = 0;
}
if (image_index == 10)
{
	target_y = 372;
}
if (p1finalattackval == 1)
{
	with (battle_enemy_engage)
	{
		_head_alpha = 0;
		_spear_alpha = 0;
		_armleft_alpha = 0;
		_armright_alpha = 0;
		_legs_alpha = 0;
	}
	with (o_sans_blockp1)
	{
		image_alpha = 0;
	}
	with (o_smaaash)
	{
		image_alpha = 0;
	}
	with (o_obligatoryblackscreen)
	{
		image_alpha = 0;
	}
}