if !surface_exists(surf)
surf=surface_create(640,480)
surface_set_target(surf)
draw_surface(application_surface,0,0)
surface_reset_target()
draw_set_color(c_black)
draw_rectangle(0,0,640,480,0)
draw_set_color(c_white)
var b= irandom(80)
if b>=60
a=amax
else a=amax/2
for (i = 0; i <= 480; i++)
draw_surface_part(surf, 0, i, 640, 1, irandom_range((-a), a), i)