
var _ready = true;
if (instance_exists(o_gameover_heart)) {
    _ready = (o_gameover_heart.val_ >= o_gameover_heart.T_READY);
}

if (_ready && !leaving && Input_IsPressed(INPUT.CONFIRM)) {
    leaving = true;
    audio_play_sound(snd_exit, 2, false);
}

if (_ready && !leaving && Input_IsPressed(INPUT.CANCEL)) {
    leaving = true;
    to_menu = true;
    audio_play_sound(snd_exit, 2, false);
}

if (leaving) {
    timer++;
    image_alpha = min(1, image_alpha + 0.030);
    if (timer >= 55) {
        audio_stop_all();

        if (to_menu)
        {
            Run_ResetState();
            room_goto(room_menu);
            exit;
        }

        var _back = room_area_beforesans;
        var _from_extras = (global.extras_room != noone) and (room_exists(global.extras_room));
        if (_from_extras) { _back = global.extras_room; }

        Run_ResetState();
        Player_Load(0);

        room_goto(_back);
    }
}
