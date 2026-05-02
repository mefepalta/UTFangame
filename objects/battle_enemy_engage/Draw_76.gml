if !surface_exists(_surf){
    _surf = surface_create(640,y);    
}

surface_set_target(_surf);
draw_clear_alpha(0,0);
surface_reset_target();