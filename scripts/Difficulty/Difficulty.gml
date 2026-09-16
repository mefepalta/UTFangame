
function Difficulty_Get()
{
	if (!variable_global_exists("difficulty")) { return DIFFICULTY_NORMAL; }
	var _d = global.difficulty;
	if (!is_real(_d)) { return DIFFICULTY_NORMAL; }
	return clamp(floor(_d), 0, DIFFICULTY_COUNT - 1);
}

function Difficulty_Easy() { return (Difficulty_Get() == DIFFICULTY_EASY); }

function Difficulty_TurnList(_room)
{
	var _d = Difficulty_Get();
	if (_d == DIFFICULTY_HARD) { return -1; }

	if (_room == room_battle_1)
	{
		if (_d == DIFFICULTY_EASY)
		{
			var _pap = Difficulty_PapyrusAtakSirasi();
			var _liste = [1, 8, 15];
			for (var _pi = 0; _pi < array_length(_pap); _pi++) { array_push(_liste,28); }
			return _liste;
		}
		return [1, 4, 7, 8, 14, 15, 16, 17, 18, 19, 20];
	}

	if (_d == DIFFICULTY_EASY) { return [1, 4, 7, 11, 14, 20]; }
	return [1, 4, 6, 7, 9, 11, 13, 14, 16, 17, 20];
}

function Difficulty_PapyrusAtakSirasi()
{
	return [1, 2, 4, 7, 10];
}

function Difficulty_PapyrusAtakNo(_sayac)
{
	var _n = Difficulty_PapyrusKacinci(_sayac);
	if (_n <= 0) { return 0; }

	var _sira = Difficulty_PapyrusAtakSirasi();
	if (_n > array_length(_sira)) { _n = array_length(_sira); }
	return _sira[_n-1];
}

function Difficulty_PapyrusKacinci(_sayac)
{
	var _list = Difficulty_TurnList(room_battle_1);
	if (!is_array(_list)) { return 0; }

	var _n = 0;
	var _len = min(_sayac, array_length(_list));
	for (var _i = 0; _i < _len; _i++)
	{
		if (_list[_i] == 28) { _n += 1; }
	}
	return _n;
}

function Difficulty_PapyrusSonAtak(_sayac)
{
	var _n = Difficulty_PapyrusKacinci(_sayac);
	return (_n >= array_length(Difficulty_PapyrusAtakSirasi()));
}

function Difficulty_MapTurn(_n)
{
	if (_n <= 0)  { return _n; }
	if (_n >= 21) { return _n; }

	var _list = Difficulty_TurnList(room);
	if (!is_array(_list)) { return _n; }

	var _len = array_length(_list);
	if (_len <= 0) { return _n; }

	var _i = _n - 1;
	if (_i >= _len) { _i = _len - 1; }

	return _list[_i];
}

function Difficulty_Hasar(_dmg)
{
	if (!is_real(_dmg)) { return _dmg; }
	if (_dmg <= 0)      { return _dmg; }

	var _d = Difficulty_Get();

	if (_d == DIFFICULTY_EASY)
	{
		if (variable_global_exists("easy_dmg4") && global.easy_dmg4) { return 4; }
		return 1;
	}

	if ((_d == DIFFICULTY_NORMAL) && (room == room_battle_1))
	{
		return max(DMG_FAZ2_NORMAL_TABAN, _dmg - DMG_FAZ2_NORMAL_INDIRIM);
	}

	return _dmg;
}

function Difficulty_KrKapali()
{
	return (Difficulty_Get() == DIFFICULTY_EASY);
}

function Difficulty_AtakKisa()
{
	return (Difficulty_Get() != DIFFICULTY_HARD);
}

// Turuncu ruhun buyuk dash'i icin gereken sarj suresi (kare).
// HARD'da taban deger korunuyor, HARD disinda kisaltiliyor.
function Difficulty_DashSarj(_taban)
{
	if (!is_real(_taban)) { return _taban; }
	if (Difficulty_Get() == DIFFICULTY_HARD) { return _taban; }
	return min(_taban, DASH_SARJ_KOLAY);
}



function Difficulty_Konusmaci(_t)
{
	if (string_pos("{speaker 1}", _t) > 0) { return 1; }
	if (string_pos("{speaker 2}", _t) > 0) { return 2; }
	if (string_pos("{font 4}", _t)    > 0) { return 1; }
	if (string_pos("{font 2}", _t)    > 0) { return 2; }
	return 0;
}

function Difficulty_Parcala(_t)
{
	var _parca = [];
	var _bas   = 1;
	var _i     = 1;
	var _n     = string_length(_t);

	while (_i <= _n)
	{
		if (string_char_at(_t, _i) == "{")
		{
			var _j = _i + 1;
			while ((_j <= _n) && (string_char_at(_t, _j) != "}")) { _j += 1; }
			if (_j > _n) { break; }

			if (string_copy(_t, _i, 9) == "{speaker ")
			{
				if (_i > _bas) { array_push(_parca, string_copy(_t, _bas, _i - _bas)); }
				_bas = _i;
			}
			_i = _j + 1;
			continue;
		}
		_i += 1;
	}

	if (_bas <= _n) { array_push(_parca, string_copy(_t, _bas, _n - _bas + 1)); }
	return _parca;
}

function Difficulty_Indirge(_seg, _head, _yildiz)
{
	var _tut = ["revive", "pap_state", "alp_state", "sans_state", "script",
	            "destroy", "sound", "effect", "pap_head_spr", "alp_head_spr"];

	var _bas_etiket = "";
	var _yan        = "";
	var _kutu       = false;
	var _basta      = true;

	var _i = 1;
	var _n = string_length(_seg);

	while (_i <= _n)
	{
		if (string_char_at(_seg, _i) != "{") { _basta = false; _i += 1; continue; }

		var _j = _i + 1;
		while ((_j <= _n) && (string_char_at(_seg, _j) != "}")) { _j += 1; }
		if (_j > _n) { break; }

		var _tam = string_copy(_seg, _i, _j - _i + 1);
		var _ad  = string_copy(_seg, _i + 1, _j - _i - 1);
		var _sp  = string_pos(" ", _ad);
		if (_sp > 0) { _ad = string_copy(_ad, 1, _sp - 1); }

		if (_ad == "clear") { _kutu = true; }

		if (_basta && ((_ad == "speaker") || (_ad == "font") || (_ad == "voice") || (_ad == "squish")))
		{
			_bas_etiket += _tam;
		}
		else if (array_contains(_tut, _ad))
		{
			_yan += _tam;
		}
		else
		{
			_basta = false;
		}

		_i = _j + 1;
	}

	var _h = (_head && instance_exists(battle_enemy_engage)) ? "{head 3}" : "";
	var _y = _yildiz ? "* " : "";
	var _k = _kutu ? "{pause}{clear}" : "";

	return _bas_etiket + _h + _y + "..." + _k + _yan;
}

function Difficulty_SonClearTemizle(_t)
{
	if (!is_string(_t)) { return _t; }
	var _n = string_length(_t);

	var _ci = 0;
	var _i  = 1;
	while (_i <= _n-6)
	{
		if (string_copy(_t,_i,7) == "{clear}") { _ci = _i; _i += 7; }
		else { _i += 1; }
	}
	if (_ci == 0) { return _t; }

	var _sonra   = string_copy(_t,_ci+7,_n-(_ci+6));
	var _gorunur = false;
	var _icinde  = false;
	var _m = string_length(_sonra);
	for (var _j = 1; _j <= _m; _j++)
	{
		var _c = string_char_at(_sonra,_j);
		if      (_c == "{") { _icinde = true; }
		else if (_c == "}") { _icinde = false; }
		else if (!_icinde && _c != " ") { _gorunur = true; break; }
	}
	if (_gorunur) { return _t; }

	var _once = string_copy(_t,1,_ci-1);
	if ((string_length(_once) >= 7) && (string_copy(_once,string_length(_once)-6,7) == "{pause}"))
	{
		_once = string_copy(_once,1,string_length(_once)-7);
	}
	return _once + _sonra;
}

function Difficulty_Metin(_t)
{
	if (!Difficulty_Easy()) { return _t; }
	if (!is_string(_t))     { return _t; }
	if (_t == "")           { return _t; }

	if (string_copy(_t,1,10) == "{easy_raw}")
	{
		return Difficulty_SonClearTemizle(string_delete(_t,1,10));
	}

	var _tur = -1;
	if ((room == room_battle_1) && instance_exists(battle))
	{
		_tur = Difficulty_MapTurn(Battle_GetTurnNumber());
	}

	var _parca   = Difficulty_Parcala(_t);
	var _out     = "";
	var _kacinci = [0,0,0];

	for (var _i = 0; _i < array_length(_parca); _i++)
	{
		var _seg = _parca[_i];
		var _kon = Difficulty_Konusmaci(_seg);

		_kacinci[_kon] += 1;
		var _ovr = (_tur >= 0) ? Difficulty_Faz2Metin(_tur, _kon, _kacinci[_kon]) : "";
		if (_ovr != "") { _out += _ovr; continue; }

		if (_kon != 0)  { _out += _seg; continue; }

		_out += Difficulty_Indirge(_seg, true, false);
	}

	return Difficulty_SonClearTemizle(_out);
}

function Difficulty_KuyrukMetin(_t)
{
	if (!Difficulty_Easy()) { return _t; }
	if (!is_string(_t))     { return _t; }
	if (string_pos("{font 3}", _t) <= 0) { return _t; }
	if (Difficulty_Konusmaci(_t) != 0)   { return _t; }

	return Difficulty_SonClearTemizle(Difficulty_Indirge(_t, false, (string_pos("* ", _t) > 0)));
}

function Difficulty_SahneDialog(_dizi, _sans_adet)
{
	if (!Difficulty_Easy()) { return _dizi; }
	if (!is_array(_dizi))   { return _dizi; }

	var _n = min(_sans_adet, array_length(_dizi));
	for (var _i = 0; _i < _n; _i++)
	{
		_dizi[_i].text = (_i == 0) ? "..." : "";
	}

	return _dizi;
}



function Difficulty_Faz2Metin(_tur, _konusmaci, _kacinci)
{
	return "";
}

function Difficulty_Faz2Muzik()
{
	return snd_p2theme;
}

function Difficulty_PapyrusMuzik()
{
	var _s = asset_get_index("snd_papyrus_easy");
	if ((_s != -1) && audio_exists(_s)) { return _s; }
	return snd_glisterbones;
}

function Difficulty_PapyrusMuzikBasla()
{
	if (!Difficulty_Easy()) { return false; }
	if (!variable_global_exists("p2_bgm")) { global.p2_bgm = -1; }

	var _yeni = Difficulty_PapyrusMuzik();
	if (_yeni == -1) { return false; }

	if (audio_is_playing(global.p2_bgm)) { audio_stop_sound(global.p2_bgm); }
	global.p2_bgm = audio_play_sound(_yeni,1,true);
	return true;
}
