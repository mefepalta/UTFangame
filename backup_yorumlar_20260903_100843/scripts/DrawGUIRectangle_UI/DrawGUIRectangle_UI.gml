///@arg x
///@arg y
///@arg _scalex
///@arg _scaley
///@arg alpha
///@arg color
///@arg color_inside
function DrawGUIRectangle_UI() {
    var _x = argument[0]
    var _y = argument[1]
    var _scalex = argument[2]
    var _scaley = argument[3]
    var alpha = argument[4]
    var color = argument[5]
    var color_inside = argument[6]

draw_sprite_ext(spr_pixel, 0, _x + 4, _y + 2, _scalex - 4, _scaley - 2, 0, color_inside, alpha);


draw_set_colour(color);
draw_roundrect(_x, _y, _x + _scalex, _y + _scaley, 10);

    draw_roundrect(_x + 0.2, _y + 0.2, _x + _scalex - 0.2, _y + _scaley - 0.2, 10);
    draw_roundrect(_x + 0.4, _y + 0.4, _x + _scalex - 0.4, _y + _scaley - 0.4, 10);
    draw_roundrect(_x + 0.6, _y + 0.6, _x + _scalex - 0.6, _y + _scaley - 0.6, 10);
    draw_roundrect(_x + 0.8, _y + 0.8, _x + _scalex - 0.8, _y + _scaley - 0.8, 10);
    draw_roundrect(_x + 1.0, _y + 1.0, _x + _scalex - 1.0, _y + _scaley - 1.0, 10);
    draw_roundrect(_x + 1.2, _y + 1.2, _x + _scalex - 1.2, _y + _scaley - 1.2, 10);
    draw_roundrect(_x + 1.4, _y + 1.4, _x + _scalex - 1.4, _y + _scaley - 1.4, 10);
    draw_roundrect(_x + 1.6, _y + 1.6, _x + _scalex - 1.6, _y + _scaley - 1.6, 10);
    draw_roundrect(_x + 1.8, _y + 1.8, _x + _scalex - 1.8, _y + _scaley - 1.8, 10);
    draw_roundrect(_x + 2.0, _y + 2.0, _x + _scalex - 2.0, _y + _scaley - 2.0, 10);
    draw_roundrect(_x + 2.2, _y + 2.2, _x + _scalex - 2.2, _y + _scaley - 2.2, 10);
    draw_roundrect(_x + 2.4, _y + 2.4, _x + _scalex - 2.4, _y + _scaley - 2.4, 10);
    draw_roundrect(_x + 2.6, _y + 2.6, _x + _scalex - 2.6, _y + _scaley - 2.6, 10);
    draw_roundrect(_x + 2.8, _y + 2.8, _x + _scalex - 2.8, _y + _scaley - 2.8, 10);
    draw_roundrect(_x + 3.0, _y + 3.0, _x + _scalex - 3.0, _y + _scaley - 3.0, 10);

  
    
  
}