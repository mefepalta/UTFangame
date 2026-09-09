/// EASY MODU DISCLAIMER -- menude EASY secilip Play'e basilinca, oyuna
/// gecmeden ONCE cikan kaydirilabilir dev metin duvari. Fare tekerlegi + sag
/// kenardaki scrollbar (surukle) ile kaydirilir; en alttaki CONTINUE dugmesine
/// tiklayinca (yani sona kadar kaydirinca) oyuna geciliyor.
///
/// o_other'daki acilis disclaimer'indan AYRI; o statik ve Z ile, bu kaydirmali
/// ve fare ile. Hedef oda room_area_beforesans (menudeki normal Play hedefi).

depth = -1000;

hedef_oda = room_area_beforesans;

baslik = "EASY MODE - TERMS OF SERVICE";

// METIN DUVARI (TASLAK -- serbestce duzenle). Her eleman bir satir.
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
	"By clicking CONTINUE below, you accept all of the above,",
	"acknowledge that you read none of it, and proceed anyway -",
	"exactly the energy that got you to EASY MODE in the first",
	"place.",
	""
];

// Yerlesim
font_body   = font_determination_mono;   // okunakli mono
LINE_H      = 20;
VP_UST      = 74;    // metin alaninin ust siniri (baslik altinda)
VP_ALT      = 430;   // alt siniri (prompt ustunde)
KENAR_SOL   = 40;
KENAR_SAG   = 570;   // metin sag siniri (scrollbar solunda)

kaydir     = 0;      // dikey kaydirma (px)
_icerik_h  = array_length(metin) * LINE_H;
_vp_h      = VP_ALT - VP_UST;

// CONTINUE dugmesi metnin en altinda; icerik uzayina gore konumu Draw'da.
btn_w = 200;
btn_h = 34;

// Scrollbar surukleme durumu
bar_tutuluyor = false;
bar_tut_ofs   = 0;

// Fare tiklama kenar-tetik (basili tutma degil, tek tik)
_fare_onceki = false;
