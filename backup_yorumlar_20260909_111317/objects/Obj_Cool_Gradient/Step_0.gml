gradient_timer++;
image_yscale=1.5+sin(gradient_timer*0.1)*0.1;

if gradient_timer > 0 and close_gradient > 0.5{
		instance_create_depth(random_range(0,640),500,0,Object_Ball);
}