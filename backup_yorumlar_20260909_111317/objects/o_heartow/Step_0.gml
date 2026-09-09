if (htimer == 0)
{
	x = char_player.x;
	y = char_player.y - 10;
}
if (hvalue == true)
{
	audio_stop_sound(overworld_bg);
	htimer++;
}
x += hsp;
y += vsp;

if(htimer == 5)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(htimer == 5)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(htimer == 15)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(htimer == 20)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(htimer == 25)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(htimer == 30)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(htimer == 35)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(htimer == 40)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(htimer == 45)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(htimer == 55)
{
	audio_play_sound(snd_encounter_soul_move,2,false);
	hsp = -3;
	vsp = 3;
}
if(x < 571)
{
	hsp = 0;
}
if(y > 218)
{
	vsp = 0;
}
if(htimer == 85)
{
	room_goto(room_p05);
}