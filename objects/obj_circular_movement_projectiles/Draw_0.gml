angle += speed_bullet; 
if (angle >= 360) {
    angle -= 360; 
}


for (var n = 0; n < sprite_count; n++) {
    var sprite_angle = angle + (360 / sprite_count) * n; 
    var x_position = lengthdir_x(orbit_radius, sprite_angle);
    var y_position = lengthdir_y(orbit_radius, sprite_angle);

    draw_sprite_ext(spr_circle_bullets_star, image_bullet, x_position + x, y_position + y,xscale_bullet,yscale_bullet,angle_bullet,color_bullet,alpha_bullet);
}
