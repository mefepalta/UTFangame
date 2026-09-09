if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p05_sx"))    { global.p05_sx = 0; global.p05_sy = 0; }

global.bob_timer += 0.01;

var _p = instance_exists(o_textcontroller_p05) ? o_textcontroller_p05.p05 : 0;

var _bob = sin(global.bob_timer) * 0.005;

var _crouch = 0;
if (_p > 2640 && _p <= 2705)  _crouch = ((_p - 2640) / 65) * 5;
else if (_p > 2705)           _crouch = max(0, 5 - (_p - 2705) * 0.55);

var _rec = 0;
if (_p >= 2730) {
    var _t = _p - 2730;
    _rec = 7.5 * exp(-_t / 10) * cos(_t * 0.40);
}

pure_x = base_x;
pure_y = base_y + _bob;

var _press = (_crouch + _rec) * 0.03;
image_yscale = 2 + cos(global.bob_timer) * 0.05 - _press;
image_xscale = 2 + _press * 0.55;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;
