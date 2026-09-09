if is_inverted=1
{
	gpu_set_blendmode_ext(bm_inv_dest_color,bm_zero)
	draw_rectangle_colour(0,0,640,480,c_white,c_white,c_white,c_white,0)
	gpu_set_blendmode(0)
}