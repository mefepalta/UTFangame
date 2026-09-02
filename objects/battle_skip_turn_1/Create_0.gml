_timer=0;
_start=false;
cang=false;
canga=0;
global.checkornot = false;

// Mizrak kutunun ve kalbin ONUNE cizilsin (DEPTH_BATTLE: kucuk = onde).
depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

//==========================================================================
// MERHAMET CEZASI -- MIZRAK (faz 1)
// Sans merhameti hakaret sayiyor ve tek darbede bitiriyor.
//
// SAHNE IKI KONSEPT GIF'INDEN BIREBIR OLCULDU
//
//   A) New_Piskel_1.gif        -- DONUSUM. 33 kare, 12.5 fps, ic
//      cozunurluk 200x200 (1000x1000 icinde 5x). Sans mizragi savuruyor,
//      mizrak birakiliyor ve YERINDE donerek dikey konuma oturuyor.
//      (Masaustundeki Sans_Spear_Transition.gif bunun birebir kopyasi.)
//
//   B) Sans_Phase2_Stab.gif    -- DARBE. 20 kare, 12.5 fps, ic cozunurluk
//      129x129 (1032x1032 icinde 8x). Mizrak asili duruyor, YUKARI
//      FIRLIYOR, tepede bekliyor ve tek karede asagi iniyor.
//
//   Oyun 30 fps => 1 gif karesi = 2.4 adim. Iki gif'in ortak capasi
//   Sans'in gozu; ikisinde de mizrak goze gore ayni yerde duruyor
//   (A: goz merkezine gore -19,-27 / B: -19,-31).
//
// A'DAN OLCULENLER
//   f1-16  Sans bosta / gerilme (oyunun kendi rig'i yapiyor)
//   f17    SAVURMA -- elindeki mizrak bulanik kareye donuyor
//   f18-23 mizrak birakildi, TAM SABIT duruyor (agirlik merkezi f19-f23
//          boyunca birebir ayni: 96.93,117.09). Bu arada Sans siliniyor.
//   f23-30 mizrak YERINDE donuyor. Acilar (fill maskesinin ana ekseni):
//            154.00 155.09 156.60 180.53 265.55 268.01 269.26 270.00
//          Sanatci f26'ya kadar _up'i, f27'den sonra _vert'i dondurmus.
//   MIZRAK HIC YOL ALMIYOR -- eski surumdeki "elden kalbe ucus" yanlisti.
//
// B'DEN OLCULENLER (sablon eslesmesi, hepsi %100 tutuyor)
//   f1-6   _vert  kare (52,10)      asili duruyor, 1 px salinim
//   f7     _vert  kare (52, 0)      yukari cekiliyor (uc 10 px yukari)
//   f8-19  _imp   kare (50,4)->(50,0)  mizrak firladi, tepede kalan
//                                   on-kisaltilmis sekil; 4 px oturuyor
//   f20    _stab  kare (49,19)      DARBE: tek karede iniyor, uc asili
//                                   konumdan 9 px asagida
//   Yani "mizrak uste kalkinca" gorunen sey s_sans_spear_impact, son
//   kare ise s_sans_spear_stab.
//
// OLCEK
//   Gif'ler 1x, oyun HER SEYI 2x ciziyor (engage/Draw_0 mizragi 2,2 ile).
//   Dikey mizrak 24x108 => ekranda 48x216, Sans'la ayni boy: gif'teki
//   orantinin aynisi.
//
// SPRITELAR (s_sans_spearstab sayfasindan ayrildi)
//   s_sans_spear_swing  99x53   origin 49,26  savurma (elde, spr_spearp1 yerine)
//   s_sans_spear_up     99x53   origin 48,24  capraz mizrak (donme pivotu)
//   s_sans_spear_vert   24x108  origin 12,56  dikey mizrak, ucu ASAGI
//   s_sans_spear_stab   30x108  origin 16,56  hiz cizgili darbe (ucu vert ile hizali)
//   s_sans_spear_impact 29x20   origin 14,0   mizrak tepedeyken gorunen sekil
//   s_sans_spear_eye    29x11   origin 21,6   Sans'tan geriye kalan gozler
//==========================================================================

// ---- zamanlama (adim) -------------------------------------------------
#macro SAP_KUTU        5	/// kutu kuculuyor + arka plan solmaya basliyor
#macro SAP_KUTU_SURE  45
#macro SAP_KUTU_YARI  10	/// kuculdugunde kutunun yari genisligi (kalp 16x16)
/// Arka planin kaybolma suresi. MERCY'E BASILDIGI AN basliyor (Other_10 =
/// tur hazirligi), _timer'a bagli DEGIL: _timer ancak Sans'in uzun repligi
/// bitince islemeye basliyor, oysa istenen sey konusma boyunca da solmasi.
#macro SAP_BG_SURE   120
/// EMNIYET: oyuncu diyalogu X/Z ile spamleyip aninda gecerse yukaridaki
/// sure yetismiyor. Tur basladiktan sonra arka plan, mizrak birakilana
/// kadar HER HALUKARDA tamamen kayboluyor.
#macro SAP_BG_TUR     44

/// A bolumunu (savurma + donme + Sans'in silinmesi) YAVASLATMA carpani.
/// Gif 12.5 fps, oyun 30 fps => dogal oran 2.4 adim/kare. Bu carpanla
/// 2.4*1.6 = 3.84 adim/kare oluyor: hareket ayni, sadece daha uzun.
/// Sadece A'yi etkiliyor -- B (son darbe) oldugu gibi kaliyor.
#macro SAP_YAVAS     1.6

#macro SAP_SAVUR      40	/// A f17: Sans savuruyor
#macro SAP_BIRAK      44	/// A f18: mizrak birakildi (buradan sonra sabit)
#macro SAP_BAS        90	/// A f30: dikey konuma oturdu (44 + 28.8*1.6)

#macro SAP_CEK       120	/// B f7 : yukari cekiliyor
#macro SAP_UST       123	/// B f8 : firladi, tepedeki sekil
#macro SAP_VUR       152	/// B f20: DARBE -- inen mizrak sprite'i beliriyor
#macro SAP_OLUM      172	/// olum. Darbeden 20 adim (0.67 sn) SONRA: yoksa
							/// oyuncu inen mizragi goremeden olum ekranina
							/// geciyordu.
#macro SAP_SON       200	/// mizrak soluyor
#macro SAP_BITIS     225	/// emniyet: oyuncu olmediyse tur yine de bitsin

// ---- gorsel olculer ---------------------------------------------------
#macro SAP_OLCEK       2	/// oyunun her yerde kullandigi cizim olcegi
#macro SAP_DON_ILK   154	/// s_sans_spear_up'in dogal acisi (ucu sol-ust)
#macro SAP_DON_SON   270	/// s_sans_spear_vert'in dogal acisi (ucu asagi)
#macro SAP_DON_ESIK  225	/// bu acinin altinda _up, ustunde _vert ciziliyor

/// Dikey/darbe sprite'inda mizragin UCUNUN cizim noktasina gore ofseti.
/// vert : uc (11,107), origin (12,56) => (-1,+51) -> 2x ile (-2,+102)
/// stab : uc (15,107), origin (16,56) => (-1,+51) -> ayni. Origin'ler bu
/// esitligi saglayacak sekilde secildi, iki sprite arasinda uc oynamiyor.
#macro SAP_UC_OFS_X   -2
#macro SAP_UC_OFS_Y  102

/// Ucun KALBE gore y farki. A gif'inde mizrak Sans'in gozune gore
/// konumlaniyor; oyunun rig'inde bu nokta kalbin 6 px altina dusuyor.
#macro SAP_UC_DUR      6	/// asili duruyor            (B f1-f6)
#macro SAP_UC_GERI   -14	/// yukari cekilmis          (B f7,  -20 px)
#macro SAP_UC_SAP     24	/// darbe indi               (B f20, +18 px)

/// Tepedeki seklin cizim noktasi, dikey mizragin pivotuna gore.
/// B: _imp pivotu (64,1), _vert pivotu (64,66) -> 65 px yukarida (2x=130).
#macro SAP_UST_Y     130
#macro SAP_UST_OTUR    8	/// tepede 8 px (4 native) yukari oturuyor

// ---- A gif'inden olculen egriler --------------------------------------
/// [birakmadan sonraki adim, mizragin mutlak acisi]. f23 = 12.0 adim.
sap_don_tablo =
[
	[12.0,154.00],	/// f23
	[14.4,155.09],	/// f24
	[16.8,156.60],	/// f25
	[19.2,180.53],	/// f26 -- yatay, en hizli an
	[21.6,265.55],	/// f27
	[24.0,268.01],	/// f28
	[26.4,269.26],	/// f29
	[28.8,270.00],	/// f30 -- oturdu
];

/// [birakmadan sonraki adim, Sans'in gorunurlugu]. Gif'te siyah zemin
/// uzerinde karariyor; oyunda arkada gece gogu var, o yuzden KARARTMA
/// degil SAYDAMLASTIRMA yapiyoruz (istenen: "tamamen gorunmez olsun").
sap_sol_tablo =
[
	[ 0.0,1.00],	/// f18
	[ 4.8,0.60],	/// f20
	[ 9.6,0.23],	/// f22
	[12.0,0.00],	/// f23
];

sap_on = false;
sap_kip = 0;		/// 0 bekleme | 1 savurma | 2 donme | 3 mizrak sahnesi
sap_faz = 0;		/// 3. kip: 0 asili | 1 cekiliyor | 2 tepede | 3 darbe
sap_alpha = 0;
sap_x = 320;		/// kalbin konumu (darbe aninda kilitleniyor)
sap_y = 320;
sap_uc = SAP_UC_DUR;
sap_sars = 0;		/// cizimdeki titreme genligi (px)
sap_don = SAP_DON_ILK;
sap_goz = 0;		/// Sans'tan geriye kalan gozlerin alpha'si
sap_ust_o = 0;		/// tepedeki seklin oturma ilerlemesi (0..1)
sap_bg_on = false;	/// arka plan solmasi basladi mi (Other_10'da aciliyor)
sap_bg_t = 0;		/// Mercy'e basildigindan beri gecen adim
sap_bg_a = 1;		/// arka plana en son YAZILAN alpha (teshis icin)
sap_dbg_hedef = -1;	/// _head_alpha'ya en son YAZILAN deger (teshis icin)

/// TESHIS KATMANI. Ekrana canli deger yaziyor (Draw_0'in en basinda, tek
/// blok). Sans'in silinmeme sebebi bununla bulundu; kapali birakildi.
/// Tekrar lazim olursa sadece burayi true yapmak yetiyor.
#macro SAP_TESHIS false

/// Sans'in solmadan onceki alpha degerleri (SapSansAlpha ilk cagriida doldurur)
sap_kayit_var = false;
sap_k_head = 1; sap_k_legs = 1; sap_k_legs1 = 0;
sap_k_al = 1;   sap_k_ar = 1;   sap_k_al1 = 0;   sap_k_ar1 = 0;

///Sans'in gozunun ekran konumu. spr_sans_head 33x33, origin (16,30), 2x
///ciziliyor; sprite icinde parlayan goz (21.5,15.5) pikselinde duruyor:
///  kafa sol-ust = P-(32,60),  goz = P-(32,60)+(43,31) = P+(11,-29)
///s_sans_spear_eye'in origin'i de kendi yildizinin merkezi (21,6), yani
///bu noktaya cizilince gozler tam Sans'in gozunun ustune oturuyor.
SapGoz = function()
{
	if (!instance_exists(battle_enemy_engage)) { return { x : 320, y : 120 }; }
	var _ex, _ey;
	with (battle_enemy_engage)
	{
		_ex = x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2+11;
		_ey = y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2-29;
	}
	return { x : _ex, y : _ey };
};

///Dikey mizragin CIZIM noktasi: ucu kalbin _uc kadar altinda.
SapNokta = function(_uc)
{
	return { x : sap_x-SAP_UC_OFS_X, y : sap_y+_uc-SAP_UC_OFS_Y };
};

///Kalbi mizragin ustune yeniden cizer. Tur nesnesi BULLET_OUTSIDE_HIGH,
///ruh ise SOUL derinliginde; yani mizrak kalbin onunde kaliyor. Gif'te
///mizrak gozun ARKASINDAN geciyor, burada da kalbin arkasindan gecmeli.
SapKalp = function()
{
	if (!instance_exists(battle_soul)) { return; }
	draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
		battle_soul.x,battle_soul.y,
		battle_soul.image_xscale,battle_soul.image_yscale,
		battle_soul.image_angle,c_white,battle_soul.image_alpha);
};

///[adim,deger] tablosunda dogrusal ara deger.
SapTablo = function(_t,_tab)
{
	var _n = array_length(_tab);
	if (_t <= _tab[0][0])    { return _tab[0][1]; }
	if (_t >= _tab[_n-1][0]) { return _tab[_n-1][1]; }
	for (var i = 1; i < _n; i++)
	{
		if (_t <= _tab[i][0])
		{
			var _a = _tab[i-1], _b = _tab[i];
			return _a[1]+(_b[1]-_a[1])*((_t-_a[0])/(_b[0]-_a[0]));
		}
	}
	return _tab[_n-1][1];
};

///Sans'in cizilen butun parcalarinin alpha'sini _f ile olcekler.
///Bazi parcalar (ikincil kol/bacak sprite'lari) normalde zaten 0, o yuzden
///sabit deger atamiyoruz; ilk cagriida ORIJINALLERI saklayip carpiyoruz.
///Sans'in cizilen butun parcalarinin alpha'sini _f ile olcekler.
///
///Bazi parcalar (ikincil kol/bacak sprite'lari) normalde zaten 0, o yuzden
///sabit deger atamiyoruz; ilk cagriida ORIJINALLERI saklayip carpiyoruz.
///
///Bilerek `with` VE struct KULLANILMIYOR: dogrudan nokta erisimiyle
///yaziyoruz. `with (battle_enemy_engage) { other.kayit = { a : _head_alpha } }`
///seklindeki onceki hali, struct sabitinin icindeki degisken cozumlemesi
///belirsiz oldugu icin sessizce bos kayit birakabiliyordu -- sonuc: Sans
///hic silinmiyordu.
SapSansAlpha = function(_f)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	if (!sap_kayit_var)
	{
		// _spear_alpha BURADA YOK: mizrak birakildigi anda elden tamamen
		// kayboluyor, Sans'la birlikte solmuyor. Yoksa birakildiktan sonra
		// 12 adim boyunca CIFT mizrak gorunuyordu.
		sap_k_head  = battle_enemy_engage._head_alpha;
		sap_k_legs  = battle_enemy_engage._legs_alpha;
		sap_k_legs1 = battle_enemy_engage._legs_alpha1;
		sap_k_al    = battle_enemy_engage._armleft_alpha;
		sap_k_ar    = battle_enemy_engage._armright_alpha;
		sap_k_al1   = battle_enemy_engage._armleft_alpha1;
		sap_k_ar1   = battle_enemy_engage._armright_alpha1;
		sap_kayit_var = true;
	}
	// _head_alpha'yi TAM 0 YAPMIYORUZ.
	// o_sans_blockp1/Step_0, "_head_alpha == 0" durumunu "Sans gizlendi,
	// BLOKLAMA POZUNU goster" diye yorumluyor ve s_sans_block sprite'ini
	// image_alpha=1 ile ekrana basiyor -- yani Sans'i gizledigimiz anda
	// yerine komple baska bir Sans (mizragiyla birlikte) beliriyordu.
	// 0.001 gozle gorunmez ama o esitligi tetiklemiyor.
	// (Faz 1'de bu esitligi okuyan baska kod yok; o_sans_blockp2 ayri bir
	//  degiskene, p2_head_alpha'ya bakiyor.)
	var _h = sap_k_head * _f;
	if (_f < 1) { _h = max(_h,0.001); }
	battle_enemy_engage._head_alpha      = _h;
	battle_enemy_engage._legs_alpha      = sap_k_legs  * _f;
	battle_enemy_engage._legs_alpha1     = sap_k_legs1 * _f;
	battle_enemy_engage._armleft_alpha   = sap_k_al    * _f;
	battle_enemy_engage._armright_alpha  = sap_k_ar    * _f;
	battle_enemy_engage._armleft_alpha1  = sap_k_al1   * _f;
	battle_enemy_engage._armright_alpha1 = sap_k_ar1   * _f;
	sap_dbg_hedef = _h;					/// teshis: yazdigimiz deger

	// Emniyet kemeri: bloklama pozu bu sahnede kesinlikle gorunmemeli.
	// (Yukaridaki 0.001 zaten tetiklenmesini engelliyor; blockp1'in iki
	//  dalindan hicbiri calismadigi icin bu yazma da geri alinmiyor.)
	if (_f < 1) { with (o_sans_blockp1) { image_alpha = 0; } }
	// Govde de _head_alpha ile ciziliyor, ayrica _body_alpha'yi da
	// dusuruyoruz ki baska bir kod onu okursa tutarli olsun.
	battle_enemy_engage._body_alpha      = _f;
};

///Arka planin solmasini her adim ilerletir. SapAdim'dan AYRI: bu, tur
///hazirligindan (Mercy'e basildigi andan) itibaren isliyor, _timer'i
///beklemiyor.
SapBgAdim = function()
{
	if (!sap_bg_on) { return; }
	sap_bg_t++;
	// 1) Mercy'e basildigindan beri yavas solma
	var _a = 1-clamp(sap_bg_t/SAP_BG_SURE,0,1);
	// 2) Emniyet: diyalog hizla gecilirse yukaridaki yetismez; tur
	//    basladiktan sonra mizrak birakilana kadar kesin bitiyor.
	_a = min(_a,1-clamp(_timer/SAP_BG_TUR,0,1));
	sap_bg_a = _a;
	with (o_phase_bg) { alpha = _a; }
};

///Sahneyi baslatir: kutu kalbin boyutuna kuculuyor.
SapBasla = function()
{
	sap_on = true;
	sap_kip = 0;
	sap_faz = 0;
	sap_alpha = 1;
	sap_uc = SAP_UC_DUR;
	sap_sars = 0;
	// Kutu tam kalbin boyutuna iniyor: kacacak yer kalmiyor.
	Battle_SetBoardSizeCubic(SAP_KUTU_YARI,SAP_KUTU_YARI,SAP_KUTU_YARI,SAP_KUTU_YARI,
		SAP_KUTU_SURE);
	audio_play_sound(snd_pullback,3,false);
};

///A f17: Sans savuruyor. Elindeki mizrak sprite'i bulanik kareyle
///degistiriliyor -- engage kendi Draw'inda dogru yerde, dogru acida ve
///2x olcekte ciziyor.
SapSavur = function()
{
	sap_kip = 1;
	with (battle_enemy_engage) { _spear_sprite = s_sans_spear_swing; }
	audio_play_sound(snd_swift,3,false);
};

///A f18: mizrak birakildi. Elindeki kopya gizleniyor; mizrak artik bu
///nesne tarafindan, DURACAGI YERDE ciziliyor (gif'te de yol almiyor;
///Sans'in eli ile bu nokta zaten ~17 px yakin).
SapBirak = function()
{
	sap_kip = 2;
	sap_don = SAP_DON_ILK;
	// Elindeki kopya aninda kayboluyor; mizragi artik bu nesne ciziyor.
	with (battle_enemy_engage) { _spear_alpha = 0; }
	audio_play_sound(snd_pullback,3,false);
};

///A f30: dikey konuma oturdu, buradan sonrasi B gif'i.
SapOtur = function()
{
	sap_kip = 3;
	sap_faz = 0;
	sap_don = SAP_DON_SON;
	audio_play_sound(snd_impact,3,false);
	Camera_Shake(4,4,3,3);
};

///Her adim. _t turun sayaci.
SapAdim = function(_t)
{
	if (!sap_on) { return; }

	// Sans f18'de silinmeye basliyor ve BIR DAHA geri gelmiyor.
	// Bu blok kasten kip kontrolunun DISINDA ve her adim calisiyor:
	// sadece donme fazinda uygulaninca, sonrasinda baska bir kod
	// alpha'lari 1'e cekerse Sans geri beliriyordu.
	if (_t >= SAP_BIRAK) and (instance_exists(battle_enemy_engage))
	{
		var _gor = SapTablo((_t-SAP_BIRAK)/SAP_YAVAS,sap_sol_tablo);
		SapSansAlpha(_gor);
		sap_goz = 0.8*(1-_gor);
		// Elindeki mizrak kopyasi da her adim gizli tutuluyor.
		battle_enemy_engage._spear_alpha = 0;
	}

	// Mizrak kalbin uzerinde duruyor; darbe inene kadar onu takip ediyor,
	// sonra konum KILITLENIYOR.
	if (_t < SAP_VUR) and (instance_exists(battle_soul))
	{
		sap_x = battle_soul.x;
		sap_y = battle_soul.y;
	}

	if (sap_kip <= 1) { return; }

	//------------------------------------------------ A: yerinde donme
	if (sap_kip == 2)
	{
		// (Sans'in silinmesi ve gozler yukarida, her adim isleniyor.)
		sap_don = SapTablo((_t-SAP_BIRAK)/SAP_YAVAS,sap_don_tablo);
		return;
	}
	if (sap_kip != 3) { return; }

	//------------------------------------------------ B: darbe sahnesi
	if (_t > SAP_SON) { sap_alpha = max(0,sap_alpha-0.04); }
	else { sap_alpha = 1; }

	if (_t < SAP_CEK)
	{
		// B f1-f6: asili duruyor, hafifce titriyor.
		sap_faz = 0;
		sap_uc = SAP_UC_DUR;
		sap_sars = 1;
	}
	else if (_t < SAP_UST)
	{
		// B f7: yukari cekiliyor.
		sap_faz = 1;
		var _o = (_t-SAP_CEK)/max(1,SAP_UST-SAP_CEK);
		sap_uc = SAP_UC_DUR+(SAP_UC_GERI-SAP_UC_DUR)*_o;
		sap_sars = 2;
	}
	else if (_t < SAP_VUR)
	{
		// B f8-f19: mizrak firladi. Tepede on-kisaltilmis sekil duruyor ve
		// 8 px yukari oturuyor. Bekleyis boyunca gerilim artiyor.
		sap_faz = 2;
		var _o = clamp((_t-SAP_UST)/12,0,1);
		sap_ust_o = _o;
		var _g = (_t-SAP_UST)/max(1,SAP_VUR-SAP_UST);
		sap_sars = 1+_g*3;
		if ((_t mod 6) == 0) { Camera_Shake(1+_g*3,1+_g*3,2,2); }
	}
	else
	{
		// B f20: darbe indi.
		sap_faz = 3;
		sap_uc = SAP_UC_SAP;
		sap_sars = 0;
	}
};

///Darbenin CARPMA ani (SAP_VUR): ses ve sarsinti. Oldurmuyor -- inen
///mizrak sprite'inin ekranda kalmasi icin olum SAP_OLUM'a birakildi.
SapCarp = function()
{
	audio_play_sound(snd_smash_impact,4,false);
	audio_play_sound(snd_bighit,4,false);
	Camera_Shake(14,14,6,6,4,4,0.3,0.3);
};

///OLUM ani (SAP_OLUM): tek darbede oldurur.
///Normal oldurucu vurusla ayni yoldan gidiyor -- cani 1'e cekip HURT
///olayini cagiriyoruz, Player_Hurt(4) onu 0'a indiriyor. Boylece olum
///makinasinin tamami (ses, sarsinti, oyun sonu) kendiliginden isliyor.
///KR yolu burada KULLANILMIYOR: bu vurusun kesin oldurmesi gerekiyor.
SapVur = function()
{
	Player_SetHp(1);
	Battle_CallSoulEventHurt();
};

///Sans'i, mizragini ve arka plani eski haline dondurur
///(oyuncu olmeden tur biterse).
SapTemizle = function()
{
	// Arka plan, mizrak sahnesi hic baslamamis olsa bile geri gelmeli:
	// solma Mercy'ye basildigi anda, sap_on'dan once basliyor.
	if (sap_bg_on) { with (o_phase_bg) { alpha = 1; } }
	if (!sap_on) { return; }
	if (sap_kayit_var) { SapSansAlpha(1); }
	with (battle_enemy_engage)
	{
		_spear_alpha = 1;
		_spear_sprite = spr_spearp1;
	}
	with (o_phase_bg) { alpha = 1; }
};
