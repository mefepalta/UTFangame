_timer=0;
_start=false;
cang=false;
canga=0;

// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

yol=0;
bolum=0;			// hangi bolume gelindi (bkz. Step_0)
atak_yol=11700;		// koridorun bittigi yol. Son oge (J kutulari) 11540te
			// variyor, 160 px pay kaliyor. Tur 16: 6860.
bitis_kare=-1;
konuk_son=0;		// Konuk finalinin guvenlik siniri (bkz. Step_0)		// atak bittigi kare

//==========================================================================
// PATTERN 1 -- kemik bilekligi (carousel)
//==========================================================================
// Halka yatay duruyor, ekranda basik bir elips olarak goruluyor. Kemikler
// halkanin uzerinde ARDISIK aci araliklarini kapliyor: i. kemik
// [aci_i, aci_i+1] arasini dolduruyor. Bir kemigin ucu bir sonrakinin ucuyla
// ayni noktada, yani arada hic bosluk yok ve donerken uclar kaymiyor --
// her uc halkanin uzerindeki bir noktaya cakili, kayan sey o noktanin
// kendisi. Kemikler daima yatay; perspektifi uzunluk kisalmasi veriyor.
// Elipsin basik olmasi sart: dik bir halkanin yan taraflari dikey olurdu ve
// yatay kemikler orayi bosluksuz kaplayamazdi.
//
// Bileklikler diger her sey gibi dunya hiziyla asagi kayiyor.
// Kalbin USTUNDEN geciyorlar: yerdeyken zararsizlar, ama ZIPLAYAN kalp
// iceri girip carpiyor. Yani bileklik "simdi ziplama" diyor.
// Beyaz barlar ise tam tersi: yerdeki kalbi vuruyor, havadakine degmiyor,
// yani "simdi zipla" diyor. Ikisi sirayla gelerek bolumun ritmini kuruyor.
car_on=false;
cars=[];				// { y }
car_ang=0;				// halkalarin ortak donusu
car_spin=1.1;			// derece/kare
car_n=14;				// bir bileklikteki kemik sayisi
car_rx=145;				// yatay yaricap
car_ry=28;				// dikey yaricap (basiklik)

///Bir bilekligin i. kemiginin ekrandaki geometrisi.
///x1/x2 iki ucun x i, y kemigin cizildigi yukseklik, on derinlik (-1..1),
///sc kalinlik carpani.
///@arg i		kemik sirasi
///@arg cy		bilekligin merkez y si
CarSeg = function(_i,_cy)
{
	var _adim = 360/car_n;
	var _a1 = car_ang+_i*_adim;
	var _a2 = _a1+_adim;
	return {
		x1: battle_board.x+car_rx*dcos(_a1),
		x2: battle_board.x+car_rx*dcos(_a2),
		y: _cy+car_ry*(dsin(_a1)+dsin(_a2))/2,
		on: dsin(_a1+_adim/2),
		sc: 1.0+1.2*(0.5+0.5*dsin(_a1+_adim/2))
	};
};

///Kemik ucu. Sprite dikey duruyor: +90 sola, -90 saga cevirir.
CarCap = function(_cx,_cy,_ang,_sc,_col,_al)
{
	var _sw = sprite_get_width(spr_paps_bonetop);
	var _sh = sprite_get_height(spr_paps_bonetop);
	var _dx = (_sw/2-sprite_get_xoffset(spr_paps_bonetop))*_sc;
	var _dy = (_sh/2-sprite_get_yoffset(spr_paps_bonetop))*_sc;
	var _rx = _dx*dcos(_ang)+_dy*dsin(_ang);
	var _ry = -_dx*dsin(_ang)+_dy*dcos(_ang);
	draw_sprite_ext(spr_paps_bonetop,0,_cx-_rx,_cy-_ry,_sc,_sc,_ang,_col,_al);
};

///Yatay kemik: iki ucu ve arasini dolduran sap.
CarBone = function(_x1,_x2,_y,_sc,_col,_al)
{
	var _l = min(_x1,_x2);
	var _r = max(_x1,_x2);
	if (_r-_l < 1) { return; }
	var _cap = sprite_get_height(spr_paps_bonetop)*_sc;
	var _kal = 5*_sc;
	// Halkanin en solunda ve saginda kemik tam yandan goruluyor: boyu neredeyse
	// sifira iniyor ve iki uc ust uste binip capraz bir lekeye donusuyordu.
	// Orada tek uc birakiyoruz, kemik kesitmis gibi duruyor.
	if (_r-_l < _cap*1.7)
	{
		CarCap((_l+_r)/2,_y,90,_sc,_col,_al);
		return;
	}
	var _sl = _l+_cap;
	var _sr = _r-_cap;
	if (_sr > _sl)
	{
		draw_set_alpha(_al);
		draw_set_color(_col);
		draw_rectangle(_sl,_y-_kal/2,_sr,_y+_kal/2,false);
		draw_set_alpha(1);
	}
	CarCap(_l+_cap/2,_y,90,_sc,_col,_al);
	CarCap(_r-_cap/2,_y,-90,_sc,_col,_al);
};

///Tek bir bileklik koyar. Konum kalbe varana kadarki YOL cinsinden, cunku
///her bilekligin bir tuzak halkanin yay ortasina denk gelmesi gerekiyor.
///@arg d	kalbe varis mesafesi (px)
CarMark = function(_d)
{
	array_push(cars,{ y: 400-_d });
	car_on = true;
};

CarStop = function()
{
	car_on = false;
	cars = [];
};

//==========================================================================
// Beklenmedik Konuk (mini-boss)
//==========================================================================
// Konuk koridorun tepesinde bekliyor. Belli araliklarla kalbi nisan alip
// kendini ustune atiyor; atilirken dunya da hizlaniyor.
//
// TUR 16'DAN IKI FARK:
//
//  1) Sadece GUC DASH'i geri puskurtuyor (strike_pow == 2). Ufak dash
//     (Z'ye basar basmaz cikan vurus) Konuk'a islemiyor. Tur 16'da ikisi
//     de calisiyordu ve Konuk bu yuzden tehdit olmaktan cikiyordu:
//     oyuncu Z'ye basmayi surdurup her seferinde bedavaya savuruyordu.
//
//  2) Saldiri araligi guc dash'in suresine gore ayarlandi. Guc dash
//     charge_max = 40 kare basili tutmak istiyor; Konuk'un bir
//     savrulmadan digerine kadar gecen suresi:
//         gst_geri (20) + gst_bekle (6) + gst_hazir (30) = 56 kare
//     Yani sarj TAM oturuyor, geriye 16 kare pay kaliyor. Zamaninda
//     basip birakan oyuncu her seferinde yetisiyor, gecikeni yiyor.
//
// Puskurtme penceresi hazirlik + atilis boyunca acik (gst_state 1 ve 2),
// yani atilisi beklemeye gerek yok, telegrafta da savurulabiliyor.
//
// 0 = uzakta bekliyor, 1 = hazirlik, 2 = atilis, 3 = savrulma / geri donus
gst_state=0;
gst_on=false;
gst_x=320;
gst_y=120;
gst_home_y=120;		// bekleme yuksekligi
gst_bekle=6;		// atilislar arasi bekleme (tur 16: 70)
gst_hazir=30;		// hazirlik/telegraf suresi (tur 16: 22)
gst_geri=20;		// savrulduktan sonra yerine donus suresi (tur 16: 55)
gst_vx=1.4;			// beklerken yatay suruklenme
gst_t=0;
gst_cycle=0;
gst_max=4;
gst_alpha=0;
gst_flash=0;
gst_bob=0;
gst_scale=2.2;
gst_tx=320;			// atilisin kilitlendigi hedef
gst_ty=400;
gst_spd=19;			// atilis hizi
gst_rvx=0;			// savrulma hizi
gst_rvy=0;

///@arg max	kac kez savruldiktan sonra kaciyor
GuestStart = function(_max)
{
	gst_max = _max;
	gst_cycle = 0;
	gst_on = true;
	gst_state = 0;
	gst_t = 0;
	gst_x = battle_board.x;
	gst_y = -60;
	gst_vx = 1.4;
	gst_flash = 0;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,25);
	audio_play_sound(snd_exclamation,0,false);
};

GuestStop = function()
{
	gst_on = false;
	Anim_Destroy(id,"gst_alpha");
	Anim_Create(id,"gst_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,gst_alpha,-gst_alpha,25);
};

//==========================================================================
// PATTERN 3 -- kucuk kutular
//==========================================================================
// Deltarune deki bolumun 90 derece dondurulmus hali: kutular gidis yonunde
// (yani dikeyde) art arda diziliyor, mavi kenarlar kutunun ALT ve UST
// duvarlari oluyor. Duvarlar zaten var olan bar nesnesiyle yapiliyor
// (battle_dr_obstacle): mavi pencere tam kutu genisligi, gerisi beyaz.
// Boylece dunyayla birlikte kayma ve dash ile kirilma bedavaya geliyor.
// Kutunun YAN duvarlari kati: kalp kutunun icindeyken oraya hapis.
// Kutu boyu 120. Bir vurusun erisebildigi mesafe = menzil 78 + vurus
// penceresi 12 kare * dash sirasindaki dunya hizi ~7 = 162 px. 120 bunun
// altinda, yani alt duvari kiran dash zincirle ust duvari da kiriyor:
// kutu tek dash ile geciliyor. Kalp kutunun icinde zaten mavi pencereye
// hizali oldugu icin burada hizalanma sorunu yok, is tamamen zamanlamada.
// Kutular arasindaki bosluga yandan blaster geliyor; blasterlar da diger
// her sey gibi asagi kayiyor, dash olunca kayma hizlaniyor.
// Bosluk 340, serit sapmasi 40: kutudan cikan oyuncunun bir sonraki kutuya
// hizalanmasi 27 kare, guc dashini sarj etmesi 40 kare suruyor ve arada
// blaster var. 260/52 iken bunlarin hepsi ayni 43 kareye sigiyordu.
box_on=false;
boxes=[];			// { ox, w, h, y }
blasts=[];			// { y, side }
box_gap=260;

// Blasterlar oyunun kendi blaster nesnesi (battle_gasterblaster), sadece
// dr_mode acik: ateslendikten sonra geri tepmiyor, nisan aldigi yerde kalip
// dunyayla birlikte asagi kayiyor. Cizimi, sesi, isini ve hasari kendi
// yapiyor -- burada sadece dogus ani belirleniyor.
//
// Isin bastan sona uzuyor, yani yandan kacis yok. Kacis hiz: blaster
// dogumundan 77 kare sonra atesliyor ve normal hizda tam kalbin hizasinda
// patliyor. Dash atip dunyayi hizlandiran oyuncu daha ates etmeden gecmis
// oluyor -- ve ufak dash bile yetiyor. Once 232/16 idi: orada sadece guc
// dashi kurtariyordu, kutu duvarlariyla birlikte cok aciti.
blast_warn=120;		// blaster bu y de doguyor (erken: uzun uyari)
blast_len=20000;	// isin uzunlugu (px); kisaltmak istenirse buradan

///@arg side	-1 sol kenar, +1 sag kenar
///@arg y		dogdugu yukseklik
DrBlaster = function(_side,_y)
{
	var _hx = (_side < 0) ? (battle_board.x-battle_board.left-42) : (battle_board.x+battle_board.right+42);
	var _ang = (_side < 0) ? 0 : 180;
	// Son arg 1: giris animasyonu yok, blaster dogrudan yerinde doguyor.
	// BlastCooldown 55 + agiz animasyonunun 20 karesi = 77. karede ates.
	var _b = RegularBlaster(_hx,_y,_hx,_y,_ang,_ang,26,55,2,2,1);
	_b.dr_mode = true;
	_b.dr_len = blast_len;
	// Bir anda belirmesin: seffaf doguyor, 30 karede opaklasiyor. Ates 37.
	// karede oldugu icin agzini acmaya basladiginda coktan tam gorunur.
	// Blasterin kendi kodu image_alpha ya hic dokunmuyor, cakisma yok.
	_b.image_alpha = 0;
	Anim_Create(_b,"image_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,30);
	return _b;
};

///Art arda dizilmis mavi barlar. Tek guc dash i hepsini kiriyor: her
///kirilis vurus penceresini bastan baslatiyor. Oyuncu bu sirada sadece
///saga sola gidip bir sonraki mavi pencereye hizalaniyor; hizasiz kalan
///bar kirilmiyor ve zincir orada kopuyor. Kutulardan once geliyor, yani
///mekanigi kutu duvarlarinda kullanmadan once ogretiyor.
///@arg count	kac bar
///@arg gap		barlar arasi dikey mesafe
///@arg w		mavi pencere genisligi
ChainRun = function(_count,_gap,_w)
{
	// Zincir dash barlari kendisi kiriyor, oyuncunun tek isi hizalanmak.
	// Sapma 40 px: barlar arasi 120 px = 17 kare, kalp 3 px/kare ile 50 px
	// gidebiliyor, yani yetisiyor ama bosuna da durulmuyor.
	var _ofs = [-20,20,-20,20,-20,20];
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = DrBone(_ofs[_i % array_length(_ofs)],_w);
		_b.y = -40-_i*_gap;
	}
	audio_play_sound(snd_exclamation,0,false);
};

///Yandan gelen bir blaster isaretcisi koyar. Konum, blasterin kalbe varana
///kadar kat edecegi YOL cinsinden veriliyor -- her sey gibi asagi kayiyor.
///Isaretci blast_warn'a ulasinca gercek blaster doguyor.
///@arg d		kalbe varis mesafesi (px)
///@arg side	-1 sol kenar, +1 sag kenar
BlastMark = function(_d,_side)
{
	array_push(blasts,{ y: 400-_d, side: _side, dogdu: false });
};

///@arg count	kac kutu
///@arg w		kutu genisligi
///@arg h		kutu yuksekligi
///@arg gap		kutular arasi bosluk
///@arg off		merkeze gore sapma
BoxRun = function(_count,_w,_h,_gap,_off)
{
	boxes = [];
	blasts = [];
	box_gap = _gap;
	var _adim = _h+_gap;
	for (var _i = 0; _i < _count; _i++)
	{
		var _ox = (_i % 2 == 0) ? -_off : _off;
		// Ilk kutu ekranin uzerinde doguyor. Once 150 idi ve kutu tam
		// ekranin ortasinda birden beliriyordu: kutunun yesil yan duvarlari
		// dogrudan ekrana ciziliyor, yani barlar gibi kutu yuzeyi tarafindan
		// kirpilmiyorlar. -250 ile ust duvari -310'da doguyor ve her sey
		// gibi yukaridan kayarak giriyor.
		var _y = -250-_i*_adim;
		array_push(boxes,{ ox:_ox, w:_w, h:_h, y:_y });

		// Alt ve ust duvar. Mavi pencere tam kutu genisligi: kalp kutunun
		// icindeyken sadece maviye denk geliyor, yani gecmenin tek yolu dash.
		var _b1 = DrBone(_ox,_w);
		_b1.y = _y+_h/2;
		var _b2 = DrBone(_ox,_w);
		_b2.y = _y-_h/2;

		// Boslugun tam ortasina bir blaster, terk edilen kutunun tarafindan.
		if (_i < _count-1)
		{
			BlastMark(400-(_y-_h/2-_gap/2),(_ox < 0) ? -1 : 1);
		}
	}
	box_on = true;
	audio_play_sound(snd_exclamation,0,false);
};

BoxStop = function()
{
	box_on = false;
	boxes = [];
	with (battle_dr_obstacle) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
};



//==========================================================================
// PATTERN 4 -- ziplama bolumu yardimcilari
//==========================================================================
// Halkalar ve barlar hepsi ayni anda, ekranin cok yukarisinda dogup
// aralarindaki mesafeyi koruyarak birlikte iniyorlar. Kare araligiyla
// dogursaydik, zincir sirasinda dunya hizlandigi icin aralar bozulurdu.

///@arg off	kutu merkezine gore x ofseti
///@arg dy	ilk halkaya gore kac px yukarida
JumpRing = function(_off,_dy)
{
	var _r = DrRing(_off);
	_r.y -= _dy;
	return _r;
};

///Bastan sona beyaz, kirilamaz bar. Havadaki kalbe degmiyor: tek gecis
///yolu ziplamayi tutturmak.
///@arg dy	ilk halkaya gore kac px yukarida
JumpBar = function(_dy)
{
	// Mavi pencere barin cok disina itiliyor: geriye tek parca, bastan sona
	// beyaz bir kemik kaliyor. blue_w=0 verilseydi pencere tam ortada kalip
	// bari iki ayri kemige bolerdi.
	var _b = DrBone(-9999,2);
	_b.y -= _dy;
	return _b;
};

///Bir kosu birimi: bir dizi GERCEK halka, sonunda bir TUZAK + bileklik.
///
///Halkalar 260 px arayla -- bu ruhun jump_dist'i, yani bir yayin bitisi bir
///sonraki halkaya tam denk geliyor ve zincir kendiliginden suruyor. Her
///gercek halkanin 130 px arkasinda beyaz bar var: havada olmak zorunlu.
///
///TUZAK, son gercek halkayla AYNI SERITTE ve ondan yine 260 px sonra. Yani
///zincirin dogal devami: hicbir sey yapilmazsa zincir ona biniyor ve 130 px
///sonraki bileklige girilir. Dogru oynanis seritten cikip yere inmek --
///bileklik tam kalbin dusecegi noktada duruyor, kandirma orada.
///
///Birimin uzunlugu serit sayisina gore degisiyor. Hep ayni olsaydi (mesela
///her seferinde iki gercek halka) oyuncu tuzagin kacinci ziplamada
///gelecegini sayabilirdi; degisken olunca her seferinde bilekligin kendisine
///bakmak zorunda.
///@arg first	ilk halkanin kalbe varis mesafesi (px)
///@arg lanes	gercek halkalarin seritleri; tuzak sonuncusuyla ayni serite gider
JumpUnit = function(_first,_lanes)
{
	var _n = array_length(_lanes);
	for (var _i = 0; _i < _n; _i++)
	{
		var _d = _first+260*_i;
		JumpRing(_lanes[_i],_d-420);
		JumpBar(_d+130-424);
	}
	var _td = _first+260*_n;
	JumpRing(_lanes[_n-1],_td-420);			// tuzak: ayni serit, zincirin devami
	CarMark(_td+130);
};

//==========================================================================
// PAPYRUS'UN SIGARA SAHNESI
//==========================================================================
// Koridor ve Konuk bittikten sonra ruh kirmiziya doner ve Papyrus bir mola
// verir. Sahne sirasi Step_0'daki 'sahne' sayacinda.
//
// Sigaranin YANAN UCU spr_papyrus_smoking icinde (14,25) pikselinde: o
// sprite'taki tek parlak sari leke (255,231,0, dort piksel). Govde
// battle_enemy_engage'de (_px-8, _py-86+pap_bob) noktasina origin (29,71)
// ile 2x cizildigi icin ucun ekran karsiligi:
//     x = _px-8+(14-29)*2 = _px-38
//     y = _py-86+pap_bob+(25-71)*2 = _py-178+pap_bob
sahne=0;			// 0 = yok, 1..6 = sahne adimlari (bkz. Step_0)
sahne_kare=0;		// icinde bulunulan adimin basladigi kare
duman=[];			// { x, y, vx, vy, t, omur, tohum }
duman_t=0;

///Sigara sahnesini baslatir: kutuyu normale dondurur, ruhu kirmiziya cevirir.
///Hem turuncu koridorun hem kirmizi/mavi atagin sonunda ayni sey yapiliyor,
///o yuzden tek yerde.
SigaraBasla = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	// Sahne boyunca normal bir atak kutusu; tur 16'nin diyalog sahnesi de
	// bu olcuyu kullaniyor.
	Battle_SetBoardSizeCubic(65,65,125,125,30);
	Battle_SetSoul(battle_soul_red);
	sahne = 1;
	sahne_kare = _timer;
};

///Sigaranin ucundan bir duman kumesi cikarir.
///@arg x	ucun ekran x'i
///@arg y	ucun ekran y'si
DumanEkle = function(_x,_y)
{
	array_push(duman,{
		x: _x+random_range(-2,2),
		y: _y,
		vx: random_range(-0.22,0.22),
		vy: -random_range(0.7,1.1),
		t: 0,
		omur: 80+irandom(40),
		tohum: irandom(359)
	});
};


//==========================================================================
// KIRMIZI / MAVI RUH ATAGI -- yardimcilar
//==========================================================================
// RegularBone(x,y,uzunluk,hspeed,vspeed,aci,RENK,inside,alpha,PAPYRUS,
//             center,bottom,aciHizi,autoDestroy)
//   RENK   : 0 beyaz, 1 aqua, 2 turuncu
//   PAPYRUS: dogrudan image_index olarak kullaniliyor
//            (battle_regularbone/Draw_0); spr_bone_origin_down iki kareli,
//            yani 1 = Papyrus kemigi. Bu atakta HEPSI 1.
//   aci    : alttan cikan kemik 0, ustten sarkan 180
kir_on=false;
kir_t=0;

///Kirmizi/mavi bolumu baslatir.
KirmiziBasla = function()
{
	kir_on = true;
	kir_t = 0;
};

KirSol = function() { return (battle_board.x-battle_board.left)-5; };
KirSag = function() { return (battle_board.x+battle_board.right)+5; };
KirDip = function() { return (battle_board.y+battle_board.down)-2; };
KirTep = function() { return (battle_board.y-battle_board.up)+2; };

///Motorun _dynamic modunu takar: hiz her kare -1'e dogru 0.03 ile
///lerp'lenir, kemik 22. karede durup geri doner.
///@arg bone	kemik
///@arg hspd	taban yatay hiz
///@arg omur	kac kare yasayacak (donmeden silinmesi isteniyorsa kisa)
KemikDinamik = function(_bone,_hspd,_omur)
{
	_bone._dynamic = true;
	_bone._dynamic_lifetime = _omur;
	_bone._base_hspeed = _hspd;
	_bone._base_vspeed = 0;
	// Sonumleme orani 0.03 yerine 0.015: kemik AYNI noktada donuyor ama
	// yariya inen hizla basliyor. Donus mesafesi hiz/oran ile olceklendigi
	// icin oran yariya inince ayni mesafeye yarim hizla variliyor.
	_bone._dynamic_rate = 0.015;
	return _bone;
};

///A/B/C -- tek bir ivmeli tam boy kemik. Kemikler AYRI AYRI doguyor;
///yelpaze acilimi dogus zamanlarinin farkindan geliyor, sabit ofsetten degil.
///Yon degistirme noktalari simulasyonla secildi:
///   hiz 22 -> soldan gelen x 365'te (ortanin sagi), sagdan gelen x 275'te
///   hiz 13 -> sol x 280 / sag x 360, yani merkezdeki 80 px guvenli kaliyor
///@arg yon	 1 = soldan saga, -1 = sagdan sola
///@arg hiz	 taban hiz (isaretsiz)
///@arg renk 0 beyaz, 1 aqua, 2 turuncu
YelpazeKemik = function(_yon,_hiz,_renk)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = _hiz*_yon;
	var _b = RegularBone(_x,KirDip(),152,_h,0,0,_renk,0,1,1,0,0,0,true);
	KemikDinamik(_b,_h,180);
	audio_play_sound(snd_stab,2,false);
	return _b;
};

///D -- bir kenardan IKI mavi (aqua) kemik. Aqua kemik durdugun surece
///zararsiz. Sabit hizla geciyorlar, _dynamic yok.
///@arg yon	1 = soldan, -1 = sagdan
MaviKemik = function(_yon)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = 6*_yon;
	RegularBone(_x,KirDip(),152,_h,0,0,1,0,1,1,0,0,0,true);
	RegularBone(_x-36*_yon,KirDip(),152,_h,0,0,1,0,1,1,0,0,0,true);
	audio_play_sound(snd_swift,2,false);
};

///E/G -- turuncu ivmeli kemik. Turuncu kemik HAREKET ETTIGIN surece
///zararsiz. Bunlar yon DEGISTIRMIYOR: hiz 36 verilip omur 20'de kesiliyor,
///yani karsi duvara hala hareket halindeyken varip siliniyorlar. Gorunum
///"yavaslayip gecip gitti" oluyor, geri donmuyorlar.
///@arg yon	1 = soldan, -1 = sagdan
TuruncuKemik = function(_yon)
{
	var _x = (_yon > 0) ? KirSol()-10 : KirSag()+10;
	var _h = 18*_yon;
	var _b = RegularBone(_x,KirDip(),152,_h,0,0,2,0,1,1,0,0,0,true);
	KemikDinamik(_b,_h,38);
	audio_play_sound(snd_swift,2,false);
	return _b;
};

///F -- bosluklu kemik: sagdan gelen, arasinda gecilecek bosluk olan cift.
///Kutu 130 px yuksek; bosluk 46 px, tek ziplamada gecilecek olcude.
///@arg nere	0 = bosluk ALTTA, 1 = ORTADA, 2 = USTTE
BosluklKemik = function(_nere)
{
	var _x = KirSag()+10;
	var _t = KirTep();
	var _d = KirDip();
	switch (_nere)
	{
		case 0:
			// Bosluk altta: sadece ustten sarkan uzun kemik
			RegularBone(_x,_t,96,-4,0,180,0,0,1,1,0,0,0,true);
		break;
		case 1:
			// Bosluk ortada: ustten ve alttan birer kisa kemik
			RegularBone(_x,_t,50,-4,0,180,0,0,1,1,0,0,0,true);
			RegularBone(_x,_d,50,-4,0,0,0,0,1,1,0,0,0,true);
		break;
		default:
			// Bosluk ustte: sadece alttan cikan uzun kemik
			RegularBone(_x,_d,96,-4,0,0,0,0,1,1,0,0,0,true);
		break;
	}
	audio_play_sound(snd_stab,2,false);
};

///G -- kutunun dibini dolduran kemik duvari. Kirmizi serit duvarin kendi
///uyarisi (warningDuration); bizim RegularBoneWall'da zaten var.
DipDuvar = function()
{
	var _gen = battle_board.left+battle_board.right+20;
	// DIR.UP duvari kutunun UST kenarina koyuyor (_bone_y = y-up,
	// battle_regularbonewall/Create_0), duvar ALTTA olacagi icin DIR.DOWN.
	RegularBoneWall(DIR.DOWN,_gen,14,58,KirSol(),KirDip(),50,900,1,false);
};

///G -- duvarin ustunde durulan yapiskan platform.
SticikPlatform = function()
{
	var _p = instance_create_depth(battle_board.x,KirDip()-62,DEPTH_BATTLE.BULLET,battle_platform1);
	_p.width = 48;
	_p.sticky = 1;
	_p.move_x = 1.2;
	// bounce_x KAPALI: battle_platform1'in kendi sekmesi sadece 'block'
	// objelerinden calisiyor (Step_2), bu atakta block yok. Kutu
	// kenarlarindan sekme Step_0'da elle yapiliyor.
	_p.bounce_x = false;
	_p.auto_destroy = false;
	return _p;
};

///Sans'in hancerleri. Aslinda bir RegularBone: alfa acilirken sprite
///geriye savruluyor (telegraf), _wait karesinde firliyor. Tarif
///battle_turn_11'deki Dagger'dan; tek fark 10. arguman 1, yani Papyrus
///kemik sprite'i. Aci kurali: _ang = gidis yonu - 90.
///@arg dx	dogus x
///@arg dy	dogus y
///@arg len	uzunluk
///@arg hsp	firladiktan sonraki yatay hiz
///@arg vsp	dikey hiz
///@arg ang	sprite acisi (gidis yonu - 90)
///@arg wait	kac kare sonra firlayacak
Hancer = function(_dx,_dy,_len,_hsp,_vsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,1,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,18);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,5,_wait);
	return _b;
};

///H -- yandan gelen hancer: alt duvara PARALEL, platformun hemen ustunden.
///@arg yon	1 = soldan saga, -1 = sagdan sola
HancerYatay = function(_yon)
{
	var _x = battle_board.x-_yon*(battle_board.left+26);
	var _y = KirDip()-70;
	return Hancer(_x,_y,58,16*_yon,0,(_yon > 0) ? 270 : 90,26);
};

///I -- yukarida belirip ruha nisan alan hancer. Yon dogus aninda
///kilitleniyor: telegraf boyunca ruh kacabilir.
HancerNisan = function()
{
	var _x = battle_board.x+irandom_range(-150,150);
	var _y = battle_board.y-battle_board.up-irandom_range(30,110);
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul))
	{
		_cx = battle_soul.x;
		_cy = battle_soul.y;
	}
	var _d = point_direction(_x,_y,_cx,_cy);
	return Hancer(_x,_y,58,lengthdir_x(13,_d),lengthdir_y(13,_d),_d-90,30);
};
