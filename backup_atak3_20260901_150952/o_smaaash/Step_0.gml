if (_ready == true)
{
    image_alpha = 1;
    image_speed = 1;
}
if (_ready == false)
{
    image_alpha = 0;
    image_speed = 0;
}

// Trigger when the frame actually CHANGES
var current_frame = floor(image_index);

if (image_alpha == 1 && current_frame != prev_frame)
{
    if (current_frame == 0)
    {
        audio_play_sound(snd_smash_rise, 2, false);
    }
	/*if (current_frame == 6)
    {
		bonedirection = random_range(0,1);
    }*/
    if (current_frame == 7)
    {
        audio_play_sound(snd_smash_impact, 2, false);
        Camera_Shake(5,5,1,1,1,1);
    }
}

// Update previous frame
prev_frame = current_frame;
