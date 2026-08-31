if (!variable_global_exists("p05_sx")) { global.p05_sx = 0; global.p05_sy = 0; }

var _p = instance_exists(o_textcontroller_p05) ? o_textcontroller_p05.p05 : 0;

with (o_p05body) {
    other.pure_x = pure_x - 27;
    other.pure_y = pure_y - 35;
}

angle_timer += 0.04;

// Sag kol savururken sol kol dengelemek icin ters yonde, daha az aciliyor.
// (image_xscale negatif oldugu icin acilar da ters isaretle veriliyor.)
var _brace = 0;
if      (_p > 2660 && _p <= 2705) _brace = ((_p - 2660) / 45) * 4;
else if (_p > 2705 && _p <= 2716) _brace = 4 - ((_p - 2705) / 11) * 11;
else if (_p > 2716)               _brace = -7 * exp(-(_p - 2716) / 10);

image_angle = base_angle + sin(angle_timer) * -2 - _brace;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;
