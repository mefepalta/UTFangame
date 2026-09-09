if (!variable_global_exists("p05_sx")) { global.p05_sx = 0; global.p05_sy = 0; }

var _p = instance_exists(o_textcontroller_p05) ? o_textcontroller_p05.p05 : 0;

with (o_p05body) {
    other.pure_x = pure_x + 27;
    other.pure_y = pure_y - 35;
}

angle_timer += 0.04;

var _swing = 0;
if      (_p > 2660 && _p <= 2705) _swing = -((_p - 2660) / 45) * 7;
else if (_p > 2705 && _p <= 2716) _swing = -7 + ((_p - 2705) / 11) * 22;
else if (_p > 2716)               _swing = 15 * exp(-(_p - 2716) / 10);

image_angle = base_angle + sin(angle_timer) * 2 + _swing;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;

if (_p > 2705 && _p < 2725) { sprite_index = s_p05arm_animation; image_speed = 1.5; }
if (_p > 2725)              { sprite_index = s_p05arm_animation_end; image_speed = 0; }
