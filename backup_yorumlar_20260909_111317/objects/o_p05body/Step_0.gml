if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p05_sx"))    { global.p05_sx = 0; global.p05_sy = 0; }

global.bob_timer += 0.02;

var _p = instance_exists(o_textcontroller_p05) ? o_textcontroller_p05.p05 : 0;

var _crouch = 0;
if (_p > 2640 && _p <= 2705)  _crouch = ((_p - 2640) / 65) * 5;
else if (_p > 2705)           _crouch = max(0, 5 - (_p - 2705) * 0.55);

var _rec = 0;
if (_p >= 2730) {
    var _t = _p - 2730;
    _rec = 7.5 * exp(-_t / 10) * cos(_t * 0.40);
}

with (o_p05legs) { other.pure_x = pure_x; }

pure_y = base_y + sin(global.bob_timer) * 0.7 + _crouch + _rec;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;

if (_p > 2705 && _p < 2725) { sprite_index = s_p05body_animation; image_speed = 2; }
if (_p > 2725) {
    image_index = 2;
    image_speed = 0;
}
