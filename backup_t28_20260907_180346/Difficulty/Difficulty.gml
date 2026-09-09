/// ZORLUK SISTEMI
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
///
/// YENI ATAK TURU EKLEMEK (or. EASY'ye ozel Papyrus atagi):
///   1. battle_turn_28 diye yeni bir obje ac, parent'i battle_turn olsun,
///      Step_0'a atagi yaz, sonunda Battle_EndTurn() cagir.
///   2. Asagidaki EASY listesine 28'i istedigin siraya koy.
///   Numara 21-27 araligiyla CAKISMAZ: Difficulty_MapTurn'un ">= 21" korumasi
///   SAYACA bakiyor, listedeki degere degil, ve sayac oraya sadece p25
///   zorlamasiyla cikiyor.

/// @desc Gecerli zorluk. global.difficulty bozuksa NORMAL'e duser.
function Difficulty_Get()
{
	if (!variable_global_exists("difficulty")) { return DIFFICULTY_NORMAL; }
	var _d = global.difficulty;
	if (!is_real(_d)) { return DIFFICULTY_NORMAL; }
	return clamp(floor(_d), 0, DIFFICULTY_COUNT - 1);
}

function Difficulty_Easy() { return (Difficulty_Get() == DIFFICULTY_EASY); }

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


// ---------------------------------------------------------------------------
// EASY: SANS SUSUYOR
// ---------------------------------------------------------------------------
//
// EASY'de oyunun HER YERINDEKI Sans repligi tek bir "..." oluyor: savas
// balonu, overworld (Trigger_Sans) ve ara faz altyazilari (p05/p15/p25).
// Papyrus ve Alphys konusmaya devam ediyor.
//
// Uc ayri metin yolu var, ucunun de tek bir giris noktasi:
//   savas balonu   -> battle_dialog_enemy/Alarm_0 -> Difficulty_Metin()
//   dialog kuyrugu -> Dialog_Add()                -> Difficulty_KuyrukMetin()
//   ara faz        -> o_textcontroller_*/Create_0 -> Difficulty_SahneDialog()

/// @desc Metnin sahibi: 0 Sans, 1 Papyrus, 2 Alphys.
///
/// DIKKAT: bu, TEK KONUSMACILI bir parca icin gecerli. Faz 2'de t8, t15, t16,
/// t18, t19 ve t20'nin metni TEK string icinde konusmaci degistiriyor
/// (Sans -> Alphys -> Sans gibi); orada once Difficulty_Parcala ile bolmek
/// gerekiyor, yoksa butun string ilk bulunan etikete gore siniflaniyor.
function Difficulty_Konusmaci(_t)
{
	if (string_pos("{speaker 1}", _t) > 0) { return 1; }
	if (string_pos("{speaker 2}", _t) > 0) { return 2; }
	if (string_pos("{font 4}", _t)    > 0) { return 1; }
	if (string_pos("{font 2}", _t)    > 0) { return 2; }
	return 0;
}

/// @desc Metni {speaker N} sinirlarindan parcalara boler.
/// Her parca kendi {speaker} etiketiyle BASLAR; bastaki etiketsiz parca
/// varsayilan olarak Sans'indir.
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

/// @desc Bir Sans parcasini "..."a indirger.
///
/// Metin gider, AMA yan etkili etiketler KALIR. Bu sart: t8'in Sans
/// monologunun sonundaki {revive 2} Alphys'i dirilten sey, t19'daki
/// {pap_state 3} Papyrus'u sahneden cikaran sey. Onlari dusurmek faz 2'yi
/// tamamen kirar.
///
/// @param _seg     tek konusmaciya ait metin parcasi
/// @param _head    true ise {head 3} eklenir (sadece savas balonunda; savas
///                 disinda battle_enemy_engage yok, etiket cokerdi)
/// @param _yildiz  true ise "* " on eki (overworld kutusunun bicimi)
function Difficulty_Indirge(_seg, _head, _yildiz)
{
	// Yan etkisi olan, yani metinle birlikte atilmamasi gereken etiketler.
	var _tut = ["revive", "pap_state", "alp_state", "sans_state", "script",
	            "destroy", "sound", "effect", "pap_head_spr", "alp_head_spr"];

	var _bas_etiket = "";      // bastaki speaker/font/voice/squish
	var _yan        = "";      // yan etkili etiketler, orijinal sirasiyla
	var _kutu       = false;   // parcada {clear} var miydi
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

/// @desc Savas balonu. battle_dialog_enemy/Alarm_0'dan cagriliyor.
///
/// Metin oraya kadar atanmis oluyor (Create alarm[0]=1 kuruyor, metin bir kare
/// sonra okunuyor). Surrender_Text(), phase2_text ve turn_20'nin sf_dlg_metin'i
/// de ayni instance'in .text'ine yaziliyor, hepsi buradan geciyor.
function Difficulty_Metin(_t)
{
	if (!Difficulty_Easy()) { return _t; }
	if (!is_string(_t))     { return _t; }
	if (_t == "")           { return _t; }

	// Faz 2'de t8/t15/t16/t18/t19/t20'nin metni TEK string icinde konusmaci
	// degistiriyor, o yuzden once parcalaniyor. Butun stringe tek konusmaci
	// atamak Sans'in o turlardaki repliklerini ayakta birakiyordu.
	var _tur = -1;
	if ((room == room_battle_1) && instance_exists(battle))
	{
		_tur = Difficulty_MapTurn(Battle_GetTurnNumber());
	}

	var _parca = Difficulty_Parcala(_t);
	var _out   = "";

	for (var _i = 0; _i < array_length(_parca); _i++)
	{
		var _seg = _parca[_i];
		var _kon = Difficulty_Konusmaci(_seg);

		// EASY'ye ozel faz 2 repligi varsa o parcanin yerine geciyor.
		var _ovr = (_tur >= 0) ? Difficulty_Faz2Metin(_tur, _kon) : "";
		if (_ovr != "") { _out += _ovr; continue; }

		// Susan sadece Sans; Papyrus ve Alphys aynen konusuyor.
		if (_kon != 0)  { _out += _seg; continue; }

		_out += Difficulty_Indirge(_seg, true, false);
	}

	return _out;
}

/// @desc Dialog_Add kuyrugu (overworld / Trigger_Sans).
///
/// Kuyrukta esya, tabela, telefon ve CHECK metinleri de var; onlarin hicbiri
/// {font 3} kullanmiyor, o yuzden filtre bu. Overworld metinleri "* " ile
/// basliyor ve savas disinda battle_enemy_engage YOK, o yuzden {head} eklenmez.
function Difficulty_KuyrukMetin(_t)
{
	if (!Difficulty_Easy()) { return _t; }
	if (!is_string(_t))     { return _t; }
	if (string_pos("{font 3}", _t) <= 0) { return _t; }
	if (Difficulty_Konusmaci(_t) != 0)   { return _t; }

	return Difficulty_Indirge(_t, false, (string_pos("* ", _t) > 0));
}

/// @desc Ara faz altyazilari (o_textcontroller_p05 / p15 / p25).
///
/// Dizi {time, text} struct'larindan olusuyor ve animasyon ipuclari (p15'in
/// LINE_NARRATOR / LINE_MUSIC / LINE_STANDUP / LINE_EYECUE, p05'in aura'si)
/// INDEKSE bagli. O yuzden girdi SILINMIYOR, sadece metni bosaltiliyor ve ilk
/// satira tek bir "..." konuyor -- sahnenin zamanlamasi aynen kaliyor.
///
/// @param _dizi      dialogue dizisi (referans, yerinde degistiriliyor)
/// @param _sans_adet dizinin basindan itibaren kac girdi Sans'a ait
///                   (gerisi anlatici metni, dokunulmuyor)
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


// ---------------------------------------------------------------------------
// EASY: FAZ 2 (PAPYRUS / ALPHYS)
// ---------------------------------------------------------------------------

/// @desc EASY'ye ozel faz 2 replikleri. METINLER HENUZ YAZILMADI.
///
/// Fikir: oyuncu kolay modu sectigi icin Papyrus ve Alphys ona "meta" laf
/// sokuyor. Doldurmak icin asagidaki case'lerin yorumunu kaldirip metni yaz;
/// bos string donerse orijinal replik oynar.
///
/// _tur       GERCEK battle_turn numarasi (sayac degil; Difficulty_MapTurn'den
///            gecmis hali). EASY faz 2 listesi: 1, 8, 15, 16, 17, 18, 19, 20.
/// _konusmaci 0 Sans, 1 Papyrus, 2 Alphys -- ayni turda iki kutu olabiliyor
///            (or. t16'da hem Sans'in Surrender metni hem Alphys'in
///            phase2_text'i), o yuzden tur tek basina yetmiyor.
///
/// Bicim, orijinal repliklerle ayni:
///   Papyrus -> "{speaker 1}{font 4}{voice 4}{pap_head 1}METIN{pause}{clear}"
///   Alphys  -> "{speaker 2}{font 2}{voice 2}{alp_head 1}METIN{pause}{clear}"
/// Satir sonu &, kutu sonu {pause}{clear}. Satir en fazla ~544 px.
function Difficulty_Faz2Metin(_tur, _konusmaci)
{
	if (!Difficulty_Easy()) { return ""; }

	// ALPHYS (_konusmaci == 2). Yorumu kaldirip metni yaz:
	// if (_konusmaci == 2) and (_tur == 16) { return "{speaker 2}{font 2}{voice 2}{alp_head 1}...{pause}{clear}"; }
	// if (_konusmaci == 2) and (_tur == 17) { return "{speaker 2}{font 2}{voice 2}{alp_head 0}...{pause}{clear}"; }
	// if (_konusmaci == 2) and (_tur == 18) { return "{speaker 2}{font 2}{voice 2}{alp_head 1}...{pause}{clear}"; }

	// PAPYRUS (_konusmaci == 1):
	// if (_konusmaci == 1) and (_tur == 19) { return "{speaker 1}{font 4}{voice 4}{pap_head 1}...{pause}{clear}"; }
	// if (_konusmaci == 1) and (_tur == 20) { return "{speaker 1}{font 4}{voice 4}{pap_head 0}...{pause}{clear}"; }

	return "";
}

/// @desc Faz 2 muzigi. battle_turn_0/Step_0 icinde _intro_timer == 1'de calisiyor.
///
/// Papyrus'un EASY'ye ozel parcasi eklendiginde asagidaki satirin yorumunu
/// kaldir. Parcayi dovusun ORTASINDA degistirmek gerekirse:
///   if (audio_is_playing(global.p2_bgm)) { audio_stop_sound(global.p2_bgm); }
///   global.p2_bgm = audio_play_sound(snd_YENI, 1, true);
/// battle_turn_20 zaten global.p2_bgm uzerinden fade yapiyor (satir 1787+),
/// yani yeni parca da ayni degiskene atanmali.
function Difficulty_Faz2Muzik()
{
	// if (Difficulty_Easy()) { return snd_papyrus_easy_theme; }
	return snd_p2theme;
}
