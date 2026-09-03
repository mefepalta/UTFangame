if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) image_alpha = target_alpha;
}

with (o_gameover_heart)
{
	if (val_ > 350)
	{
		other.target_alpha = other.target_alpha + 0.05;
	}
}