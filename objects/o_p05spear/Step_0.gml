if (!variable_global_exists("p05_sx")) { global.p05_sx = 0; global.p05_sy = 0; }

if (!instance_exists(o_textcontroller_p05)) exit;
var _p = o_textcontroller_p05.p05;

var _prev = pure_y;
var _u    = 0;

switch (state)
{
    case 0:
        pure_y = start_y;
        if (_p >= 2686) {
            state  = 1;
            charge = 0;
            audio_play_sound(snd_spear_spawn, 6, false);
        }
        break;

    case 1:
        charge = min(charge + 1 / 17, 1);
        image_alpha = charge;
        pure_y = start_y + sin(_p * 1.7) * (1.5 * charge);
        if (_p >= fall_start) {
            state  = 2;
            fall_t = 0;
            audio_play_sound(snd_spear_toss, 6, false);
        }
        break;

    case 2:
        fall_t = min(fall_t + 1, fall_steps);
        _u = fall_t / fall_steps;
        pure_y = start_y + (land_y - start_y) * (0.15 * _u + 0.85 * _u * _u);
        image_alpha = 1;

        if (fall_t >= fall_steps) {
            pure_y = land_y;
            state  = 3;
            land_t = 0;
            audio_play_sound(snd_smash_impact, 7, false);
            with (o_textcontroller_p05) { p05_impact(344, 148); }
        }
        break;

    case 3:
        pure_y = land_y;
        land_t++;
        break;
}

fall_speed = pure_y - _prev;

if (state == 2) {
    array_push(trail, {x: base_x, y: pure_y});
    if (array_length(trail) > 10) array_delete(trail, 0, 1);
} else if (array_length(trail) > 0) {
    array_delete(trail, 0, 1);
}

var _pop = (state == 3) ? 0.30 * exp(-land_t / 6) : 0;
image_xscale = 2 * (1 + _pop);
image_yscale = 2 * (1 + _pop * 0.6);

x = base_x + global.p05_sx;
y = pure_y + global.p05_sy;
