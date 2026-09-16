// Gri yanip sonen ipucu yazilari (battle_hint_text). Ilk-kez bayraklari
// o_globals/Create'te tutulur; olum sonrasi Run_ResetState SIFIRLAMAZ, yani
// ipucu oturumda bir kez gosterilir.

function Battle_Hint(_text,_mode,_life)
{
	var _h = instance_create_depth(0,0,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH-5,battle_hint_text);
	_h.text = _text;
	_h.mode = _mode;
	_h.life = _life;
	return _h;
}

// Sari ruh: kutunun ustunde "Hold [Z] to make a POWER SHOT!" (sadece ilk kez)
function Battle_HintPowerShot()
{
	if (!variable_global_exists("hint_powershot")) { global.hint_powershot = false; }
	if (global.hint_powershot) { return noone; }
	global.hint_powershot = true;
	return Battle_Hint("Hold [Z] to make a POWER SHOT!",0,300);
}

// Turuncu ruh: ruhun ustunde "Hold [Z] to make a DASH!" (sadece ilk kez)
function Battle_HintDash()
{
	if (!variable_global_exists("hint_dash")) { global.hint_dash = false; }
	if (global.hint_dash) { return noone; }
	global.hint_dash = true;
	return Battle_Hint("Hold [Z] to make a DASH!",1,300);
}

// Carousel: ilk birkac carousel icin "Don't jump!" + ok. Kac tanesinde
// gosterilecegi HINT_CAR_ADET; sayac oturum boyunca artar.
#macro HINT_CAR_ADET 3

function Battle_HintCarousel()
{
	if (!variable_global_exists("hint_car_sayac")) { global.hint_car_sayac = 0; }
	if (global.hint_car_sayac >= HINT_CAR_ADET) { return noone; }
	global.hint_car_sayac += 1;
	var _h = Battle_Hint("Don't jump!",2,100000);
	_h.ok = true;
	_h.max_w = 120;
	_h.sc_taban = 0.65;
	return _h;
}

// Ayna hedefleri (DR_TARGET.MIRROR): ilk birkac ayna icin "Don't shoot at these!"
// + unlem levhasi + aynaya bakan ok. Hint aynayi takip eder, ayna solunca soner.
#macro HINT_AYNA_ADET 2

function Battle_HintMirror(_ayna)
{
	if (!variable_global_exists("hint_ayna_sayac")) { global.hint_ayna_sayac = 0; }
	if (global.hint_ayna_sayac >= HINT_AYNA_ADET) { return noone; }
	// Arka arkaya gelen aynalara (cift halinde 5 kare arayla) tek uyari:
	// canli bir ayna uyarisi varken yenisi acilmaz
	var _var = false;
	with (battle_hint_text) { if (takip != noone) { _var = true; } }
	if (_var) { return noone; }
	global.hint_ayna_sayac += 1;
	var _h = Battle_Hint("Don't shoot at these!",2,100000);
	_h.ok = true;
	_h.isaret = true;
	_h.takip = _ayna;
	_h.max_w = 120;
	_h.sc_taban = 0.6;
	_h.ok_dx = 44;
	_h.ok_dy = -40;
	return _h;
}

