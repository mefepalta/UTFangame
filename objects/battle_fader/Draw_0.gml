if (alpha > 0)
{
	draw_sprite_ext(spr_pixel,0,camera.x,camera.y,640,480,0,color,alpha);
}

if (bloom > 0)
{
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(spr_pixel,0,camera.x,camera.y,640,480,0,bloom_col,bloom*bloom);
	gpu_set_blendmode(bm_normal);
}
