image_yscale=image_xscale;
if y < 390{
	image_alpha-=0.075;
}
if image_alpha = 0{
	instance_destroy()
}