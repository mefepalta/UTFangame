draw_sprite_ext(spr_closed_captions_corner,0,_x-_left-sprite_get_width(spr_closed_captions_corner),_y-_up-sprite_get_height(spr_closed_captions_corner),1,1,0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_closed_captions_corner,0,_x-_left-sprite_get_width(spr_closed_captions_corner),_y+_down+sprite_get_height(spr_closed_captions_corner),1,-1,0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_closed_captions_corner,0,_x+_right+sprite_get_width(spr_closed_captions_corner),_y-_up-sprite_get_height(spr_closed_captions_corner),-1,1,0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_closed_captions_corner,0,_x+_right+sprite_get_width(spr_closed_captions_corner),_y+_down+sprite_get_height(spr_closed_captions_corner),-1,-1,0,_color,_alpha_base*_alpha);

draw_sprite_ext(spr_pixel,0,_x-_left-sprite_get_width(spr_closed_captions_corner),_y-_up,sprite_get_width(spr_closed_captions_corner),_up+_down,0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_pixel,0,_x+_right,_y-_up,sprite_get_width(spr_closed_captions_corner),_up+_down,0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_pixel,0,_x-_left,_y-_up-sprite_get_height(spr_closed_captions_corner),_left+_right,sprite_get_height(spr_closed_captions_corner),0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_pixel,0,_x-_left,_y+_down,_left+_right,sprite_get_height(spr_closed_captions_corner),0,_color,_alpha_base*_alpha);
draw_sprite_ext(spr_pixel,0,_x-_left,_y-_up,_left+_right,_up+_down,0,_color,_alpha_base*_alpha);