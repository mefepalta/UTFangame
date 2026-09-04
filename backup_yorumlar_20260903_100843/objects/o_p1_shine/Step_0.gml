if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) image_alpha = target_alpha;
}

with (o_p1final_fall)
{
	if (p1finalattackval > 410) and (p1finalattackval < 460) and (other.target_alpha < 1)
	{
		other.target_alpha = other.target_alpha + 0.3;
	}
	if (p1finalattackval > 480) and (p1finalattackval < 530) and (other.target_alpha > 0)
	{
		other.target_alpha = other.target_alpha - 0.3;
	}
}