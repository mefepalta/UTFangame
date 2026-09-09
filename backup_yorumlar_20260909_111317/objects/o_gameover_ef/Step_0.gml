
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

        // Olum artik her zaman "bastan oyna" demek (checkpoint kaldirildi,
        // yerini DIFFICULTY aldi). Tur durumu BURADA sifirlanmali:
        // Player_Load sadece STATIC/DYNAMIC/INFO kayit bayraklarini yukluyor,
        // bu globallerin hicbirine dokunmuyor. Sifirlanmazsa onceki kosunun
        // durumu siziyor -- p1sanshp yuzunden faz 1 bir daha hic oynanamiyordu.
        Run_ResetState();
        Player_Load(0);

        room_goto(_back);
    }
}
