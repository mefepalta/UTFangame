y = lerp(y, target_y, move_speedy);
x = lerp(x, target_x, move_speedx);

with (o_p1final_fall)
{
	if (p1finalattackval == 250)
	{
		other.target_y = 32;
	}
	if (p1finalattackval == 300)
	{
		other.image_index = 1;
	}
	if (p1finalattackval == 340)
	{
		instance_create_layer(o_p1final_sansgbfront.x + 50,o_p1final_sansgbfront.y + 43,"Instances_2",o_eyeshine);
		audio_play_sound(snd_eye,2,false);
		other.sprite_index = s_p1final_sansgbfront_1;
	}
	if (p1finalattackval == 370)
	{
		other.image_index = 1
	}
	if (p1finalattackval == 410)
	{
		other.target_x = 448;
	}
	if (p1finalattackval == 470)
	{
		other.isittimeyet = true;
	}
}


if (isittimeyet = true)
{
	instance_destroy();
}