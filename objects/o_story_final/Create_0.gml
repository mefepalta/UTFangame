///@desc FINAL HIKAYE -- son panel dizisi
//==========================================================================
// Savasin bitisinden sonraki kapanis sahnesi ("final_story_taslak.png").
//
//   1  end_frame_1  -> uzerine arka plani kaldirilmis end_frame_1_5 (ayak)
//                     sag alta denk gelecek sekilde SONRADAN beliriyor
//   2  end_frame_2  -> patikada end_frame_2_5'in iki figuru sirayla
//                     beliriyor; ikincisi gelirken ilki kayboluyor
//   3  unknown      -> tek basina
//   4  end_frame_3  -> uzerinde end_frame_3_5 (agaclar) saga kayip
//                     aradaki bosluk Sans'in uzerine gelince duruyor
//   5  big_long_ending_panel4_2 -> uzerine 4_4 -> Sans'in agzinda 4_6
//                     (nefes) buyuyup saydamlasiyor, sonra 4_2 geri geliyor.
//                     Bu paneller ekranin SAG KENARINA tam sigiyor.
//   6  end_frame_7_3/7_6/7_9 -> ILK METINLER burada
//   7  siyah ekran ("a short pause")
//   8  end_frame_8_2 -> KALAN METINLERIN TAMAMI burada. Konusma bitince
//      8_4 / 8_6 / 8_8 metinsiz oynuyor (Sans yok olurken konusmuyor).
//      Sonra muzigin bitmesi beklenip toz sesi caliyor ve room_credits.
//
// GECISLER: butun bolum ve alt panel gecisleri SIYAH PERDEDEN geciyor
// (once kararir, sonra acilir). Boylece ne ani gecis oluyor ne de saydam
// paneller birbirinin icinden gorunuyor.
//
// Metinler oyuncu girdisi BEKLEMIYOR; perde inik/kalkarken metin akmiyor.
//==========================================================================

depth = 0;

//------------------------------------------------------------ global perde
// Bu sahneye SIYAHTAN geliniyor: o_p25_battle perdeyi 180 karede tam
// siyaha cekip odayi degistiriyor ve KALICI fader nesnesi o alfayi
// koruyor. Bu odada onu indiren hicbir sey yoktu.
//
// fader DEPTH_UI.FADER (-400) ile ciziliyor, bu nesne ise depth 0:
// daha kucuk depth ONDE demek, yani siyah perde butun panellerin
// uzerinde kaliyor ve sahne hic gorunmuyordu.
//
// Sahnenin KENDI perdesi var (asagidaki "perde" degiskeni, siyahtan
// aciliyor), o yuzden global fader burada aninda kaldiriliyor -- gorsel
// olarak yine siyahtan aciliyoruz, sadece iki perde ust uste binmiyor.
if (instance_exists(fader))
{
	Anim_Destroy(fader,"alpha");
	fader.alpha = 0;
}

//----------------------------------------------------------- panel cercevesi
PN_X = 40;					/// panelin sol kenari
PN_GEN = 560;				/// panel genisligi
PN_YUK = round(PN_GEN*593/1078);	/// kaynak paneller 1078x593
PN_Y = round((480-PN_YUK)/2);		/// dikeyde ortali
PN_OL = PN_GEN/1078;		/// 1078x593 paneller icin olcek

//------------------------------------------------------------------ perde
PERDE = 45;					/// kararma / acilma suresi (kare)
perde = 1;					/// 1 = tam siyah. Sahne siyahtan aciliyor.
asama = "acil";				/// "acil" | "gorunur" | "kapan" | "bekle"

//------------------------------------------------------------------ akis
bolum = 1;					/// hangi bolumdeyiz (1-8)
bt = 0;						/// bolum ici kare sayaci
alt = 0;					/// bolum ici alt panel sirasi
final_asama = 0;			/// 0 yok | 1 muzik bekleniyor | 2 ses caldi
FINAL_BEKLE = 120;			/// son panelden sonraki sessiz siyah
FINAL_SON = 300;			/// toz sesinden sonra jenerige kadar

//------------------------------------------------------------------ metin
mt_liste = [];				/// o an akan satirlar
mt_i = 0;
mt_t = 0;
mt_on = false;
mt_bitti = true;
MT_HIZ = 3;					/// kare / karakter
MT_BEKLE = 80;				/// satir yazildiktan sonraki bekleme

MtBasla = function(_liste)
{
	mt_liste = _liste;
	mt_i = 0;
	mt_t = 0;
	mt_on = (array_length(_liste) > 0);
	mt_bitti = !mt_on;
};

MtSure = function()
{
	if (mt_i >= array_length(mt_liste)) { return 0; }
	return string_length(mt_liste[mt_i])*MT_HIZ+MT_BEKLE;
};

//------------------------------------------------------- 6. bolum panelleri
b6 = [
	{ spr : end_frame_7_3, mt : ["...","Mweh... heh... heh."] },
	{ spr : end_frame_7_6, mt : ["L-... Looks like even after all that...",
	                             "Even my own will power wasn't enough to take down...",
	                             "...a human."] },
	{ spr : end_frame_7_9, mt : ["...",
	                             "I won't let you see me turn to dust.",
	                             "I won't let you get that satisfaction..."] },
];

//------------------------------------------------------- 8. bolum panelleri
// Metinlerin TAMAMI ilk panelde (8_2). Sans toz olurken konusmuyor;
// kalan paneller sessiz oynuyor.
b8 = [
	{ spr : end_frame_8_2, sure : 0, mt : ["The war... is finally over.",
	                                       "You hear that... everyone?",
	                                       "We can finally rest.",
	                                       "...",
	                                       "...I think... I'm going to watch the snow for a little while."] },
	{ spr : end_frame_8_4, sure : 300, mt : [] },
	{ spr : end_frame_8_6, sure : 300, mt : [] },
	{ spr : end_frame_8_8, sure : 340, mt : [] },
];

//----------------------------------------------------------- bolum sureleri
// Metne bagli olmayan bolumlerin gorunur suresi (kare).
B_SURE = [0,560,700,380,660,760,0,240,0];

//--------------------------------------------------------------- 2. bolum
// end_frame_2_5'teki iki figur (1536x845 icinde olculen sutun kumeleri).
F25_OL = PN_GEN/1536;
f25 = [
	{ sx : 728, sy : 219, sw : 257, sh : 315 },
	{ sx : 332, sy : 402, sw : 257, sh : 346 },
];

//--------------------------------------------------------------- 4. bolum
// Agaclarin kayacagi mesafe: 220 kaynak pikseli. Bu kadarda aradaki
// bosluk tam Sans'in uzerine geliyor; daha fazlasi gereksizce kayip
// bir sonraki govdeyi getiriyordu.
AGAC_KAY = 220;

//--------------------------------------------------------------- 5. bolum
// Dikey paneller 539x593 ve taslakta ekranin SAG KENARINA tam oturuyor:
// ekran yuksekligine olceklenip saga yaslaniyor.
B4_OL = 480/593;
B4_GEN = round(539*B4_OL);
B4_X = 640-B4_GEN;
B4_Y = 0;
// Nefes (4_6) icerigi x 189..328, y 227..269 -- Sans'in agzi.
NEFES_MX = (189+328)/2;
NEFES_MY = (227+269)/2;

///O anki bolumun panel dikdortgeni. Panel disi siyahla kapatiliyor.
PanelAlan = function()
{
	if (bolum == 5) { return { x : B4_X, y : B4_Y, w : B4_GEN, h : 480 }; }
	return { x : PN_X, y : PN_Y, w : PN_GEN, h : PN_YUK };
};

///Perde TAM SIYAHKEN bir sonraki duruma gecer. Butun ilerlemeler buradan
///gectigi icin hicbir panel digerinin uzerine binmiyor.
Ilerle = function()
{
	if (bolum == 6)
	{
		alt += 1;
		if (alt < array_length(b6))
		{
			bt = 0; asama = "acil"; MtBasla(b6[alt].mt);
			return;
		}
		// 6 bitti -> "a short pause": perde inik kaliyor
		bolum = 7; alt = 0; bt = 0; asama = "bekle";
		return;
	}

	if (bolum == 8)
	{
		alt += 1;
		if (alt < array_length(b8))
		{
			bt = 0; asama = "acil"; MtBasla(b8[alt].mt);
			return;
		}
		// Butun paneller bitti: ekran siyah kaliyor, muzigin bitmesi
		// bekleniyor (bkz. Step_0 final_asama).
		alt = array_length(b8)-1;
		bt = 0; asama = "bekle"; final_asama = 1;
		return;
	}

	bolum += 1;
	bt = 0;
	asama = "acil";
	if (bolum == 6) { MtBasla(b6[0].mt); }
};

//------------------------------------------------------------------ muzik
audio_stop_all();
audio_play_sound(snd_eternal_bloom,1,false);
