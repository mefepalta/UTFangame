
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

        var _back = room_area_beforesans;
        var _from_extras = (global.extras_room != noone) and (room_exists(global.extras_room));
        if (_from_extras) { _back = global.extras_room; }

        // Checkpoint: once phase 2 has been reached, and the option is on,
        // carry on from phase 2 instead of replaying phase 1.
        // An explicit Extras phase choice wins over the checkpoint, so
        // someone practising phase 1 from Extras is not dragged into phase 2.
        if (!_from_extras) and (global.checkpoint_enabled) and (global.phase2_unlocked)
        {
            _back = room_battle_1;

            // Start phase 2 on a fresh loadout - full HP and a full item bag -
            // the same setup the menu builds for a new run, instead of loading
            // back whatever we had left when we died.
            Flag_Clear(FLAG_TYPE.STATIC);
            Flag_Clear(FLAG_TYPE.DYNAMIC);
            Flag_Custom();
            Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.ROOM,_back);
            Player_Save(0);

            // same run state reset the Extras phase select does, so phase 2
            // starts clean instead of inheriting the state we just died in
            global.sanstalk = 0;
            global.finalstretch = 0;
            global.surrender_turn = false;
            global.surrender_son = false;
            global.checkornot = false;
            global.p1sanshp = false;
            global.p2_revived_pap = false;
            global.p2_revived_alp = false;
            global.p25phase = 0;
            global.p25_dlg = false;
            global.p25_iska = false;
            global.p25_t = 0;
            global.p25_kacis = 0;
        }
        else
        {
            Player_Load(0);
        }

        room_goto(_back);
    }
}
