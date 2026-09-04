if sr
{
	sr=0
	var surf_width=(window_get_fullscreen() ? display_get_width() : window_get_width())
	var surf_height=(window_get_fullscreen() ? display_get_height() : window_get_height())
	var surf_width_ratio=surf_width/640
	var surf_height_ratio=surf_height/480
	var surf_ratio=min(surf_width_ratio,surf_height_ratio)
	display_set_gui_maximize(surf_ratio,surf_ratio,(surf_width-(640*surf_ratio))/2,(surf_height-(480*surf_ratio))/2)
	draw_surface_ext(application_surface,(surf_width-(640*surf_ratio))/2,(surf_height-(480*surf_ratio))/2,surf_ratio,surf_ratio,0,c_white,1)
}
if can_draw
{
	shader_set(shd_rgb_new)
	surface_set_target(surf)
	if draw_mode!=1
	draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
	if draw_mode=1	// Circled movement of the rgb
	{
		dis1++
		var displace_x=sin(dis1/30)*20
		var displace_y=cos(dis1/30)*20
		draw_surface(application_surface,displace_x,displace_y)
	}
	if draw_mode=2	//Circled movement for several rgb's
	{
		surface_set_target(surf)
		draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
		surface_reset_target()
		gpu_set_blendmode(bm_add)
		dis2++
		for(i = 0; i < 3; i++)
		{
			dr1=0
			dr2=0
			if !i
			col=make_color_rgb(0,255,0)
			else if i=1
			col=c_blue
			else if i=2
			col=c_red
			var displace_x=sin((dis2+i*120)/rot_spd2)*dist2
			var displace_y=cos((dis2+i*120)/rot_spd2)*dist2
			draw_surface_ext(surf,displace_x,displace_y,1,1,0,col,surf2al)
		}
		gpu_set_blendmode(bm_normal)
	}
	if draw_mode=3	// Purple Drawing
	draw_surface_part_ext(application_surface,135,0,370,400,505,0,-1,1,c_white,1)
	if draw_mode=4	// Displacing rgb drawing, if want to reset the displacement just do dis=0 anywhere else
	{
		draw_sprite_ext(spr_pixel,0,-200,-200,880,800,0,c_black,1)
		for(var i = 0; i <480; i++)
		{
			dis4+=sin(i/2.5)/80
			draw_surface_part_ext(application_surface,320,i-1,320,1,320,i-1,1+((cos(i)/100)*dis4),1,c_white,1)
			draw_surface_part_ext(application_surface,320,i-1,-320,1,320,i-1,1+((cos(i)/100)*dis4),1,c_white,1)
		}
	}
	shd_strength=shader_get_uniform(shd_rgb_new,"strength")
	var val=(time/15)*random_range(0.8,1.2)*choose(1,-1)
	shader_set_uniform_f(shd_strength,val,val)
	shd_dir=shader_get_uniform(shd_rgb_new,"dir")
	shader_set_uniform_f(shd_dir,(dr1*time),(dr2*time))
	if green!=0
	{
		shd_green=shader_get_uniform(shd_rgb_new,"green")
		val=(time/15)*random_range(0.5,1.5)*choose(1,-1)*green
		shader_set_uniform_f(shd_green,val,val)
	}
	else
	{
		shd_green=shader_get_uniform(shd_rgb_new,"green")
		shader_set_uniform_f(shd_green,0,0)
	}
	surface_reset_target()
	surf_width=(window_get_fullscreen() ? display_get_width() : window_get_width())
	surf_height=(window_get_fullscreen() ? display_get_height() : window_get_height())
	surf_width_ratio=surf_width/640
	surf_height_ratio=surf_height/480
	surf_ratio=min(surf_width_ratio,surf_height_ratio)
	display_set_gui_maximize(surf_ratio,surf_ratio,(surf_width-(640*surf_ratio))/2,(surf_height-(480*surf_ratio))/2)
	draw_sprite_ext(spr_pixel,0,0,0,display_get_width(),display_get_height(),0,c_black,1)
	draw_surface_ext(surf,(surf_width-(640*surf_ratio))/2,(surf_height-(480*surf_ratio))/2,surf_ratio,surf_ratio,0,c_white,1)
	shader_reset()
}
