
val_++;

shake   = max(0, shake - 0.5);
shake_x = random_range(-shake, shake);
shake_y = random_range(-shake, shake);

var _in = clamp(val_ / 48, 0, 1);
var _e  = 1 - power(1 - _in, 3);
soul_x = lerp(start_x, home_x, _e);
soul_y = lerp(start_y, home_y, _e);

if (val_ <= 26) {
    var _p = val_ / 26;
    soul_scale = 1 + 2.70158 * power(_p - 1, 3) + 1.70158 * power(_p - 1, 2);
} else {
    soul_scale = 1;
}

if (val_ < T_CRACK) {
    var _ph = val_ mod 46;
    var _b1 = (_ph < 8)               ? sin(pi * (_ph)      / 8) * 0.10  : 0;
    var _b2 = (_ph >= 10 && _ph < 16) ? sin(pi * (_ph - 10) / 6) * 0.055 : 0;
    soul_pulse = 1 + _b1 + _b2;
    tremble_x  = 0;
} else {
    soul_pulse = 1;
    if (val_ mod 4 == 0) {
        var _amp = 3 + 4 * clamp((val_ - T_CRACK) / (T_BURST - T_CRACK), 0, 1);
        tremble_x = choose(-1, 1) * random_range(_amp * 0.45, _amp);
    }
}

if (val_ == T_HURT) audio_play_sound(snd_hurt, 2, false);
if (val_ == T_EXIT) audio_play_sound(snd_exit, 2, false);

if (val_ == T_CRACK) {
    soul_frame = 1;
    shake      = 7;
    audio_play_sound(snd_break_0, 2, false);
    repeat (14) {
        var _d = random(360);
        var _s = random_range(2.4, 6.5);
        array_push(sparks, {
            x  : soul_x, y : soul_y,
            hs : lengthdir_x(_s, _d),
            vs : lengthdir_y(_s, _d),
            age: 0, life: irandom_range(14, 30),
            sz : irandom_range(2, 4)
        });
    }
}

if (val_ >= T_HAND) hand_t = min(1, hand_t + 1 / 30);
if (hand_snap > 0)  hand_snap = max(0, hand_snap - 1.1);
hand_bob += 0.55;

if (val_ >= T_WHITE && val_ < T_BURST) {
    white_a = (val_ - T_WHITE) / (T_BURST - T_WHITE);
} else if (val_ >= T_BURST) {
    if (val_ == T_BURST) white_a = 0.92;
    white_a = max(0, white_a - 0.16);
}

if (val_ == T_BURST) {
    burst_done = true;
    soul_alpha = 0;
    shake      = 12;
    hand_snap  = 13;
    audio_play_sound(snd_break_1, 2, false);

    var _n  = 9;
    var _a0 = random(360);
    for (var i = 0; i < _n; i++) {
        array_push(beams, {
            dir: _a0 + i * (360 / _n) + random_range(-9, 9),
            len: random_range(230, 420),
            wid: random_range(9, 24),
            dec: random_range(0.030, 0.055),
            t  : 1
        });
    }

    var _base = random(360);
    for (var i = 0; i < 5; i++) {
        var _oa = _base + i * 72 + random_range(-20, 20);
        array_push(shards, {
            img     : i,
            x       : soul_x,
            y       : soul_y,
            out_x   : home_x + RING_OUT_RX * dcos(_oa) + random_range(-18, 18),
            out_y   : home_y - RING_OUT_RY * dsin(_oa) + random_range(-14, 14),
            orb_ang : _base + i * 72,
            rot     : random(360),
            draw_rot: 0,
            spin    : choose(-1, 1) * random_range(4, 9),
            jit_ph  : random(360),
            sway_ph : random(360),
            sway_amp: 0,
            behind  : false,
            sc      : SOUL_SCALE
        });
    }

    repeat (20) {
        var _d = random(360);
        var _s = random_range(3.5, 9.5);
        array_push(sparks, {
            x  : soul_x, y : soul_y,
            hs : lengthdir_x(_s, _d),
            vs : lengthdir_y(_s, _d),
            age: 0, life: irandom_range(24, 55),
            sz : irandom_range(2, 4)
        });
    }

    repeat (26) {
        array_push(embers, {
            x  : random(room_width),
            y  : random(room_height),
            vy : random_range(0.10, 0.34),
            ph : random(360),
            sz : choose(1, 1, 2),
            a  : random_range(0.05, 0.16)
        });
    }
}

if (val_ >= T_NOISE_0 && val_ <= T_NOISE_1 && ((val_ - T_NOISE_0) mod 5) == 0) {
    audio_play_sound(snd_noise, 2, false);
    bars = [];
    repeat (irandom_range(1, 3)) {
        array_push(bars, {
            y: irandom(room_height),
            h: irandom_range(1, 5),
            a: random_range(0.05, 0.16)
        });
    }
    for (var i = 0; i < array_length(shards); i++) {
        var _sh = shards[i];
        _sh.sway_amp = min(5, _sh.sway_amp + random_range(1.8, 3.2));
    }
} else if (val_ > T_NOISE_1) {
    bars = [];
}

if (val_ == T_LOGO) audio_play_sound(snd_gameover, 1, true);

if (burst_done) {
    orbit_t++;

    var _po = clamp(orbit_t / T_OUT, 0, 1);
    _po = 1 - power(1 - _po, 4);

    var _pi = clamp((orbit_t - T_HOLD) / (T_IN - T_HOLD), 0, 1);
    _pi = (_pi < 0.5) ? 4 * _pi * _pi * _pi : 1 - power(-2 * _pi + 2, 3) / 2;

    for (var i = 0; i < array_length(shards); i++) {
        var _s = shards[i];

        _s.orb_ang += RING_SPD;

        var _hx = lerp(home_x, _s.out_x, _po);
        var _hy = lerp(home_y, _s.out_y, _po);

        var _jit = _po * (1 - _pi);
        _hx += dsin(orbit_t * 6.3 + _s.jit_ph) * 3.2 * _jit;
        _hy += dcos(orbit_t * 5.1 + _s.jit_ph) * 3.2 * _jit;

        var _rx = RING_X + RING_RX * dcos(_s.orb_ang);
        var _ry = RING_Y - RING_RY * dsin(_s.orb_ang);

        _s.x = lerp(_hx, _rx, _pi);
        _s.y = lerp(_hy, _ry, _pi);

        _s.spin *= 0.955;
        _s.rot  += _s.spin;

        _s.sway_ph  += 11;
        _s.sway_amp *= 0.93;
        _s.draw_rot = _s.rot
                    + dsin(orbit_t * 1.6 + _s.jit_ph) * 2.2
                    + dsin(_s.sway_ph) * _s.sway_amp;

        var _dep = dsin(_s.orb_ang) * _pi;
        _s.behind = (_dep > 0);
        _s.sc     = SOUL_SCALE * (1 - 0.10 * _dep);
    }
}

for (var i = array_length(sparks) - 1; i >= 0; i--) {
    var _s = sparks[i];
    _s.age++;
    _s.hs *= 0.97;
    _s.vs += 0.22;
    _s.x  += _s.hs;
    _s.y  += _s.vs;
    if (_s.age >= _s.life) array_delete(sparks, i, 1);
}

for (var i = array_length(embers) - 1; i >= 0; i--) {
    var _m = embers[i];
    _m.ph += 1.4;
    _m.y  += _m.vy;
    _m.x  += dsin(_m.ph) * 0.22;
    if (_m.y > room_height + 4) {
        _m.y = -4;
        _m.x = random(room_width);
    }
}

for (var i = array_length(beams) - 1; i >= 0; i--) {
    var _b = beams[i];
    _b.t -= _b.dec;
    if (_b.t <= 0) array_delete(beams, i, 1);
}


