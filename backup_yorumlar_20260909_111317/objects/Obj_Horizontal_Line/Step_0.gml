y-=0.5;

if y < 410{
	image_alpha-=0.010;
}

if image_alpha = 0{
	instance_destroy();
}