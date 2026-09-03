// =====================================================================
//  FAZ 1.5 - sahne yonetmeni
//
//  Diyalog: "Discord Sans Rewrite" (TheBlueTowel) belgesinin
//  "Phase 1.5 Dialogue" bolumu. Eskiye gore iki eksik satir eklendi:
//  acilistaki "Ugh!" ve anlatici bolumundeki
//  "...Determination took physical shape."
//
//  Zamanlamalar snd_p15theme'e (50.55 sn) gore kuruldu. Parca 3. satirda
//  ("Heh...", t = 9) basliyor; belgedeki "(This is where the phase 1.5
//  theme would start playing.)" notu tam oraya denk geliyor.
//  Parcanin yapisi (baslangictan itibaren):
//     0.0 - 10.5  sessiz giris
//    12.0         ilk vurus            -> t 21.0
//    18.0         ana bolum            -> t 27.0  (Sans dogruluyor)
//    36.0         finale               -> t 45.0
//    36'dan sonra her 1.5 sn'de bir sert vurus; en buyugu 46.5 -> t 55.5
//    48.0         parca kesiliyor      -> t 57.0  (ekran karariyor)
// =====================================================================
// ---------------------------------------------------------------------
//  ACILIS KOREOGRAFISI (p15 adimlari, 60 fps)
//  Acilis TAMAMEN SESSIZ: ekranda hicbir yazi yokken animasyon oynuyor,
//  animasyon bitince yazi basliyor. Ikisi hicbir noktada ust uste gelmiyor.
//     15..174   bes darbe                    (0.25 - 2.90 sn)
//     174..240  Sans cokmus halde bekliyor   (2.90 - 4.00 sn)
//     240..330  kafa kalkiyor, gozler yaniyor(4.00 - 5.50 sn)
//     6.0 sn    ilk satir ("Ugh!")           <- animasyon bitti
//  Sonrasi degismedi: 3. satir 9. saniyede, parcayla senkron.
// ---------------------------------------------------------------------
HIT_STEPS   = [15, 48, 84, 126, 174];   // darbe adimlari (aralari aciliyor)
RAISE_START = 240;                      // kafa kalkisinin ilk karesi
RAISE_STEP  = 15;                       // kare basina adim (eskiden 10)

dialogue = [
    {time:  6.0, text: "Ugh!"},
    {time:  7.0, text: "*huff* *puff*"},
    {time:  8.2, text: "..."},
    {time:  9,   text: "Heh..."},
    {time: 11.5, text: "Heheheh..."},
    {time: 14,   text: "Man..."},
    {time: 16.5, text: "I can't remember the last time someone's landed a decisive blow on me."},
    {time: 21,   text: "Well, perhaps ''decisive'' isn't right..."},
    {time: 23.8, text: "You've yet to knock me off my feet, after all."},
    {time: 27,   text: "Come on..."},
    {time: 28.5, text: "Where's that EXPLOSIVE power of yours?!"},
    {time: 31.5, text: "You can't POSSIBLY be the same person I saw take down the guard."},
    {time: 35.5, text: "And that fight against Alphys?!"},
    {time: 37.5, text: "Don't tell me it was just a FLUKE!"},
    {time: 40,   text: "..."},
    {time: 42,   text: "Heh..."},
    {time: 43.5, text: "But you know..."},
    {time: 45,   text: "The thought of you having made it THIS far..."},
    {time: 48,   text: "...while STILL holding back a large majority of your strength?"},
    {time: 52.5, text: "Man..."},
    {time: 55.5, text: "I'VE NEVER BEEN MORE EXCITED!"},
    // --- anlatici (ekran karariyor) ---
    {time: 58.5, text: "The ground convulses beneath you, throwing you off balance."},
    {time: 62.5, text: "Light erupts from Sans' soul, flooding every corner of the room..."},
    {time: 66.5, text: "A searing blaze tears through the darkness, melting the walls like wax."},
    {time: 71,   text: "The air thrums with a triumphant force you're all too familiar with..."},
    {time: 75.5, text: "...Determination took physical shape."},
    {time: 78,   text: "Power incarnate."},
    {time: 79.5, text: "You watch as it slowly bares its teeth at you."},
    {time: 83.5, text: ""},
];

// Sans'in konustugu son satir; bundan sonrasi anlatici
LINE_NARRATOR = 21;
LINE_MUSIC    = 3;    // parcanin basladigi satir
LINE_STANDUP  = 9;    // Sans'in dogruldugu satir ("Come on...")
LINE_EYECUE   = 6;    // gozlerin ilk yandigi satir (snd_blueeyes)

// Faz 1 muzigi bu odaya tasiniyordu (audio oda gecisinde durmuyor).
// DIKKAT: Faz 1 temasi (snd_chevalier) BGM sistemiyle degil, dogrudan
// battle_enemy_engage/Other_11 icinde audio_play_sound(...,true) ile
// dongude calindigi icin BGM_Stop(5) ona ulasmiyor. Ayni sekilde
// snd_chance / snd_glisterbones gibi dongulu parcalar da acik kalabiliyor.
// Bu yuzden sahne acilirken her sey susturuluyor: Sans belirleyici darbeyi
// yedigi an muzik kesiliyor, tema 3. satirda sifirdan giriyor.
audio_stop_all();
BGM_Stop(5);

// Faz 1'den SIYAH gelinip burada aciliyor. Faz 1'in son darbesi perdeyi
// indiriyor (battle_enemy_engage/Step_0, p15_gecis), sahne de o perdenin
// arkasindan kuruluyor -- eskiden oda aninda kesiliyordu.
fader.color = c_black;
fader.alpha = 1;
Fader_Fade(1,0,50);

current_line    = -1;
start_time      = current_time;
line_start_time = 0;
char_speed      = 0.05;
font_custom     = font_sans_1;
last_chars      = 0;
chars_visible   = 0;
p15             = 0;
global.sanstalk     = 0;
global.finalstretch = 0;

// Faz 2'ye gecerken savas odasi siyahin icinden acilsin ve uzerine bu
// sahnenin korundan sonup giden bir parlama binsin (bkz. battle_fader).
global.battle_fadein     = 1;
global.battle_fadein_col = make_colour_rgb(230,  80,  10);

// ---------------------------------------------------------------------
//  Sahne efektleri
// ---------------------------------------------------------------------
// Katmanlar: Background 200, Instances 100 (karakterler), Instances_1 0
// (o_shine beyaz ortu). Gradyan arka planla karakterlerin arasina girsin
// diye yonetmen 150'ye aliniyor; on plan efektleri Draw End'de.
depth = 150;

// Odada view kapali oldugu icin Camera_Shake bu sahnede hicbir sey
// yapmiyordu. Sarsintiyi parcalarin konumuna kendimiz ekliyoruz.
global.p15_sx = 0;
global.p15_sy = 0;

shake_power = 0;
rumble      = 0;

aura        = 0;
aura_target = 0;
pulse       = 0;
beat        = 0;    // muzigin vuruslarinda 1'e sicrayip sonen deger

flash       = 0;
eye_glow    = 0;

music_id    = -1;
music_t     = -1;   // parca basladiginda gecen adim sayisi
next_accent = 0;

spark = [];
mote  = [];
flare = [];      // vuruslarda ekrani yalayan yatay isik cizgileri

// =====================================================================
//  ATES PALETI
//  Faz 0.5 soguk mor/magenta bir sahne. Faz 1.5 bilerek onun karsiti:
//  kordan altina giden sicak bir yangin. Metin de bunu istiyor -
//  "EXPLOSIVE power", "a searing blaze", "melting the walls like wax",
//  "power incarnate" ve Faz 2'nin "a thousand suns" vaadi.
// =====================================================================
// Renkler uydurma degil: Faz 2 Sans'inin kafasindan (spr_p2_head)
// olculdu -> #F96900 turuncu, #C0180A kizil, #DB3A05, beyaz parlama.
// Boylece ara faz, oyuncunun birazdan gorecegi Faz 2'yi onceden haber
// veriyor. s_p15_eye'in kendisi de zaten kizil (#1F0100 / #880600).
COL_BLOOD = make_colour_rgb(100,  16,   8);   // koyu kizil - zeminin derinligi
COL_EMBER = make_colour_rgb(192,  24,  10);   // kor kizili   (Faz 2)
COL_FIRE  = make_colour_rgb(249, 105,   0);   // parlak alev  (Faz 2)
COL_GOLD  = make_colour_rgb(255, 190,  90);   // beyaz-sicak cekirdek
COL_EYE   = make_colour_rgb(192,  24,  10);   // yuzdeki goz parlamasi
COL_DUST  = make_colour_rgb(107,  96, 137);   // kemik rengi

// Kor zerrecikleri: P05'in duzgun soguk zerreciklerinin aksine
// yanip sonuyor, boy degistiriyor ve yukari dogru savruluyor.
repeat (34) {
    array_push(mote, {
        x:  random(640),
        y:  random(480),
        vs: -random_range(0.25, 0.95),
        hs: random_range(-0.25, 0.25),
        sz: random_range(0.8, 2.6),
        a:  random_range(0.20, 0.70),
        ph: random(6.28),
        fl: random_range(0.06, 0.16)   // yanip sonme hizi
    });
}

// ---------------------------------------------------------------------
//  Faz 2'nin volkanina baglanan zemin.
//  Anlatici bolumunde ("The ground convulses...", "A searing blaze tears
//  through the darkness, melting the walls like wax") yavas yavas
//  beliriyor: lav ufku, on planda kaya sirti ve yagan kul. Boylece oda
//  gecisinde oyuncu zaten icinde bulundugu volkani goruyor.
//  Olculer room_battle_1'deki o_phase_bg ile ayni dile sahip.
// ---------------------------------------------------------------------
volc    = 0;        // 0..1, anlatici satirlariyla doluyor
VLAVA_Y = 452;      // lav ufku (diyalog metninin altinda kaliyor)

VRIDGE_N = 30;
vridge = [];
for (var i = 0; i <= VRIDGE_N; i++) {
    var _u    = i / VRIDGE_N;
    var _edge = 1 - sin(_u * pi);                        // kenarda 1, ortada 0
    var _h    = 20 + _edge * 18 + irandom_range(0, 8)
              + sin(_u * 15.0) * 4;
    array_push(vridge, {x: -20 + _u * 680, y: 486 - _h});
}

ash = [];
repeat (28) {
    array_push(ash, {
        x:  random(660) - 10,
        y:  random(480),
        vs: random_range(0.20, 0.72),
        hs: random_range(-0.26, 0.26),
        sz: random_range(0.7, 1.9),
        a:  random_range(0.12, 0.36),
        ph: random(6.28),
        fl: random_range(0.02, 0.06)
    });
}
COL_ASH = make_colour_rgb(120,  98,  92);
COL_ROCK = make_colour_rgb( 16,   7,   7);

// Parcanin finalindeki sert vuruslar (parca basindan itibaren saniye).
// Ses zarfi olculerek cikarildi; ekran her birinde bir kez zonkluyor.
accents = [36.0, 37.5, 39.0, 40.5, 42.0, 43.5, 45.0, 46.5];

// ---------------------------------------------------------------------
//  Ciziim yardimcilari
// ---------------------------------------------------------------------

/// Yumusak radyal parlama
p15_glow = function(_x, _y, _r, _col, _a, _yscale = 1) {
    if (_a <= 0.002 || _r <= 0) return;
    var _n = 26;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(_x, _y, _col, _a);
    for (var i = 0; i <= _n; i++) {
        var _d = i * (360 / _n);
        draw_vertex_colour(_x + lengthdir_x(_r, _d), _y + lengthdir_y(_r, _d) * _yscale, _col, 0);
    }
    draw_primitive_end();
}

/// Sarsinti ver (guc, sureklilik degil)
p15_shake = function(_power) {
    shake_power = max(shake_power, _power);
}

/// Kivilcim patlamasi
p15_burst = function(_x, _y, _count, _speed, _col) {
    repeat (_count) {
        var _d = random(360);
        var _v = random_range(_speed * 0.35, _speed);
        array_push(spark, {
            x: _x + random_range(-8, 8),
            y: _y + random_range(-6, 6),
            hs: lengthdir_x(_v, _d),
            vs: lengthdir_y(_v, _d),
            life: irandom_range(16, 40), maxlife: 40,
            col: _col
        });
    }
}

/// Tam genislikte dikey renk gecisi (ates katmanlari icin)
p15_vgrad = function(_y0, _y1, _c0, _a0, _c1, _a1) {
    if (_a0 <= 0.002 && _a1 <= 0.002) return;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(-40, _y0, _c0, _a0); draw_vertex_colour(680, _y0, _c0, _a0);
    draw_vertex_colour(-40, _y1, _c1, _a1); draw_vertex_colour(680, _y1, _c1, _a1);
    draw_primitive_end();
}

/// Yatay anamorfik isik cizgisi. P05'te sok dalgalari halka seklindeydi;
/// burada bunun yerine ekrani yalayan bir merceksi parlama var.
p15_flare = function(_cx, _cy, _hw, _hh, _col, _a) {
    if (_a <= 0.002 || _hw <= 0) return;
    var _n = 26;
    // ust yari
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _u = i / _n;
        var _t = sin(_u * pi);
        var _x = _cx - _hw + _u * 2 * _hw;
        draw_vertex_colour(_x, _cy - _hh * _t * _t, _col, 0);
        draw_vertex_colour(_x, _cy,                 _col, _a * _t);
    }
    draw_primitive_end();
    // alt yari
    draw_primitive_begin(pr_trianglestrip);
    for (var i = 0; i <= _n; i++) {
        var _u = i / _n;
        var _t = sin(_u * pi);
        var _x = _cx - _hw + _u * 2 * _hw;
        draw_vertex_colour(_x, _cy,                 _col, _a * _t);
        draw_vertex_colour(_x, _cy + _hh * _t * _t, _col, 0);
    }
    draw_primitive_end();
}

/// Vurusta ekrani yalayan isik cizgisi ekle
p15_add_flare = function(_y, _life, _col) {
    array_push(flare, {y: _y, life: _life, maxlife: _life, col: _col});
}
