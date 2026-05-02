shader_set(shd_ph2_wave)
var _spd = shader_get_uniform(shd_ph2_wave,"speed")
shader_set_uniform_f(_spd,spdd)
var _fqq = shader_get_uniform(shd_ph2_wave, "Xfrequency");
shader_set_uniform_f(_fqq,freq)
var _xsize = shader_get_uniform(shd_ph2_wave, "Xsize");
shader_set_uniform_f(_xsize,xsizee);
shader_set_uniform_f(uniTime,current_time)
draw_surface(application_surface,0,0)
shader_reset()