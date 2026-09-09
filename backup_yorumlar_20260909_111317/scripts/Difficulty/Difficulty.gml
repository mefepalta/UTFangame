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
///   faz 2 t16-19 NORMAL'de kaliyor. EASY'de bu zincir tamamen cikarildi,
///                yerine Papyrus atak zinciri (battle_turn_28) geldi.
///   faz 2 t20    P25Baslat() burada cagriliyor; olmazsa faz 2 bitmiyor.
///                NORMAL'de listede. EASY'de listede DEGIL -- cagriyi
///                battle_turn_28'in son turu yapiyor.
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
///   battle_turn_28 ARTIK VAR: EASY'ye ozel Papyrus "donen oda" atagi,
///   faz 2 listesinde t18 ile t19 arasinda.

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
		// EASY'DE FAZ 2'NIN IKINCI YARISI TAMAMEN DEGISTI.
		//
		// t15 icindeki {revive 1} Papyrus'u sahneye sokuyor; o andan itibaren
		// orijinal t16-t20 zinciri (karakterlerin girip cikmasi, Alphys solosu,
		// uclu final) OYNAMIYOR. Yerine CYF modundan cevrilen Papyrus ataklari
		// sirayla geliyor -- hepsi ayni objede, battle_turn_28.
		//
		// DIKKAT: t20 listede olmadigi icin P25Baslat() ARTIK ORADAN
		// CAGRILMIYOR. Zincirin SON turu (Difficulty_PapyrusSonAtak) onu kendisi
		// cagiriyor; o cagri kalkarsa faz 2 hic bitmez.
		if (_d == DIFFICULTY_EASY)
		{
			var _pap = Difficulty_PapyrusAtakSirasi();
			var _liste = [1, 8, 15];
			for (var _pi = 0; _pi < array_length(_pap); _pi++) { array_push(_liste,28); }
			return _liste;
		}
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

/// @desc EASY faz 2'de Papyrus'un oynayacagi CYF ataklarinin SIRASI.
///
/// Degerler kaynak modun atak numaralari (Lua/Waves/txt.lua, atkem == N).
/// Yeni bir atak cevrildikce buraya sirasina konuyor; listenin SON elemani
/// fazin finali oluyor ve o turun sonunda P25Baslat() cagriliyor.
///
/// Modun en uzun/zor atagi 10 numara; cevrildiginde bu listenin SONUNA
/// konulacak (final atagi o olacak). Liste sadece CEVRILMIS ataklari
/// icermeli: burada olup battle_turn_28'de karsiligi olmayan bir numara
/// turu bos gecirir.
function Difficulty_PapyrusAtakSirasi()
{
	return [1, 2, 4, 7, 10];
}

/// @desc Verilen tur sayacinin hangi CYF atagina denk geldigi. Papyrus
/// zincirinde degilse 0.
function Difficulty_PapyrusAtakNo(_sayac)
{
	var _n = Difficulty_PapyrusKacinci(_sayac);
	if (_n <= 0) { return 0; }

	var _sira = Difficulty_PapyrusAtakSirasi();
	if (_n > array_length(_sira)) { _n = array_length(_sira); }
	return _sira[_n-1];
}

/// @desc Sayac, Papyrus zincirinin kacinci turu (1 tabanli, degilse 0).
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

/// @desc Bu tur Papyrus zincirinin SONUNCUSU mu? Faz 2'yi bitiren tur o.
function Difficulty_PapyrusSonAtak(_sayac)
{
	var _n = Difficulty_PapyrusKacinci(_sayac);
	return (_n >= array_length(Difficulty_PapyrusAtakSirasi()));
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

/// @desc Zorluga gore alinan hasari duzeltir. Negatif deger iyilestirme,
/// dokunulmuyor.
///
///   EASY   -> hasar sabit 1 (easy_dmg4 bayragi acikken 4).
///   NORMAL -> FAZ 2'de (room_battle_1) her atak DMG_FAZ2_NORMAL_INDIRIM kadar
///             daha az vuruyor, DMG_FAZ2_NORMAL_TABAN'in altina inmeden.
///             Faz 1 (room_battle) aynen kaliyor.
///   HARD   -> dokunulmuyor.
///
/// Indirim neden burada: DMG_* makrolari iki fazda ORTAK, o yuzden makronun
/// kendisi dusurulemiyor. Butun mermi/isin yollari Player_Hurt'ten geciyor,
/// yani bu tek nokta faz 2'nin hepsini kapsiyor.
///
/// Cagiran: scripts/Player_Hurt.
function Difficulty_Hasar(_dmg)
{
	if (!is_real(_dmg)) { return _dmg; }
	if (_dmg <= 0)      { return _dmg; }

	var _d = Difficulty_Get();

	if (_d == DIFFICULTY_EASY)
	{
		// Faz 2 finalinde ("...if I just stopped being easy?") Papyrus artik
		// ciddi: hasar 1 yerine 4. Bayragi battle_turn_28 atak 10 aciyor.
		if (variable_global_exists("easy_dmg4") && global.easy_dmg4) { return 4; }
		return 1;
	}

	if ((_d == DIFFICULTY_NORMAL) && (room == room_battle_1))
	{
		return max(DMG_FAZ2_NORMAL_TABAN, _dmg - DMG_FAZ2_NORMAL_INDIRIM);
	}

	return _dmg;
}

/// @desc EASY'de KR tamamen kapali (hasar zaten 1'e sabit).
/// global.kr faz 2'de zaten false; EASY bunu faz 1'e de yayiyor.
///
/// Cagiran: objects/battle_enemy_engage/Step_0.
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

/// @desc Metnin sonundaki BOS kutuyu onler. Son {clear}'den sonra gorunur
/// metin yoksa o {clear}'i (ve hemen onundeki {pause}'u) siler; sonrasindaki
/// komut etiketleri oldugu yerde kalir. EASY indirgemesi bu bos sayfayi
/// uretiyordu (bkz Difficulty_Indirge trailing {pause}{clear}).
function Difficulty_SonClearTemizle(_t)
{
	if (!is_string(_t)) { return _t; }
	var _n = string_length(_t);

	// en sondaki {clear} konumu
	var _ci = 0;
	var _i  = 1;
	while (_i <= _n-6)
	{
		if (string_copy(_t,_i,7) == "{clear}") { _ci = _i; _i += 7; }
		else { _i += 1; }
	}
	if (_ci == 0) { return _t; }

	// {clear} sonrasinda gorunur (etiket disi, bosluk disi) karakter var mi?
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
	if (_gorunur) { return _t; }   // son kutuda gercek metin var, dokunma

	var _once = string_copy(_t,1,_ci-1);
	if ((string_length(_once) >= 7) && (string_copy(_once,string_length(_once)-6,7) == "{pause}"))
	{
		_once = string_copy(_once,1,string_length(_once)-7);
	}
	return _once + _sonra;
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

	// {easy_raw} ONEKI: sahne tamamen elle yazilmis (t8, t28 ataklari). Hicbir
	// indirgeme/override uygulanmadan aynen oynatiliyor, sadece sondaki bos
	// kutu temizleniyor. Faz 2'nin ozel EASY diyaloglari bu yolla gidiyor.
	if (string_copy(_t,1,10) == "{easy_raw}")
	{
		return Difficulty_SonClearTemizle(string_delete(_t,1,10));
	}

	// Faz 2'de metin TEK string icinde konusmaci degistiriyor, o yuzden once
	// parcalaniyor. Butun stringe tek konusmaci atamak Sans repliklerini
	// ayakta birakiyordu.
	var _tur = -1;
	if ((room == room_battle_1) && instance_exists(battle))
	{
		_tur = Difficulty_MapTurn(Battle_GetTurnNumber());
	}

	var _parca   = Difficulty_Parcala(_t);
	var _out     = "";
	var _kacinci = [0,0,0];      // konusmaci basina kutu sayaci

	for (var _i = 0; _i < array_length(_parca); _i++)
	{
		var _seg = _parca[_i];
		var _kon = Difficulty_Konusmaci(_seg);

		// EASY'ye ozel faz 2 repligi varsa o parcanin yerine geciyor.
		// Ayni turda ayni konusmacinin birden fazla kutusu olabiliyor (t8'de
		// Alphys iki kez konusuyor), o yuzden kacinci oldugu da geciriliyor.
		_kacinci[_kon] += 1;
		var _ovr = (_tur >= 0) ? Difficulty_Faz2Metin(_tur, _kon, _kacinci[_kon]) : "";
		if (_ovr != "") { _out += _ovr; continue; }

		// Susan sadece Sans; Papyrus ve Alphys aynen konusuyor.
		if (_kon != 0)  { _out += _seg; continue; }

		_out += Difficulty_Indirge(_seg, true, false);
	}

	return Difficulty_SonClearTemizle(_out);
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

	return Difficulty_SonClearTemizle(Difficulty_Indirge(_t, false, (string_pos("* ", _t) > 0)));
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

/// @desc EASY'ye ozel faz 2 replikleri.
///
/// Fikir: oyuncu kolay modu sectigi icin Papyrus ve Alphys ona "meta" laf
/// sokuyor. Bos string donerse orijinal replik oynar.
///
/// _tur       GERCEK battle_turn numarasi (sayac degil; Difficulty_MapTurn'den
///            gecmis hali). EASY faz 2 listesi: 1, 8, 15 ve ardindan Papyrus
///            zinciri (hepsi 28). battle_turn_28 kendi metnini Other_10'da
///            tuttugu icin buradan override edilmesi gerekmiyor.
/// _konusmaci 0 Sans, 1 Papyrus, 2 Alphys.
/// _kacinci   Ayni turda o konusmacinin KACINCI kutusu (1 tabanli). t8'de
///            Alphys iki ayri kutuda konusuyor; ikisine ayri metin verilebilsin
///            diye ayrildi.
///
/// Bicim, orijinal repliklerle ayni:
///   Papyrus -> "{speaker 1}{font 4}{voice 4}{pap_head 1}METIN{pause}{clear}"
///   Alphys  -> "{speaker 2}{font 2}{voice 2}{alp_head 1}METIN{pause}{clear}"
/// Satir sonu &, kutu sonu {pause}{clear}. Satir en fazla ~544 px.
function Difficulty_Faz2Metin(_tur, _konusmaci, _kacinci)
{
	// EASY faz 2'nin butun ozel diyaloglari artik sahne dosyalarinda {easy_raw}
	// ile tam yazili (t8/t28). Bu per-konusmaci override kullanilmiyor; "" =
	// orijinal replik (EASY'de Sans yine "..."a indirgenir).
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

/// @desc battle_turn_28'in (EASY Papyrus atagi) calacagi parca.
///
/// Projeye "snd_papyrus_easy" adinda bir ses eklenirse otomatik olarak o
/// kullaniliyor; yoksa projede kayitli ama hicbir yerde calmayan
/// snd_glisterbones'a duserek derlemeyi kirmiyor. Yani ozel parcayi eklemek icin bu dosyaya
/// dokunmaya gerek yok, sadece asseti "snd_papyrus_easy" adiyla ekle.
function Difficulty_PapyrusMuzik()
{
	var _s = asset_get_index("snd_papyrus_easy");
	if ((_s != -1) && audio_exists(_s)) { return _s; }
	return snd_glisterbones;
}

/// @desc Faz 2 muzigini Papyrus'un parcasiyla degistirir.
///
/// battle_turn_28/Other_10'dan cagriliyor ve turun sonunda GERI ALINMIYOR:
/// t28'den sonrasi (t19, t20) da bu parcayla oynuyor. battle_turn_20 fade'i
/// zaten global.p2_bgm uzerinden yaptigi icin ekstra bir sey gerekmiyor.
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
