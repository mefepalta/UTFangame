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
		// Bu nesne hem room_p05'te hem room_p15'te duruyor; eskiden her
		// ikisinde de Faz 1'e (room_battle) atliyordu. Faz 1.5'ten
		// atlanan yer Faz 2 olmali.
		if (room == room_p15)
		{
			global.sansphase = 2;
			room_goto(room_battle_1);
		}
		else
		{
			room_goto(room_battle);
		}
	}
}
