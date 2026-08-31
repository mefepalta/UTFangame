if (!variable_global_exists("p05_sx")) { global.p05_sx = 0; global.p05_sy = 0; }

var _p = instance_exists(o_textcontroller_p05) ? o_textcontroller_p05.p05 : 0;

with (o_p05body) {
    other.pure_x = pure_x - 13;
    other.pure_y = pure_y - 48;
}

// Sag kanadin aynasi: ayni egri, ters isaret
flutter += 0.055;
var _ang = sin(flutter) * 2.2 + sin(flutter * 0.37) * 1.1;

if (_p > 2640 && _p <= 2705) _ang += ((_p - 2640) / 65) * 5;
if (_p >= 2730) {
    var _t = _p - 2730;
    _ang -= 13 * exp(-_t / 15);
}

image_angle = -_ang;

var _pop = 0;
if (_p >= 2730) _pop = 0.13 * exp(-(_p - 2730) / 9);
image_xscale = -2 * (1 + _pop);
image_yscale =  2 * (1 + _pop);

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;

// Sol kanat eskiden animasyon karelerine hic gecmiyordu; sag kanatla
// simetrik olsun diye ayni gecisler buraya da eklendi.
// image_speed yukseltildi ki 5 kare 20 adimlik pencereye sigsin
if (_p > 2705 && _p < 2725) { sprite_index = s_p05wingthing_animation; image_speed = 3; }
if (_p > 2725) {
    image_index = 4;
    image_speed = 0;
}
