
if (instance_exists(o_gameover_heart)) {
    if (o_gameover_heart.val_ >= o_gameover_heart.T_LOGO) {
        t = min(1, t + 1 / 55);
    }
} else {
    t = min(1, t + 1 / 55);
}

var _e = 1 - power(1 - t, 3);
image_alpha = _e;
y = lerp(y_home - 18, y_home, _e);
