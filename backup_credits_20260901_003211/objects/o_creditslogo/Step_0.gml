y = lerp(y, target_y, move_speed);
diddy++;

if (diddy == 100)
{
	target_y = 100;
}
if (diddy > 100) and (diddy < 180)
{
	image_xscale -= 0.005;
	image_yscale -= 0.005;
}
if (diddy == 6220)
{
	target_y = 234;
}
if (diddy > 6220) and (diddy < 6300)
{
	image_xscale += 0.005;
	image_yscale += 0.005;
}