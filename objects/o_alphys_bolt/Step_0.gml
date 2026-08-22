_life++;

direction += curve;
curve *= curve_decay;

if (fade_in > 0)
{
	image_alpha = min(1,_life/fade_in);
}
else
{
	image_alpha = 1;
}

scale += grow;
image_xscale = scale;
image_yscale = scale;
image_angle = direction - 90 + spin*_life;

if (x < -70) or (x > 710) or (y < -70) or (y > 550)
{
	instance_destroy();
}
