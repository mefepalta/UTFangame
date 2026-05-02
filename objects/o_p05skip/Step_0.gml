if (!global.death_count = 0)
{
	image_alpha = image_alpha - 0.01;
}
else
{
	instance_destroy();
}

if (instance_exists(o_p05skip))
{
	if(Input_IsPressed(INPUT.CONFIRM))
	{
		audio_stop_all();
		room_goto(room_battle);
	}
}