if (diddytimer == 0)
{
	x = char_player.x;
	y = char_player.y - 10;
}
if (diddyvalue == true)
{
	diddytimer++;
}
x += hsp;
y += vsp;

show_debug_message(x);
show_debug_message(y);

if(diddytimer == 5)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(diddytimer == 5)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(diddytimer == 15)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(diddytimer == 20)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(diddytimer == 25)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(diddytimer == 30)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(diddytimer == 35)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(diddytimer == 40)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 0;
}
if(diddytimer == 45)
{
	audio_play_sound(snd_noise,2,false);
	image_alpha = 1;
}
if(diddytimer == 55)
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
if(diddytimer == 85)
{
	room_goto(room_p05);
}