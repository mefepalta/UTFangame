/// @description Game Over yazisi -- harfleri ac

var _v     = 99999;
var _t_txt = 0;
var _t_rdy = 0;
if (instance_exists(o_gameover_heart)) {
    _v     = o_gameover_heart.val_;
    _t_txt = o_gameover_heart.T_TEXT;
    _t_rdy = o_gameover_heart.T_READY;
}

if (!started && _v >= _t_txt) started = true;

if (started && shown < string_length(line)) {
    t++;
    var _target = min(floor(t / char_speed), string_length(line));
    while (shown < _target) {
        shown++;
        var _c = string_char_at(line, shown);
        if (_c != " " && _c != "." && _c != "," && _c != "!" && _c != "?") {
            audio_play_sound(snd_text_voice_sans, 1, false);
        }
    }
}

// yazi bittikten sonra yanip sonen devam isareti
if (_v >= _t_rdy) {
    prompt_a = min(1, prompt_a + 0.04);
    blink++;
}
