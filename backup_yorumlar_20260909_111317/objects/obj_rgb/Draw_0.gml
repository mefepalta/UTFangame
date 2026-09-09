if !surface_exists(surf)
surf=surface_create(window_get_width(),window_get_height())
surface_set_target(surf)
draw_surface(application_surface,0,0)
surface_reset_target()
draw_set_color(c_black)
draw_rectangle(0,0,window_get_width(),window_get_height(),0)
draw_set_color(c_white)
gpu_set_blendmode(bm_max)

draw_surface_ext(surf,random_range(-sh,sh),random_range(-sh,sh),1,1,0,c_blue,1)
draw_surface_ext(surf,random_range(-sh,sh),random_range(-sh,sh),1,1,0,make_color_rgb(0,255,0),1)
draw_surface_ext(surf,random_range(-sh,sh),random_range(-sh,sh),1,1,0,c_red,1)

gpu_set_blendmode(bm_normal)

