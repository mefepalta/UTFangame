///@desc ACILIS HIKAYESI -- panel zamanlamasi
//==========================================================================
// Butun sahne tek bir tabloya bagli: her satir bir panelin ne zaman
// acildigini, ne kadar ekranda kaldigini ve panel icindeki olaylari
// tutuyor. Metin zamanlari (o_textcontroller_story) bu tabloya gore
// hesaplandi.
//
// spr : -1  -> panel yok; metin duz siyah uzerinde akiyor.
// ani : true -> panel kararmadan, bir anda basiyor.
//
// Olcu: snd_balladofhteunderground = 6265 kare (104.4 sn).
// Son satir 6109. karede kapaniyor, perde iniyor ve 6190. karede
// room_logo'ya geciliyor -- muzik bitmeden sahne kapaniyor.
//==========================================================================

image_alpha = 0;
target_alpha = 0;
fade_speed = 0.05;	/// gorunur gecis ~20 kare
storypanelval = 0;
pn_i = 0;			/// tablodaki sirali panel
son_kare = 6109;		/// o_storyblack perdeyi burada indiriyor

// t     : panelin belirdigi kare (kararma o anda bitmis oluyor)
// sure  : panelin gorunur kaldigi kare sayisi (0 = ekran siyah)
// olay  : panel icinde tetiklenen kareler (d = panelin basina gore)
paneller = [
	{ spr : storypanel_1, t : 110, sure : 298, ani : false, olay : [] },	/// yeralti magarasi
	{ spr : storypanel_2, t : 446, sure : 326, ani : false, olay : [] },	/// insan yuzeyden dusup carpiyor
	{ spr : storypanel_7, t : 810, sure : 293, ani : false, olay : [] },	/// toz / dehset
	{ spr : storypanel_8, t : 1141, sure : 313, ani : false, olay : [] },	/// Papyrus (?!) -- Sans ikna ediliyor
	{ spr : storypanel_9, t : 1492, sure : 276, ani : false, olay : [] },	/// Sans yola cikiyor
	{ spr : storypanel_5, t : 1806, sure : 268, ani : false, olay : [] },	/// Papyrus geride kaliyor
	{ spr : storypanel_10, t : 2112, sure : 360, ani : false, olay : [
			{ d : 246, spr : storypanel_17, ses : snd_eye, sars : 2 },
			{ d : 268, spr : storypanel_11, ses : -1, sars : 0 },
		] },	/// anlasma denemesi + parlama + 11
	{ spr : storypanel_12, t : 2472, sure : 190, ani : true, olay : [
			{ d : 0, spr : -1, ses : snd_damage, sars : 5 },
		] },	/// OLUM - bir anda beliriyor, sarsinti + hasar sesi
	{ spr : storypanel_13, t : 2700, sure : 321, ani : false, olay : [] },	/// Sans koye donuyor
	{ spr : storypanel_14, t : 3059, sure : 499, ani : false, olay : [] },	/// kardesinin kalintilari, bakisi eriyor
	{ spr : storypanel_15, t : 3596, sure : 1329, ani : false, olay : [] },	/// ceket + mantra
	{ spr : -1, t : 4945, sure : 0, ani : false, olay : [] },	/// SIYAH - oyuncuya donus
	{ spr : storypanel_16, t : 5652, sure : 857, ani : false, olay : [] },	/// ...are you?
];

audio_play_sound(snd_balladofhteunderground,1,0);
