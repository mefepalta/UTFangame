if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) {
        image_alpha = target_alpha;
    }
}
else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) {
        image_alpha = target_alpha;
    }
}
if (diddyvalue = true)
{
	diddytimer++;
}
if (!diddytimer == 0) and (target_alpha > 0.4)
{
	target_alpha = target_alpha - 0.1;
}
if (diddytimer > 0)
{
	target_alpha = 1;
}