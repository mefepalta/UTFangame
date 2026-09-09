draw_set_color(c_white)
uni_resolution_hoz=shader_get_uniform(shd_gaussian_horizontal, "resolution")
uni_resolution_vert=shader_get_uniform(shd_gaussian_vertical, "resolution")
var_resolution_x=display_get_gui_width()
var_resolution_y=display_get_gui_height()
uni_blur_amount_hoz=shader_get_uniform(shd_gaussian_vertical, "blur_amount")
uni_blur_amount_vert=shader_get_uniform(shd_gaussian_horizontal, "blur_amount")
var_blur_amount=0.5
has_horizontal=1
has_vertical=1
duration=30
final_surface=application_surface
surf=surface_create(640, 480)
alarm[0]=1
