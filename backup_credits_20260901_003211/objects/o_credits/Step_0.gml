creditstimer++;
x += hsp;
/*if (!BGM_IsPlaying(snd_goldenstarlight)) and (creditstimer > 1)
{
	audio_play_sound(snd_goldenstarlight,1,false);
}*/
if (creditstimer > 300) and (creditstimer < 820)
{
	hsp = -1.5;
	sprite_index = s_credits_0;
	image_alpha -= 0.002;
}
if (creditstimer == 820)
{
	x = 752;
	image_alpha = 1;
}

if (creditstimer > 820) and (creditstimer < 1340)
{
	sprite_index = s_credits_1;
	image_alpha -= 0.002;
}
if (creditstimer == 1340)
{
	x = 792;
	image_alpha = 1;
}
if (creditstimer > 1340) and (creditstimer < 1860)
{
	sprite_index = s_credits_2;
	image_alpha -= 0.002;
}
if (creditstimer == 1860)
{
	x = 802;
	image_alpha = 1;
}
if (creditstimer > 1860) and (creditstimer < 2380)
{
	sprite_index = s_credits_3;
	image_alpha -= 0.002;
}
if (creditstimer == 2380)
{
	x = 792;
	image_alpha = 1;
}
if (creditstimer > 2380) and (creditstimer < 2900)
{
	sprite_index = s_credits_4;
	image_alpha -= 0.002;
}
if (creditstimer == 2900)
{
	x = 792;
	image_alpha = 1;
}
if (creditstimer > 2900) and (creditstimer < 3420)
{
	sprite_index = s_credits_5;
	image_alpha -= 0.002;
}
if (creditstimer == 3420)
{
	x = 792;
	image_alpha = 1;
}
if (creditstimer > 3420) and (creditstimer < 3940)
{
	sprite_index = s_credits_6;
	image_alpha -= 0.002;
}
if (creditstimer == 3940)
{
	x = 792;
	image_alpha = 1;
}
if (creditstimer > 3940) and (creditstimer < 4460)
{
	sprite_index = s_credits_7;
	image_alpha -= 0.002;
}
if (creditstimer == 4560)
{
	x = 872;
	image_alpha = 1;
}
if (creditstimer > 4560) and (creditstimer < 5080)
{
	sprite_index = s_credits_8;
}
if (x < 320) and (creditstimer > 4560) and (creditstimer < 5700)
{
	hsp = 0;
	image_alpha = 1;
}
if (creditstimer > 5700)
{
	image_alpha -= 0.002;
}
if (global.p1sanshp == true)
{
	global.death_count = 0;
	global.p1sanshp = false;
}