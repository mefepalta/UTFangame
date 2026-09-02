_timer=0;
_start=false;
cang=false;
canga=0;

bluddy = -1;
smaaashready = 0

//==========================================================================
// ATAK 3 -- YER VURUSU (faz 1)
// Eskiden her vurusta ekranin ustunden dokuz kemik dokuluyordu; konumu,
// boyu, hizi, acisi ve hangi taraftan gelecegi tamamen random_range ile
// seciliyordu. Boyle bir desen ezberlenemedigi icin bolum no-hit
// oynanamiyordu.
//
// Yeni desen -- SOK DALGASI. Vurus bir YER vurusu oldugu icin her sey
// zeminden basliyor:
//
//   1) Sans ayagini yere vuruyor, sarsinti kutuyu bir uctan obur uca
//      tariyor ve gectigi her noktada zeminden bir diken firliyor.
//      Dikenler uzaklastikca kisaliyor -- sarsinti zayifliyor.
//      Oyuncunun isi: dalga kendisine varmadan ust seride cikmak.
//
//   2) Ust serit bedava olmasin diye tavanin da bir sebebi var: sarsinti
//      zemini yararken TAVANDAN ENKAZ kopariyor. Enkaz, dalga cephesinin
//      biraz ARKASINDAN dusuyor -- yani "once zemin catladi, sonra tavan
//      doktu". Her ucuncu noktada bir parca dustugu icin aralarindan
//      gecmek icin bol yer var; oyuncu yukarida kalirken bir yandan da
//      enkazsiz sutunlara kayiyor.
//
// Vurus yonu ve enkazin hangi sutunlara dustugu her vuruste degisiyor,
// ama ikisi de sabit dizilerden geliyor: desen ezberlenebilir, hicbir
// yerde rastgelelik yok. Kol kalkmasi (100 kare) dogal uyari, dalga tam
// yere carpma karesinde yayilmaya basliyor.
//==========================================================================
#macro T3_SLAM_HIZ    0.60	/// vurus temposu (dongu ~143 kare, hazirlik ~100)
#macro T3_DALGA_SLOT    11	/// dalganin tarayacagi nokta sayisi (20 px arayla)
#macro T3_DALGA_ADIM     6	/// iki nokta arasindaki gecikme -> 3.3 px/kare
#macro T3_DALGA_BOY     88	/// dalganin basindaki diken boyu (kutu 130)
#macro T3_DALGA_SONUM 0.20	/// uca dogru kisalma orani -- sarsinti zayifliyor
#macro T3_DALGA_CIK      6	/// dikenin firlamasi
#macro T3_DALGA_KAL     24	/// tepede kalmasi
#macro T3_DALGA_IN       8	/// geri cekilmesi

#macro T3_ENKAZ_ARA      3	/// kac noktada bir enkaz dusuyor
#macro T3_ENKAZ_GECIKME 22	/// cephenin ne kadar arkasindan dusuyor (kare)
#macro T3_ENKAZ_BOY     26	/// dusen parcanin boyu
#macro T3_ENKAZ_HIZ    3.2	/// dusme hizi (kutuyu ~47 karede geciyor)

/// Her vurus icin: tarama yonu (1 = soldan saga) ve enkazin dustugu
/// sutunlarin kaymasi. Ikisi de her vuruste degisiyor.
dalga_yon   = [ 1,-1, 1,-1];
dalga_enkaz = [ 0, 0, 2, 1];
dalga_no = 0;

dalga_on = false;	/// dalga suruyor mu
dalga_t = 0;		/// dalga basladigindan beri gecen kare
dalga_i = 0;		/// sirada hangi nokta var
dalga_e = 0;		/// sirada hangi enkaz var
dalga_kemik = [];

///Bir noktanin kutu icindeki x'i.
DalgaX = function(_slot)
{
	var _w = battle_board.left+battle_board.right;
	return (battle_board.x-battle_board.left)+(_w/T3_DALGA_SLOT)*(_slot+0.5);
};

///Zeminden yukselen diken: once uzuyor, bir sure duruyor, sonra cekiliyor.
///Kare 0 = Sans'in kemigi (1 Papyrus'unki), bottom 1 = zemin altinda kalan
///yuvarlak uc cizilmiyor.
DalgaDiken = function(_bx,_boy)
{
	var _b = RegularBone(_bx,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,1,0,false);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_boy,T3_DALGA_CIK);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_boy,-_boy,
		T3_DALGA_IN,T3_DALGA_CIK+T3_DALGA_KAL);
	array_push(dalga_kemik,_b);
	return _b;
};

///Tavandan kopan enkaz: kutunun ustunden asagi dusuyor, disari cikinca
///kendini yok ediyor (autoDestroy).
DalgaEnkaz = function(_bx)
{
	return RegularBone(_bx,battle_board.y-battle_board.up-20,T3_ENKAZ_BOY,
		0,T3_ENKAZ_HIZ,0,0,0,1,0,1,0,0,true);
};

///Sahnede kalan dikenleri toplar.
DalgaTemizle = function()
{
	for (var _i = 0; _i < array_length(dalga_kemik); _i++)
	{
		if (instance_exists(dalga_kemik[_i])) { instance_destroy(dalga_kemik[_i]); }
	}
	dalga_kemik = [];
};

///Yeni bir sok dalgasi baslatir (yere carpma karesinde cagriliyor).
DalgaBasla = function()
{
	DalgaTemizle();
	dalga_on = true;
	dalga_t = 0;
	dalga_i = 0;
	dalga_e = 0;
	dalga_no += 1;
};

///Her adim: sirasi gelen dikeni ve (varsa) enkazi birakir.
DalgaAdim = function()
{
	if (!dalga_on) { return; }
	dalga_t += 1;

	var _n = (dalga_no-1) mod array_length(dalga_yon);
	var _yon = dalga_yon[_n];
	var _kay = dalga_enkaz[_n];

	// Zemin cephesi
	while (dalga_i < T3_DALGA_SLOT) and (dalga_t >= dalga_i*T3_DALGA_ADIM)
	{
		var _slot = (_yon > 0) ? dalga_i : (T3_DALGA_SLOT-1-dalga_i);
		// Sarsinti uzaklastikca zayifliyor.
		var _boy = T3_DALGA_BOY*(1-T3_DALGA_SONUM*(dalga_i/(T3_DALGA_SLOT-1)));
		DalgaDiken(DalgaX(_slot),_boy);
		dalga_i += 1;
	}

	// Cephenin arkasindan dusen enkaz
	while (dalga_e < T3_DALGA_SLOT) and (dalga_t >= dalga_e*T3_DALGA_ADIM+T3_ENKAZ_GECIKME)
	{
		if ((dalga_e mod T3_ENKAZ_ARA) == _kay)
		{
			var _es = (_yon > 0) ? dalga_e : (T3_DALGA_SLOT-1-dalga_e);
			DalgaEnkaz(DalgaX(_es));
		}
		dalga_e += 1;
	}

	if (dalga_i >= T3_DALGA_SLOT) and (dalga_e >= T3_DALGA_SLOT)
	and (dalga_t > (T3_DALGA_SLOT-1)*T3_DALGA_ADIM+T3_ENKAZ_GECIKME+60)
	{
		dalga_on = false;
	}
};
