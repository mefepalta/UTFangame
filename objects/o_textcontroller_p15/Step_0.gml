p15++;

var _elapsed = (current_time - start_time) / 1000;

var _new_line = false;
if (current_line + 1 < array_length(dialogue)) {
    if (_elapsed >= dialogue[current_line + 1].time) {
        current_line++;
        line_start_time = _elapsed;
        last_chars = 0;
        _new_line = true;
    }
}

if (current_line >= 0) {
    var _txt = dialogue[current_line].text;
    var _vis = clamp(floor((_elapsed - line_start_time) / char_speed), 0, string_length(_txt));
    if (_vis > last_chars) {
        for (var i = last_chars + 1; i <= _vis; i++) {
            var _c = string_char_at(_txt, i);
            if (_c != " " && _c != "." && _c != "," && _c != "!" && _c != "?") {
                if (current_line < LINE_NARRATOR) audio_play_sound(snd_text_voice_sans,  1, false);
                else                              audio_play_sound(snd_text_voice_typer, 1, false);
            }
        }
        last_chars = _vis;
    }
    chars_visible = _vis;
}

if (_new_line)
{
    if (current_line == LINE_MUSIC) {
        BGM_Play(5, snd_p15theme, false);
        music_t     = 0;
        next_accent = 0;
    }

    if (current_line == LINE_EYECUE) {
        eye_glow = 1;
    }

    if (current_line == LINE_STANDUP) {
        o_p15_legs.image_index  = 0;
        o_p15_arm.image_index   = 0;
        o_p15_arm_1.image_index = 0;
        audio_play_sound(snd_noise, 1, false);
        p15_shake(7);
        p15_burst(320, 300, 14, 4, COL_DUST);
    }

    if (current_line == LINE_NARRATOR) {
        font_custom = font_determination_mono_1;
        audio_play_sound(snd_noise, 1, false);
        p15_shake(12);
    }

    if (current_line == LINE_NARRATOR + 1) {
        p15_shake(6);
        p15_add_flare(o_p15_eye.y, 34, COL_EMBER);
    }
    if (current_line == LINE_NARRATOR + 2) {
        p15_shake(5);
        p15_add_flare(o_p15_eye.y + 40, 30, COL_FIRE);
        p15_burst(320, 470, 18, 5, COL_FIRE);
    }
    if (current_line == LINE_NARRATOR + 3) p15_shake(8);
    if (current_line == LINE_NARRATOR + 5) {
        flash = 0.3;
        beat  = 1;
        p15_shake(10);
        p15_add_flare(o_p15_eye.y, 40, COL_GOLD);
    }
}

beat = max(beat - 0.06, 0);
if (music_t >= 0) {
    music_t++;
    var _mt = music_t / 60;
    if (next_accent < array_length(accents) && _mt >= accents[next_accent]) {
        next_accent++;
        beat = 1;
        p15_shake(3 + next_accent * 0.7);
        p15_add_flare(190 + irandom_range(-70, 90), 16 + next_accent * 2,
                      (next_accent >= 7) ? COL_GOLD : COL_EMBER);
    }
}

if (current_line < LINE_NARRATOR) {
    aura_target = 0.16 + max(current_line, 0) * 0.030 + beat * 0.22;
} else {
    var _nl = current_line - LINE_NARRATOR;
    aura_target = max(0, (_nl - 0.5) * 0.16) + beat * 0.18;
}
aura  += (aura_target - aura) * 0.05;
pulse += 0.055;

if (current_line >= LINE_NARRATOR && current_line < LINE_NARRATOR + 7) {
    rumble = min(rumble + 0.03, 1.4 + (current_line - LINE_NARRATOR) * 0.35);
} else {
    rumble = max(rumble - 0.08, 0);
}

shake_power = max(shake_power - 0.5, 0);
var _amp = shake_power + rumble;
if (_amp > 0.01) {
    global.p15_sx = random_range(-_amp, _amp);
    global.p15_sy = random_range(-_amp, _amp) * 0.7;
} else {
    global.p15_sx = 0;
    global.p15_sy = 0;
}

flash    = max(flash - 0.05, 0);
eye_glow = max(eye_glow - 0.012, 0);

for (var i = array_length(spark) - 1; i >= 0; i--) {
    var _k = spark[i];
    _k.life--;
    _k.x  += _k.hs;
    _k.y  += _k.vs;
    _k.vs += 0.3;
    _k.hs *= 0.96;
    if (_k.life <= 0 || _k.y > 520) array_delete(spark, i, 1);
}
for (var i = array_length(flare) - 1; i >= 0; i--) {
    flare[i].life--;
    if (flare[i].life <= 0) array_delete(flare, i, 1);
}
for (var i = 0; i < array_length(mote); i++) {
    var _m = mote[i];
    _m.y  += _m.vs * (1 + aura);
    _m.x  += _m.hs + sin(_m.ph) * 0.13;
    _m.ph += _m.fl;
    if (_m.y < -8) { _m.y = 492; _m.x = random(640); }
}

var _vt = 0;
if (current_line >= LINE_NARRATOR) {
    _vt = clamp((current_line - LINE_NARRATOR) / 3, 0, 1);
}
volc += (_vt - volc) * 0.02;

if (volc > 0.01) {
    for (var i = 0; i < array_length(ash); i++) {
        var _k = ash[i];
        _k.y  += _k.vs;
        _k.x  += _k.hs + sin(_k.ph) * 0.30;
        _k.ph += _k.fl;
        if (_k.y > 492) { _k.y = -10; _k.x = random(660) - 10; }
        if (_k.x < -12) _k.x = 652; else if (_k.x > 652) _k.x = -12;
    }
}

for (var _h = 0; _h < array_length(HIT_STEPS); _h++)
{
	if (p15 != HIT_STEPS[_h]) continue;

	o_p15_legs.shake_time   = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index  = _h;
	repeat (5) {
		instance_create_depth(o_p15_head.x + 15, o_p15_head.y - 50, -999999999, o_skull_particle);
	}
	audio_play_sound(snd_damage, 1, false);
	p15_shake(9 - _h);
	p15_burst(o_p15_head.x + 12, o_p15_head.y - 44, 10, 5.5, COL_DUST);

	if (_h == array_length(HIT_STEPS) - 1) {
		o_p15_legs.image_index  = 1;
		o_p15_arm.image_index   = 1;
		o_p15_arm_1.image_index = 1;
	}
}

var _rd = p15 - RAISE_START;
if (_rd >= 0 && _rd <= RAISE_STEP * 6 && (_rd mod RAISE_STEP) == 0)
{
	o_p15_head.sprite_index = s_p15_headraise;
	o_p15_head.image_index  = _rd / RAISE_STEP;
	eye_glow = max(eye_glow, (_rd / (RAISE_STEP * 6)) * 0.55);
}

if (current_line >= LINE_NARRATOR)
{
	o_p15_arm.image_alpha        -= 0.03;
	o_p15_arm_1.image_alpha      -= 0.03;
	o_p15_body.image_alpha       -= 0.03;
	o_p15_head.image_alpha       -= 0.03;
	o_p15_legs.image_alpha       -= 0.03;
	o_p15wingthings_1.image_alpha -= 0.03;
	o_p15_wingthing.image_alpha  -= 0.03;
}

if (p15 == 4875)
{
	o_p15_eye.image_alpha = 1;
	instance_create_layer(o_p15_eye.x, o_p15_eye.y, "Instances", o_p15_eye_effect);
	o_p15_papyrus.image_alpha += 0.01;
	o_p15_alphys.image_alpha  += 0.01;
	flash    = 0.75;
	eye_glow = 1;
	p15_shake(14);
	p15_burst(o_p15_eye.x, o_p15_eye.y, 30, 7.5, choose(COL_FIRE, COL_GOLD, COL_EMBER));
	p15_add_flare(o_p15_eye.y, 46, COL_GOLD);
}
if (p15 > 4875)
{
	o_p15_papyrus.image_alpha += 0.001;
	o_p15_alphys.image_alpha  += 0.001;
	eye_glow = max(eye_glow, 0.8 + sin(pulse * 1.7) * 0.2);
}
if (p15 > 5100) eye_glow = min(eye_glow, max(0, 1 - (p15 - 5100) / 80));

if (keyboard_check_pressed(vk_space))
{
	global.sansphase = 2;
	BGM_Stop(5);
	room_goto(room_battle_1);
}
