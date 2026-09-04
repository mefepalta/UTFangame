
var _ready = true;
if (instance_exists(o_gameover_heart)) {
    _ready = (o_gameover_heart.val_ >= o_gameover_heart.T_READY);
}

if (_ready && !leaving && Input_IsPressed(INPUT.CONFIRM)) {
    leaving = true;
    audio_play_sound(snd_exit, 2, false);
}

if (leaving) {
    timer++;
    image_alpha = min(1, image_alpha + 0.030);
    if (timer >= 55) {
        audio_stop_all();
        Player_Load(0);
        var _back = room_area_beforesans;
        if (global.extras_room != noone) and (room_exists(global.extras_room)) { _back = global.extras_room; }
        room_goto(_back);
    }
}
