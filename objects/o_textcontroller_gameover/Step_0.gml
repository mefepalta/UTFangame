
var _v     = 99999;
var _t_txt = 0;
var _t_rdy = 0;
if (instance_exists(o_gameover_heart)) {
    _v     = o_gameover_heart.val_;
    _t_txt = o_gameover_heart.T_TEXT;
    _t_rdy = o_gameover_heart.T_READY;
}

if (!started) and (_v >= _t_txt) started = true;

if (started) and (!done) {
    var _p = pages[cur];

    if (shown < _p.len) {
        t++;
        var _target = min(floor(t / char_speed), _p.len);
        while (shown < _target) {
            shown++;
            var _c = string_char_at(_p.txt, shown);
            if (_c != " " && _c != "\n" && _c != "." && _c != ","
             && _c != "!" && _c != "?" && _c != "'" && _c != "-") {
                audio_play_sound(_p.snd, 1, false);
            }
        }
    } else if (cur < array_length(pages) - 1) {
        wait++;
        if (wait >= page_hold) {
            cur++;
            shown = 0;
            t     = 0;
            wait  = 0;
        }
    } else {
        done = true;
    }
}

if (_v >= _t_rdy) and (done) {
    prompt_a = min(1, prompt_a + 0.04);
    blink++;
}
