if (collisiontime == true)
{
	collisiontimer++;
}
if (collisiontimer > 0)
{
	with (o_ow_shine)
	{
		image_alpha = image_alpha + 0.005;
		if (image_alpha > 1.05)
		{
			audio_stop_all();
			room_goto(room_phonecall);
		}
	}
}
if (collisiontimer == 1)
{
	audio_play_sound(snd_exit,1,false);
}