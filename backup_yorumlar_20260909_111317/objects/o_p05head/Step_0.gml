if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p05_sx"))    { global.p05_sx = 0; global.p05_sy = 0; }

var _p    = 0;
var _line = -1;
if (instance_exists(o_textcontroller_p05)) {
    _p    = o_textcontroller_p05.p05;
    _line = o_textcontroller_p05.current_line;
}

var _crouch = 0;
if (_p > 2640 && _p <= 2705)  _crouch = ((_p - 2640) / 65) * 5;
else if (_p > 2705)           _crouch = max(0, 5 - (_p - 2705) * 0.55);

var _rec = 0;
if (_p >= 2730) {
    var _t = _p - 2730;
    _rec = 7.5 * exp(-_t / 10) * cos(_t * 0.40);
}

with (o_p05legs) { other.pure_x = pure_x; }

pure_y = base_y + sin(global.bob_timer) * 1 + _crouch + _rec;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;

switch (_line)
{
    case  0: image_index = 10; break;
    case  1: image_index = 11; break;
    case  2: image_index =  2; break;
    case  3: image_index =  3; break;
    case  4: image_index =  4; break;
    case  5: image_index =  9; break;
    case  6: image_index =  8; break;
    case  7: image_index =  5; break;
    case  8: image_index = 12; break;
    case  9: image_index = 13; break;
    case 10: image_index =  7; break;
    case 11: image_index = 14; break;
    case 12: image_index =  0; break;
}
