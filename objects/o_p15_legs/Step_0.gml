if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p15_sx"))    { global.p15_sx = 0; global.p15_sy = 0; }

global.bob_timer += 0.01;

var _bob = sin(global.bob_timer) * 0.005;
image_yscale = 2 + cos(global.bob_timer) * 0.05;

pure_x = base_x;
if (shake_time > 0) {
    pure_x = base_x + random_range(-shake_strength, shake_strength);
    shake_time--;
}
pure_y = base_y + _bob;

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;
