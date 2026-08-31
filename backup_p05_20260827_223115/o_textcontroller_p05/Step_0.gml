p05++;

// Time since game start
var elapsed = (current_time - start_time) / 1000;

// Start new line when its time is reached
if (current_line + 1 < array_length(dialogue)) {
    if (elapsed >= dialogue[current_line + 1].time) {
        current_line++;
        line_start_time = elapsed;
        last_chars = 0; // reset when new line starts
    }
}

if (p05 > 2750)
{
	with (o_p05arm)
	{
		image_alpha = 0;
	}
	with (o_p05arm_1)
	{
		image_alpha = 0;
	}
	with (o_p05head)
	{
		image_alpha = 0;
	}
	with (o_p05legs)
	{
		image_alpha = 0;
	}
	with (o_p05body)
	{
		image_alpha = 0;
	}
	with (o_p05wingthings)
	{
		image_alpha = 0;
	}
	with (o_p05wingthings_1)
	{
		image_alpha = 0;
	}
	with (o_p05spear)
	{
		image_alpha = 0;
	}
	with (o_p05decoy)
	{
		image_alpha = 1;
	}
}
if (p05 > 2950)
{
	audio_stop_all();
	room_goto(room_battle);
}
	
if(keyboard_check_pressed(vk_space)) room_goto(room_battle);