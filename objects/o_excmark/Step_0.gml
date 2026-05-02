if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) image_alpha = target_alpha;
}

if (instance_exists(o_excmark))
{
	target_alpha = target_alpha - 0.1;
	if (target_alpha == 0)
	{
		instance_destroy();
	}
}