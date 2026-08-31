p05++;

var _elapsed = (current_time - start_time) / 1000;

// ---- diyalog ilerlemesi ---------------------------------------------
if (current_line + 1 < array_length(dialogue)) {
    if (_elapsed >= dialogue[current_line + 1].time) {
        current_line++;
        line_start_time = _elapsed;
        last_chars = 0;
    }
}

// ---- harf harf yazma + konusma sesi ---------------------------------
// (eskiden Draw icindeydi; sayim mantigi cizimden ayrildi)
if (current_line >= 0) {
    var _txt = dialogue[current_line].text;
    var _vis = clamp(floor((_elapsed - line_start_time) / char_speed), 0, string_length(_txt));
    if (_vis > last_chars) {
        for (var i = last_chars + 1; i <= _vis; i++) {
            var _c = string_char_at(_txt, i);
            if (_c != " " && _c != "." && _c != "," && _c != "!" && _c != "?") {
                audio_play_sound(snd_text_voice_sans, 1, false);
            }
        }
        last_chars = _vis;
    }
    chars_visible = _vis;
}

// ---- atmosfer: konusma ilerledikce ortam isiniyor --------------------
aura_target = 0.10 + max(current_line, 0) * 0.045;
if (p05 > 2450) aura_target = max(aura_target, 0.72);   // "Prepare yourself..."
if (p05 > 2620) aura_target = max(aura_target, 0.90);   // son satirin ardindan
aura  += (aura_target - aura) * 0.03;
pulse += 0.055;

// Gece gogu ~8 saniyede aciliyor (Draw'da ayrica yumusatiliyor)
sky = min(sky + 0.0021, 1);

// ---- ugultu: mizrak inmeden once yer titremeye basliyor --------------
if (p05 > 2450 && p05 < 2703)        rumble = min(rumble + 0.018, 2.2);
else if (p05 >= 2703 && p05 < 2730)  rumble = min(rumble + 0.11,  5.0);
else                                 rumble = max(rumble - 0.10,  0);

// ---- sarsinti: darbe + ugultu ---------------------------------------
shake_power = max(shake_power - 0.55, 0);
var _amp = shake_power + rumble;
if (_amp > 0.01) {
    global.p05_sx = random_range(-_amp, _amp);
    global.p05_sy = random_range(-_amp, _amp) * 0.7;
} else {
    global.p05_sx = 0;
    global.p05_sy = 0;
}

flash    = max(flash - 0.055, 0);
slash_t  = max(slash_t - 1, 0);
eye_glow = max(eye_glow - 0.02, 0);
if (p05 > 2560) eye_glow = max(eye_glow, min((p05 - 2560) / 240, 0.75));
// Sahne karartmaya girerken goz parlamasi da sonsun, yoksa siyah ekranda
// tek basina asili bir pembe leke kaliyor.
if (p05 > 2800) eye_glow = min(eye_glow, max(0, 1 - (p05 - 2800) / 60));

// Kol savurmasinin biraktigi yay
if (p05 == 2708) slash_t = 15;

// ---- sok dalgalari ---------------------------------------------------
for (var i = array_length(shock) - 1; i >= 0; i--) {
    var _s = shock[i];
    _s.life--;
    _s.r  += _s.spd;
    _s.spd = max(_s.spd * 0.93, 0.6);
    if (_s.life <= 0) array_delete(shock, i, 1);
}

// ---- kivilcimlar -----------------------------------------------------
for (var i = array_length(spark) - 1; i >= 0; i--) {
    var _k = spark[i];
    _k.life--;
    _k.x  += _k.hs;
    _k.y  += _k.vs;
    _k.vs += 0.32;      // yercekimi
    _k.hs *= 0.96;
    if (_k.life <= 0 || _k.y > 520) array_delete(spark, i, 1);
}

// ---- yagan kar --------------------------------------------------------
for (var i = 0; i < array_length(mote); i++) {
    var _m = mote[i];
    _m.y  += _m.vs;
    _m.x  += sin(_m.ph) * _m.sw;
    _m.ph += _m.fl;
    if (_m.y > 492) { _m.y = -10; _m.x = random(660) - 10; }
    if (_m.x < -12) _m.x = 652; else if (_m.x > 652) _m.x = -12;
}

// ---- yildizlar: cok yavas kayiyor, yanip sonuyor ----------------------
for (var i = 0; i < array_length(star); i++) {
    var _s = star[i];
    _s.x  += _s.hs;
    _s.ph += _s.fl;
    if (_s.x < -12) _s.x = 652; else if (_s.x > 652) _s.x = -12;
}

// ---- sahne sonu: parcalar gizlenip poz sprite'ina geciliyor ----------
if (p05 > 2750)
{
	with (o_p05arm)         { image_alpha = 0; }
	with (o_p05arm_1)       { image_alpha = 0; }
	with (o_p05head)        { image_alpha = 0; }
	with (o_p05legs)        { image_alpha = 0; }
	with (o_p05body)        { image_alpha = 0; }
	with (o_p05wingthings)  { image_alpha = 0; }
	with (o_p05wingthings_1){ image_alpha = 0; }
	with (o_p05spear)       { image_alpha = 0; }
	with (o_p05decoy)       { image_alpha = 1; }
}

if (p05 > 2950)
{
	audio_stop_all();
	room_goto(room_battle);
}

if (keyboard_check_pressed(vk_space)) room_goto(room_battle);
