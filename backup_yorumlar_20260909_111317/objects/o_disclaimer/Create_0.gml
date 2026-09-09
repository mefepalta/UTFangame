/// EASY MODU DISCLAIMER -- menude EASY secilip Play'e basilinca, oyuna
/// gecmeden ONCE cikan kaydirilabilir dev metin duvari. Asagi ok / fare
/// tekerlegi / sag kenardaki scrollbar ile kaydirilir; en dibe inilince
/// CONTINUE aktiflesir (Z ya da tiklama) ve oyuna geciliyor.
///
/// o_other'daki acilis disclaimer'indan AYRI; o statik ve sadece Z ile.
/// Hedef oda room_area_beforesans (menudeki normal Play hedefi).

depth = -1000;

hedef_oda = room_area_beforesans;

baslik = "EASY MODE - TERMS OF SERVICE";

// METIN DUVARI (TASLAK -- serbestce duzenle). Her eleman bir kaynak satir;
// asagida ekran genisligine gore otomatik olarak sarmalaniyor, yani uzun
// satir yazmak yerlesimi bozmuyor.
metin = [
	"By selecting EASY MODE and pressing PLAY, you (hereinafter",
	"\"the COWARD\", \"the TWERP\", or \"the LEGALLY LIABLE PARTY\")",
	"agree to the following terms in full, without exception,",
	"and without the option to click away like you clicked away",
	"from every actual challenge this game had to offer.",
	"",
	"SECTION 1 - ADMISSION OF GUILT",
	"1.1  You admit that you have chosen the path of least",
	"     resistance.",
	"1.2  You admit that somewhere, a version of you that picked",
	"     NORMAL is deeply, profoundly disappointed.",
	"1.3  You admit that Papyrus will be informed of your choice",
	"     and reserves the right to comment on it. Repeatedly.",
	"",
	"SECTION 2 - THE MUSIC SESSION",
	"2.1  At a time of PAPYRUS's choosing, the game may take a",
	"     break to play you some music.",
	"2.2  During said break, your cursor may be borrowed. It will",
	"     be returned. Probably. In roughly the same condition.",
	"2.3  You waive any right to Alt+Tab, Alt+F4, or otherwise",
	"     leaving. The exit is a suggestion, not a promise.",
	"2.4  Ctrl+Alt+Del remains available because we are cowards",
	"     too, and also because Windows would not let us.",
	"",
	"SECTION 3 - HEALING ITEMS",
	"3.1  All items have been converted to MaxHeal for your",
	"     comfort.",
	"3.2  The Mefe Gods bless every bite. Their blessing is real.",
	"3.3  Their blessing may also be a lie. Both can be true.",
	"     This is called EASY MODE.",
	"",
	"SECTION 4 - DAMAGE, DIFFICULTY, AND DIGNITY",
	"4.1  Attacks deal 1 damage. This is not mercy. This is pity.",
	"4.2  Management reserves the right to stop being easy at any",
	"     moment it finds narratively convenient.",
	"4.3  Your dignity is not covered under this agreement and was",
	"     forfeited at the difficulty select screen.",
	"",
	"SECTION 5 - LIABILITY",
	"5.1  We are not responsible for hurt feelings, bruised egos,",
	"     or the creeping suspicion that you could have done this",
	"     the hard way.",
	"5.2  We are not affiliated with, endorsed by, or on speaking",
	"     terms with Toby Fox.",
	"5.3  UNDERTALE and DELTARUNE belong to Toby Fox. Everything",
	"     embarrassing here belongs to you.",
	"",
	"SECTION 6 - THE FINE PRINT'S FINE PRINT",
	"6.1  Yes, you have to scroll all the way down.",
	"6.2  Yes, this is the joke.",
	"6.3  No, there is no NORMAL button hidden at the bottom.",
	"6.4  Keep going.",
	"6.5  A little more.",
	"6.6  There it is.",
	"",
	"By accepting below, you accept all of the above, acknowledge",
	"that you read none of it, and proceed anyway - exactly the",
	"energy that got you to EASY MODE in the first place.",
	""
];

// ---------------------------------------------------------------------------
// YERLESIM
// Oda 640x480 ve views kapali, yani ciziim koordinatlari = ekran koordinatlari.
// Font BOYUTU onemli: font_determination_mono 40 punto, bu ekranda satirlar
// hem ust uste biner hem de sagdan tasar. Govde icin oyunun diyalog fontu
// (font_determination_mono_3, 20 punto) kullaniliyor.
// ---------------------------------------------------------------------------
font_body   = font_determination_mono_2;
font_title  = font_determination_mono_1;

KENAR_SOL   = 44;
METIN_GEN   = 500;                  // sarmalama genisligi (44 -> 544)
BAR_X       = 572;                  // scrollbar merkezi
VP_UST      = 76;                   // metin alaninin ust siniri (baslik altinda)
VP_ALT      = 420;                  // alt siniri (alt seritin ustunde)

draw_set_font(font_body);
LINE_H = max(16, string_height("Ay"));

// --- Otomatik satir sarmalama -------------------------------------------
// Kaynak satiri METIN_GEN pikseline sigacak sekilde boler; girinti korunur.
wrap_line = function(_s, _maxw)
{
	var _res = [];
	if (string_width(_s) <= _maxw) { array_push(_res, _s); return _res; }

	// "1.1  ..." gibi satirlarin devami ayni hizada dursun
	var _ind = "";
	var _p   = 1;
	var _n   = string_length(_s);
	while ((_p <= _n) && (string_char_at(_s, _p) == " ")) { _ind += " "; _p++; }
	if (string_width(_ind) > _maxw * 0.5) { _ind = ""; }

	var _body = string_delete(_s, 1, _p - 1);
	var _cur  = _ind;
	var _word = "";
	var _bn   = string_length(_body);

	for (var _i = 1; _i <= _bn + 1; _i++)
	{
		var _c = (_i <= _bn) ? string_char_at(_body, _i) : " ";
		if (_c != " ") { _word += _c; continue; }
		if (_word == "") { continue; }

		var _try = (_cur == _ind) ? (_cur + _word) : (_cur + " " + _word);
		if (string_width(_try) <= _maxw)
		{
			_cur = _try;
		}
		else
		{
			array_push(_res, _cur);
			_cur = _ind + _word;
		}
		_word = "";
	}

	array_push(_res, _cur);
	return _res;
};

satir = [];
for (var _i = 0; _i < array_length(metin); _i++)
{
	var _parca = wrap_line(metin[_i], METIN_GEN);
	for (var _j = 0; _j < array_length(_parca); _j++) { array_push(satir, _parca[_j]); }
}

// --- Kaydirma / dugme olculeri -------------------------------------------
btn_w  = 240;
btn_h  = 36;
BTN_UST_BOSLUK = 22;                 // son satir ile dugme arasi
BTN_ALT_BOSLUK = 26;                 // dugmeden sonraki bos alan

icerik_h = array_length(satir) * LINE_H;
vp_h     = VP_ALT - VP_UST;
kaydir_max = max(0, icerik_h + BTN_UST_BOSLUK + btn_h + BTN_ALT_BOSLUK - vp_h);

kaydir       = 0;   // ekranda gorunen (yumusatilmis) kaydirma
kaydir_hedef = 0;   // girdinin yazdigi hedef

// Dugme dikdortgeni (Step her karede gunceller; Draw ilk karede de okuyabilsin)
btn_x1 = 0; btn_y1 = 0; btn_x2 = 0; btn_y2 = 0;
btn_hover = false;

// Sona kadar inilmeden CONTINUE aktiflesmiyor -- sakanin tamami bu.
dibe_indi = (kaydir_max <= 0);
yanip     = 0;

// Scrollbar surukleme durumu
bar_tutuluyor = false;
bar_tut_ofs   = 0;

// Odaya girerken fare/Z zaten basili olabilir (menuden gelen tus): ilk kare
// basili sayilsin ki kenar-tetik hemen ateslemesin.
fare_onceki = true;
