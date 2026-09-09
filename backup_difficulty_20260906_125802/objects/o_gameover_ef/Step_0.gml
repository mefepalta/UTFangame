
var _ready = true;
if (instance_exists(o_gameover_heart)) {
    _ready = (o_gameover_heart.val_ >= o_gameover_heart.T_READY);
}

if (_ready && !leaving && Input_IsPressed(INPUT.CONFIRM)) {
    leaving = true;
    audio_play_sound(snd_exit, 2, false);
}

// CANCEL = ana menuye don. Menu yolu StartRun -> Run_ResetState + Flag_Custom
// uzerinden gectigi icin garantili temiz bir kosu basliyor; "Continue" ile
// devam eden oyuncunun aksine hicbir tur durumu tasinmiyor.
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
            // Menu kendi StartRun'unu calistiracak; burada sadece temiz bir
            // zemin birak ki menuye donup cikmadan da durum sizmasin.
            Run_ResetState();
            room_goto(room_menu);
            exit;
        }

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

            // Ayni tur durumu sifirlamasi: faz 2 temiz baslasin.
            Run_ResetState();
        }
        else
        {
            // Checkpoint kapali = "bastan oyna". Tur durumu BURADA da
            // sifirlanmali: Player_Load sadece STATIC/DYNAMIC/INFO kayit
            // bayraklarini yukluyor, bu globallerin hicbirine dokunmuyor.
            // Sifirlanmazsa onceki kosunun durumu siziyor -- p1sanshp yuzunden
            // faz 1 bir daha hic oynanamiyordu.
            Run_ResetState();
            Player_Load(0);
        }

        room_goto(_back);
    }
}
