if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) image_alpha = target_alpha;
}

with (o_textcontroller_p05)
{
	if (p05 > 2720) and (p05 < 2740)
	{
		other.target_alpha = other.target_alpha + 0.15;
	}
	if (p05 > 2740) and (p05 < 2770)
	{
		other.target_alpha = other.target_alpha - 0.1;
	}
	if (p05 == 2730)
	{
		audio_play_sound(snd_shine,2,0);
	}
	if (p05 > 2770)
	{
		other.sprite_index = Sprite214;
		other.target_alpha = other.target_alpha + 0.02;
	}
}
with (o_textcontroller_p15)
{
	if (p15 == 0)
	{
		other.image_alpha = 1;
		other.target_alpha = 1;
	}
	if (p15 > 0) and (p15 < 50)
	{
		other.target_alpha -= 0.03;
	}
	if (p15 > 5100)
	{
		other.sprite_index = Sprite214;
		other.target_alpha += 0.02;
	}
	if (p15 > 5200)
	{
		room_goto(room_battle_1);
	}
}