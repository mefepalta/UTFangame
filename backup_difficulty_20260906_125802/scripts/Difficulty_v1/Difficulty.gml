/// ZORLUK / TUR LISTESI
///
/// Oyuncular dovusun uzunlugundan sikayet ettigi icin NORMAL ve EASY, HARD'in
/// tur dizisinden bazi turlari ATLAYARAK kisaliyor. Tur objelerinin
/// (battle_turn_N) hicbirine dokunulmuyor: sadece
/// battle_enemy_engage/Other_18 hangi objeyi yaratacagini buraya soruyor.
///
/// Tur sayaci (battle._turn_number) HARD'da dogrudan obje numarasi. NORMAL ve
/// EASY'de ise listedeki SIRA numarasi oluyor; sayacin kendi davranisi
/// (Battle_EndTurn ile artmasi, FIGHT disi secimlerde geri alinmasi)
/// degismiyor.
///
/// LISTEDEN CIKARILAMAYACAKLAR:
///   tur 0        giris turu, esleme disi
///   tur 21-27    p25 (son duz kosu); Other_18 zaten 25'e zorluyor, esleme disi
///   faz 1 t20    global.finalstretch = 1 burada set ediliyor; olmazsa faz 1
///                hic bitmiyor (oyuncu Sans'a hasar veremiyor)
///   faz 2 t8     Alphys sahnesi (alp_state)
///   faz 2 t15    Papyrus sahnesi (pap_state)
///   faz 2 t16-19 Alphys/Papyrus cutscene zinciri (t16/t17/t18'in atagi yok,
///                sirasiyla 60/20/60 kare -- kesmenin kazanci sifir)
///   faz 2 t20    P25Baslat() burada cagriliyor; olmazsa faz 2 bitmiyor
///
/// Surrender_Atak() battle_turn_9..20'yi KENDI sayaciyla (global.sanstalk +
/// SURRENDER_ATAK_OFS) yeniden kullaniyor. O yol Other_18'in FIGHT dalindan
/// gecmiyor, dolayisiyla bu esleme onu etkilemiyor.

/// @desc Gecerli zorluk. global.difficulty bozuksa NORMAL'e duser.
function Difficulty_Get()
{
	if (!variable_global_exists("difficulty")) { return DIFFICULTY_NORMAL; }
	var _d = global.difficulty;
	if (!is_real(_d)) { return DIFFICULTY_NORMAL; }
	return clamp(floor(_d), 0, DIFFICULTY_COUNT - 1);
}

/// @desc Bu faz + zorluk icin oynanacak tur numaralari. HARD'da -1 (esleme yok).
function Difficulty_TurnList(_room)
{
	var _d = Difficulty_Get();
	if (_d == DIFFICULTY_HARD) { return -1; }

	if (_room == room_battle_1)
	{
		// FAZ 2. Cikanlar: t2/t3 (t1 ve t8'in tekrari), t5/t6 (t4 ile ayni
		// seyi ucuncu kez soyluyor), t9 (Papyrus'u t14 zaten anlatiyor),
		// t10/t11/t12/t13 (otel anisinin tamami). Anlati t14'un genel
		// "insanlari rahatlatirdi" cumlesi + t15'in "tesekkur edemedim"
		// odemesi uzerinden yuruyor; spesifik stand-up anekdotu gidiyor.
		if (_d == DIFFICULTY_EASY) { return [1, 8, 15, 16, 17, 18, 19, 20]; }
		return [1, 4, 7, 8, 14, 15, 16, 17, 18, 19, 20];
	}

	// FAZ 1. Cikanlar: t2/t3 (lore'suz taunt), t5 (Undyne mizragi hikayesi --
	// t4 mizragi zaten tanitiyor), t8 (t16/t17 ayni temayi isliyor), t10
	// (t11 kurulumu zaten iceriyor), t12 (t11'in tekrari), t15 (t16 ayni
	// seyi soyluyor), t18 (tahliye/riot filler'i), t19 (t20 aynisini daha
	// iyi soyluyor). t6 BILEREK kaliyor: t7'nin "when it finally dawned on
	// me" cumlesi onsuz havada kaliyor.
	if (_d == DIFFICULTY_EASY) { return [1, 4, 7, 11, 14, 20]; }
	return [1, 4, 6, 7, 9, 11, 13, 14, 16, 17, 20];
}

/// @desc Tur sayacini gercek battle_turn_N numarasina cevirir.
function Difficulty_MapTurn(_n)
{
	if (_n <= 0)  { return _n; }   // giris turu
	if (_n >= 21) { return _n; }   // p25; Other_18 bu araligi kendi yonetiyor

	var _list = Difficulty_TurnList(room);
	if (!is_array(_list)) { return _n; }

	var _len = array_length(_list);
	if (_len <= 0) { return _n; }

	// Liste bitip sayac devam ederse son tura sabitlen. Bu ancak oyuncu faz
	// sonu turunu gectigi halde dovusu bitirmediginde olur; HARD'da orada
	// battle_turn_21 yaratiliyor ve o obje faz 1'de tamamen room_battle_1
	// korumali oldugu icin Battle_EndTurn'e HIC ulasmiyor, yani tur donuyor.
	// Son turu tekrarlamak o kilitlenmeden iyi.
	var _i = _n - 1;
	if (_i >= _len) { _i = _len - 1; }

	return _list[_i];
}

/// @desc EASY'de Sans'in tum replikleri "..." olur.
///
/// Tek mudahale noktasi battle_dialog_enemy/Alarm_0: sansy.text oraya kadar
/// atanmis oluyor (Create alarm[0]=1 kuruyor, metin bir kare sonra okunuyor).
/// Surrender_Text(), phase2_text ve turn_20'nin sf_dlg_metin'i de ayni
/// instance'in .text'ine yaziliyor, hepsi buradan geciyor.
///
/// Papyrus (speaker 1) ve Alphys (speaker 2) konusmaya DEVAM ediyor; susan
/// sadece Sans. Faz 2'nin t16-t19 cutscene zinciri boylece ayakta kaliyor.
function Difficulty_Metin(_t)
{
	if (Difficulty_Get() != DIFFICULTY_EASY) { return _t; }
	if (!is_string(_t)) { return _t; }
	if (_t == "")       { return _t; }

	if (string_pos("{speaker 1}", _t) > 0) { return _t; }
	if (string_pos("{speaker 2}", _t) > 0) { return _t; }

	// Bastaki font/voice/speaker etiketleri korunmali; atilirsa kutu yanlis
	// font ve yanlis konusma sesiyle ciziliyor.
	var _keep = "";
	var _i    = 1;
	var _n    = string_length(_t);

	while (_i <= _n)
	{
		if (string_char_at(_t, _i) != "{") { break; }

		var _j = _i + 1;
		while ((_j <= _n) && (string_char_at(_t, _j) != "}")) { _j += 1; }
		if (_j > _n) { break; }

		var _ad = string_copy(_t, _i + 1, _j - _i - 1);
		var _sp = string_pos(" ", _ad);
		if (_sp > 0) { _ad = string_copy(_ad, 1, _sp - 1); }

		if ((_ad == "speaker") || (_ad == "font") || (_ad == "voice") || (_ad == "squish"))
		{
			_keep += string_copy(_t, _i, _j - _i + 1);
		}

		_i = _j + 1;
	}

	return _keep + "{head 25}...";
}

/// @desc EASY'de alinan hasar sabit 1. Negatif deger iyilestirme, dokunulmuyor.
function Difficulty_Hasar(_dmg)
{
	if (Difficulty_Get() != DIFFICULTY_EASY) { return _dmg; }
	if (!is_real(_dmg)) { return _dmg; }
	if (_dmg <= 0)      { return _dmg; }
	return 1;
}

/// @desc EASY'de KR tamamen kapali (hasar zaten 1'e sabit).
/// global.kr faz 2'de zaten false; EASY bunu faz 1'e de yayiyor.
function Difficulty_KrKapali()
{
	return (Difficulty_Get() == DIFFICULTY_EASY);
}

/// @desc HARD disinda uzun ataklarin tekrar eden bolumleri atlanir.
///
/// Kullanim: ilgili turun Step_0'inda, oda blogunun EN BASINDA
///   if (Difficulty_AtakKisa()) and (_timer == A) { _timer = B; }
/// Turlar zaten bu deyimi kendileri kullaniyor (bkz battle_turn_15'in
/// faz gecisleri: _timer = 600 / _timer = 2015), yani yeni bir mekanizma
/// degil. A "olu" bir kare olmali (o karede hicbir if tetiklenmemeli); B ise
/// hedef desenin cadence'ini bozmayacak sekilde secilmeli.
///
/// Faz 1'in ve faz 2'nin t20'si (final ataklari) BILEREK disarida: onlar tam
/// uzunlukta kaliyor.
function Difficulty_AtakKisa()
{
	return (Difficulty_Get() != DIFFICULTY_HARD);
}
