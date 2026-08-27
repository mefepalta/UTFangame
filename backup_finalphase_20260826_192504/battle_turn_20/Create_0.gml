//==========================================================================
// TEST ANAHTARI -- YAYINA CIKMADAN ONCE false YAPILACAK
//==========================================================================
// true iken 1-8. kisimlar (kirmizi/mavi, sari, turuncu koridor, siyah
// bosluk) tamamen atlaniyor ve tur dogrudan 9. kisimla, yani mavi ruhun
// platform labirentiyle basliyor. Atak 4 dakikayi asiyor, her denemede
// bastan oynamak zor.
// Atlama Step_0'da tek bir blokta: _timer butun sabit tetiklerin otesine
// atiliyor, bolum koridor bitmis sayilacak degere cekiliyor.
// Kapatmak icin: false yap. Silmek icin: bu blok + Step_0'daki
// "TEST: onceki kisimlari atla" blogu.
//==========================================================================
test_labirent = true;

//==========================================================================
// TEST ANAHTARI 2 -- YAYINA CIKMADAN ONCE false YAPILACAK
//==========================================================================
// true iken 9. kisim (mavi ruhun platform parkuru) da atlaniyor ve tur
// dogrudan SON ATAK ile basliyor. test_labirent'ten daha guclu: ikisi de
// true olsa bile bu kazaniyor.
// Kapatmak icin: false yap. Silmek icin: bu blok + Step_0'daki
// "TEST: onceki kisimlari atla" blogunun test_sonatak dallari.
//==========================================================================
test_sonatak = true;


_timer=0;
_start=false;
cang=false;
canga=0;
attack_done = false;
spriteready = false;
frameready = false;

//==========================================================================
// FAZ 2 -- 1. KISIM (kirmizi/mavi) yardimcilari
//==========================================================================
// Yapi kullanicinin tarifinden; hizlar atakfinal_1.gif'ten olculdu.
// Kayit 640x480 = oyunun kendi cozunurlugu, yani piksel olcumu dogrudan
// oyun koordinati. Kayit 30 fps, oyun 60 fps -> oyun karesi = 2 x GIF.
//
// Kutu olculdu: x 239-398, y 251-387  ->  68,68,80,80
// Olculen hizlar: capraz ciftler 4 px/kare, ust gruplar 5 px/kare.
//
// KEMIKLER SANS SPRITE'I: RegularBone'un 10. argumani 0.
//
// RegularBone(x,y,uzunluk,hspeed,vspeed,ACI,renk,inside,alpha,PAPYRUS,
//             center,bottom,aciHizi,autoDestroy)
//   ACI: 0 alttan cikan, 180 ustten sarkan, 90 yatay

F2Sol = function() { return (battle_board.x-battle_board.left); };
F2Sag = function() { return (battle_board.x+battle_board.right); };
F2Dip = function() { return (battle_board.y+battle_board.down)-2; };
F2Tep = function() { return (battle_board.y-battle_board.up)+2; };

///Ustten sarkan tek kemik.
///@arg hiz	yatay hiz (isaretli; pozitif = soldan saga)
///@arg boy	uzunluk
F2Ust = function(_hiz,_boy)
{
	var _x = (_hiz > 0) ? F2Sol()-12 : F2Sag()+12;
	return RegularBone(_x,F2Tep(),_boy,_hiz,0,180,0,0,1,0,0,0,0,true);
};

///Alttan cikan tek kemik.
F2Alt = function(_hiz,_boy)
{
	var _x = (_hiz > 0) ? F2Sol()-12 : F2Sag()+12;
	return RegularBone(_x,F2Dip(),_boy,_hiz,0,0,0,0,1,0,0,0,0,true);
};

///BOSLUKLU KEMIK: ustten ve alttan birer kemik, aralarinda gecit.
///Kutu ici yukseklik ~132 px. Bosluk nerede olacaksa o taraftaki kemik
///kisa, digeri uzun kaliyor.
///@arg hiz		yatay hiz (isaretli)
///@arg nere	0 = bosluk USTTE, 1 = ORTADA, 2 = ALTTA
F2Bosluk = function(_hiz,_nere)
{
	var _x = (_hiz > 0) ? F2Sol()-6 : F2Sag()+6;
	var _ust, _alt;
	switch (_nere)
	{
		case 0:  _ust = 16; _alt = 104; break;		// bosluk ustte
		case 1:  _ust = 66; _alt = 66; break;		// bosluk ortada
		default: _ust = 104; _alt = 16; break;		// bosluk altta
	}
	// Bosluklu kemikler PAPYRUS sprite'i (10. arguman 1)
	RegularBone(_x,F2Tep(),_ust,_hiz,0,180,0,0,1,1,0,0,0,true);
	RegularBone(_x,F2Dip(),_alt,_hiz,0,0,0,0,1,1,0,0,0,true);
};

///Kutunun UST ORTASINDAN inen YATAY kemik (alt/ust kenara paralel).
///@arg hiz	dikey hiz
F2InenYatay = function(_hiz)
{
	return RegularBone(battle_board.x,F2Tep()-24,150,0,_hiz,90,0,0,1,0,1,0,0,true);
};

///Kutunun ALTINDA, yukari bakan blaster.
///@arg ox	kutu merkezine gore x
F2AltBlaster = function(_ox)
{
	return RegularBlaster(battle_board.x+_ox,560,battle_board.x+_ox,F2Dip()+64,90,90,26,24,2,2,42);
};

///Kutunun UST kosesinde, asagi bakan blaster.
///@arg ox	kutu merkezine gore x
F2UstBlaster = function(_ox)
{
	return RegularBlaster(battle_board.x+_ox,-60,battle_board.x+_ox,F2Tep()-64,270,270,26,24,2,2,42);
};

//==========================================================================
// FAZ 2 -- 2. KISIM yardimcilari
//==========================================================================
// Kemik geciti tarifi battle_turn_12'deki GateMake/GateLen'den; oradaki
// _p bosluk merkezinin DIPTEN yuksekligi, _g bosluk boyu, kemik boylari
// 0.7 kalibrasyonuyla hesaplaniyor.

f2_gecit = [];		/// kemik geciti parcalari
f2_mavi = noone;	/// yelpaze yapan buyuk mavi kemik

///Bir gecit ciftinin kemik boyu.
///@arg p	bosluk merkezinin dipten yuksekligi
///@arg g	bosluk boyu
///@arg ust	true = ustten sarkan parca
F2GecitBoy = function(_p,_g,_ust)
{
	var _h = battle_board.up+battle_board.down;
	if (_ust) { return max(0,(_h-_p-_g/2)/0.7); }
	return max(0,(_p-_g/2)/0.7);
};

///KEMIK GECIDI: bosluklu kemik cifti, boslugun yuksekligi SINUSE gore.
///Art arda cagrilinca bosluklar bir dalga cizerek geliyor.
///@arg hiz	yatay hiz (isaretli)
///@arg i	kacinci parca (sinus fazi)
///@arg g	bosluk boyu
F2Gecit = function(_hiz,_i,_g)
{
	var _h = battle_board.up+battle_board.down;
	var _p = _h*0.5+dsin(_i*34)*(_h*0.26);		/// bosluk merkezi, sinus
	var _x = (_hiz > 0) ? (battle_board.x-battle_board.left)-8
	                    : (battle_board.x+battle_board.right)+8;
	var _bt = battle_board.y-battle_board.up+2;
	var _bb = battle_board.y+battle_board.down-2;
	// Bosluklu kemikler PAPYRUS sprite'i (10. arguman 1)
	var _a = RegularBone(_x,_bb,F2GecitBoy(_p,_g,false),_hiz,0,0,0,0,1,1,0,0,0,true);
	var _b = RegularBone(_x,_bt,F2GecitBoy(_p,_g,true),_hiz,0,180,0,0,1,1,0,0,0,true);
	array_push(f2_gecit,_a);
	array_push(f2_gecit,_b);
};

///Buyuk MAVI kemik: kutudan genis, yatay; ustten DIBE kadar inip yon
///degistirip yukari cikiyor (yelpaze).
///
///Hiz elle verilmiyor, inilecek mesafeden HESAPLANIYOR. Motorun _dynamic
///modu (battle_regularbone/Step_0) hizi her kare -1'e dogru _dynamic_rate
///ile lerp'liyor; 0.012 oraninda kemik 57. karede donuyor ve o ana kadar
///kat ettigi yol taban hizin 24.9 katina esit (simulasyonla olculdu).
///Dolayisiyla taban hiz = mesafe / 24.9 verilince kemik tam dibe varip
///geri donuyor. Kutu boyu degisirse hiz kendiliginden uyar.
///
///Mavi kemik: DURDUGUN surece zararsiz. Sprite tipi SANS (10. arguman 0).
F2MaviYelpaze = function()
{
	var _gen = (battle_board.left+battle_board.right)+90;
	var _basla = battle_board.y-battle_board.up-20;
	var _derin = (battle_board.y+battle_board.down)-_basla;	// inilecek mesafe
	var _hiz = _derin/24.9;

	var _b = RegularBone(battle_board.x,_basla,_gen,0,_hiz,90,1,1,1,0,1,0,0,false);
	_b._dynamic = true;
	_b._dynamic_lifetime = 400;
	_b._base_hspeed = 0;
	_b._base_vspeed = _hiz;
	_b._dynamic_rate = 0.012;
	f2_mavi = _b;
	return _b;
};

///Kemik duvari. Sprite tipi PAPYRUS (papyrusMode = 1).
///@arg yon	DIR.UP / DIR.DOWN / DIR.LEFT / DIR.RIGHT
///@arg boy	kemik boyu
///@arg uyari	uyari suresi
///@arg sure	duvarin kalis suresi
F2Duvar = function(_yon,_boy,_uyari,_sure)
{
	var _sl = (battle_board.x-battle_board.left);
	var _st = (battle_board.y-battle_board.up)+2;
	var _sb = (battle_board.y+battle_board.down)-2;
	if (_yon == DIR.LEFT) or (_yon == DIR.RIGHT)
	{
		var _yuk = battle_board.up+battle_board.down+20;
		RegularBoneWall(_yon,_yuk,10,_boy,_sl,_st,_uyari,_sure,1,false);
	}
	else
	{
		var _gen = battle_board.left+battle_board.right+20;
		RegularBoneWall(_yon,_gen,14,_boy,_sl,(_yon == DIR.DOWN) ? _sb : _st,_uyari,_sure,1,false);
	}
};

///Sola bakan blaster (kutunun SAGINDA).
///@arg oy	kutu merkezine gore y
F2SolaBlaster = function(_oy)
{
	return RegularBlaster(760,battle_board.y+_oy,(battle_board.x+battle_board.right)+64,battle_board.y+_oy,180,180,26,24,2,2,42);
};

//==========================================================================
// FAZ 2 -- 3. KISIM (Alphys) yardimcilari
//==========================================================================
// Dalga efektli kemikler + uzerinde gezilen platform + shocker breaker.
// Tarif battle_turn_14'ten birebir: orada da SeaMake/SeaStep/RipMake/PlatStep
// ayni sekilde kullaniliyor ve dalgayi shocker'in CARPMA ani tetikliyor.
//
// Kemikler dizisi kutunun dibine sirali diziliyor; her karede boylari
// yeniden hesaplaniyor. Bir "dalga" (rip) sonumlu ve ilerleyen bir sinus:
//   boy = taban + amp/(1+uzaklik/sonme) * exp(-faz/zaman) * sin(faz*9)
// yani carpma noktasindan uzaklastikca zayifliyor ve zamanla soniyor.

f2_deniz = [];		/// dalga kemikleri
f2_deniz_x = [];	/// her kemigin x'i
f2_dalga_x = [];	/// dalga merkezleri
f2_dalga_t = [];	/// dalgalarin yasi
f2_plat = noone;	/// uzerinde gezilen platform

///Kutunun dibine sirali dalga kemikleri dizer.
///@arg adet	kemik sayisi
///@arg taban	dinlenme boyu
///@arg sure	acilma animasyonu suresi
F2DenizKur = function(_adet,_taban,_sure)
{
	f2_deniz = [];
	f2_deniz_x = [];
	f2_dalga_x = [];
	f2_dalga_t = [];
	var _w = battle_board.left+battle_board.right;
	var _gap = _w/_adet;
	var _x0 = battle_board.x-battle_board.left+_gap/2;
	for (var _i = 0; _i < _adet; _i++)
	{
		var _x = _x0+_i*_gap;
		var _b = RegularBone(_x,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_taban,_sure);
		array_push(f2_deniz,_b);
		array_push(f2_deniz_x,_x);
	}
	audio_play_sound(snd_exclamation,0,false);
};

///Belirli bir x'te dalga baslatir. Shocker'in CARPTIGI anda cagriliyor.
F2Dalga = function(_x)
{
	array_push(f2_dalga_x,_x);
	array_push(f2_dalga_t,0);
};

///Her kare cagrilir: kemik boylarini dalgalara gore yeniden hesaplar.
///@arg taban	dinlenme boyu
///@arg amp		dalga yuksekligi
///@arg hiz		dalganin yayilma hizi
///@arg sonme	uzaklikla zayiflama
///@arg zaman	zamanla sonme
F2DenizAdim = function(_taban,_amp,_hiz,_sonme,_zaman)
{
	for (var _j = array_length(f2_dalga_t)-1; _j >= 0; _j--)
	{
		f2_dalga_t[_j] += 1;
		if (f2_dalga_t[_j] > 300)
		{
			array_delete(f2_dalga_t,_j,1);
			array_delete(f2_dalga_x,_j,1);
		}
	}

	var _n = array_length(f2_deniz);
	var _m = array_length(f2_dalga_t);
	for (var _i = 0; _i < _n; _i++)
	{
		if (!instance_exists(f2_deniz[_i])) { continue; }
		var _l = _taban;
		for (var _j = 0; _j < _m; _j++)
		{
			var _d = abs(f2_deniz_x[_i]-f2_dalga_x[_j]);
			var _f = f2_dalga_t[_j]-_d/_hiz;
			if (_f <= 0) { continue; }
			_l += _amp/(1+_d/_sonme)*exp(-_f/_zaman)*dsin(_f*9);
		}
		f2_deniz[_i]._length = max(2,_l);
	}
};

///Platformu kutu kenarlarinda sektirir.
F2PlatformAdim = function()
{
	if (!instance_exists(f2_plat)) { return; }
	var _sol = battle_board.x-battle_board.left+f2_plat.width/2;
	var _sag = battle_board.x+battle_board.right-f2_plat.width/2;
	if (f2_plat.x < _sol) { f2_plat.move_x = abs(f2_plat.move_x); }
	if (f2_plat.x > _sag) { f2_plat.move_x = -abs(f2_plat.move_x); }
};

///Dalga kemiklerini ve platformu temizler.
F2DenizTemizle = function()
{
	var _n = array_length(f2_deniz);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(f2_deniz[_i])) { instance_destroy(f2_deniz[_i]); }
	}
	f2_deniz = [];
	f2_deniz_x = [];
	f2_dalga_x = [];
	f2_dalga_t = [];
	if (instance_exists(f2_plat)) { instance_destroy(f2_plat); }
};

//==========================================================================
// FAZ 2 -- 4. KISIM (mizraklar + cekicler + firlatilan kemik) yardimcilari
//==========================================================================

f2_kol_geri = -1;	/// sol kol sprite'inin geri donecegi kare (bkz. battle_turn_8)

///Sans'in elinin ekrandaki noktasi. Draw olayindaki sol kol cizim
///ifadesinin aynisi; ustune el pikselinin (spr_p2_arm_left_1'de 4,13)
///kaymasi ekleniyor: cizim noktasi sprite'in sag ust kosesi (origin 42,0)
///ve olcek 2, yani yatayda (4-42)*2 = -76, dikeyde 13*2 = +26.
///Nefes alip verme her cagride yeniden okundugu icin el takip ediliyor.
F2El = function()
{
	var _ex, _ey;
	with (battle_enemy_engage)
	{
		_ex = x+p2_off_x+p2_shake_x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2-104;
		_ey = y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2+21;
	}
	return { ex : _ex, ey : _ey };
};

///Sans'in SOL kolunu firlatma pozuna sokar ve elinin ustune donen kemigi
///koyar. battle_turn_5 ayni isi yapiyor (spr_p2_arm_left_1 + o_fakebone);
///oradaki fark kutuya gore sabit bir nokta kullanmasi, burada kutu mizrak
///dalgalari boyunca boyut degistirdigi icin nokta elden hesaplaniyor.
///@arg kare	kolun eski haline donecegi kare
F2KolFirlat = function(_kare)
{
	audio_play_sound(snd_grab,2,false);
	battle_enemy_engage.p2_armleft_sprite = spr_p2_arm_left_1;
	var _el = F2El();
	instance_create_depth(_el.ex,_el.ey,-999,o_fakebone);
	f2_kol_geri = _kare;
};

///Sol kolu varsayilan sprite'ina dondurur ve elindeki kemigi kaldirir.
F2KolGeri = function()
{
	battle_enemy_engage.p2_armleft_sprite = spr_p2_arm_left;
	instance_destroy(o_fakebone);
	f2_kol_geri = -1;
};

///Elin ustundeki kemikten firlayan DONEN kemik: firlatildigi anda kalbin
///durdugu yere nisan aliyor, sonra duz bir yolda ilerliyor (battle_turn_5
///de ayni sekilde battle_soul'a nisan aliyor). Kendi ekseninde donuyor;
///donme, RegularBone'un 13. argumani (AngleSpeed).
///@arg hiz	firlatma hizi
///@arg don	derece/kare donme hizi
F2DonenKemik = function(_hiz,_don)
{
	audio_play_sound(snd_swift,2,false);
	var _el = F2El();
	var _yon = point_direction(_el.ex,_el.ey,battle_soul.x,battle_soul.y);
	var _b = RegularBone(_el.ex,_el.ey,28,lengthdir_x(_hiz,_yon),lengthdir_y(_hiz,_yon),0,0,1,0,0,1,0,_don,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	return _b;
};

///Dort koseden sirayla vuran Alphys cekici (battle_turn_18'deki tarif).
///along isareti UST duvarda TERS calisiyor; girinti 190 cunku cekicin
///pivotu carpma noktasinin 144 px yaninda olusuyor ve daha az girintide
///ekran disina tasiyor.
///@arg kose	0 = ust sol, 1 = ust sag, 2 = alt sag, 3 = alt sol
F2Cekic = function(_kose)
{
	var _sol = battle_board.x-battle_board.left+190;
	var _sag = battle_board.x+battle_board.right-190;
	var _ust = battle_board.y-battle_board.up;
	var _alt = battle_board.y+battle_board.down;
	switch (_kose)
	{
		case 0:  AlphysHammer(1,_sol,_ust,-1,1,1); break;
		case 1:  AlphysHammer(1,_sag,_ust, 1,1,1); break;
		case 2:  AlphysHammer(0,_sag,_alt,-1,1,1); break;
		default: AlphysHammer(0,_sol,_alt, 1,1,1); break;
	}
};

// spear1 dalgasinin salvo sayaclari: aralik sabit degil, her salvoda
// kisaliyor (bkz. Spear1Gap).
f2_s1_next = -1;
f2_s1_n = 0;
f2_s1_ang = 0;

//==========================================================================
// FAZ 2 -- 5. KISIM (son kirmizi/mavi) yardimcilari
//==========================================================================

///Soldan gelen 6'li kemik grubu. Kutunun alt kenarina oturup saga
///ilerliyorlar. Normal boy 105, kutu yuksekligi 130 (up+down) oldugu icin
///ustte 25 px'lik gecilebilir bir bosluk kaliyor.
///Uzama artik gruba ait degil: F2GrupVur ekrandaki butun gruplari ayni
///anda kaldirdigi icin kemikler f2_grup ile isaretleniyor.
///@arg hiz	yatay hiz
F2AltGrup = function(_hiz)
{
	var _x = (battle_board.x-battle_board.left)-5;
	var _y = (battle_board.y+battle_board.down)-2;
	for (var _i = 0; _i < 6; _i++)
	{
		var _b = RegularBone(_x-_i*14,_y,105,_hiz,0,0,0,0,1,1,0,0,0,true);
		_b.f2_grup = true;
	}
};

///SENKRON VURUS: o an ekranda olan butun gruplar -- kac tane olurlarsa
///olsunlar, kutunun neresinde olurlarsa olsunlar -- ayni anda 152'ye
///uzayip ust duvara carpiyor, sonra 105'e geri iniyorlar.
///DIKKAT: Anim_Create'in 6. argumani bitis degeri degil DEGISIM miktari,
///yani 105 -> 152 icin +47, geri inmek icin -47 yaziliyor.
///Zamanlama: 8 kare cikis, 44 kare yukarida, 8 kare inis = 60 kare (1 sn)
///uzun. F2GrupVur 120 karede bir cagrildigi icin kalan 60 kare de kisa,
///yani kemikler yaklasik saniyede bir durum degistiriyor.
F2GrupVur = function()
{
	if (instance_number(battle_regularbone) <= 0) { return; }
	with (battle_regularbone)
	{
		if (variable_instance_exists(id,"f2_grup"))
		{
			Anim_Destroy(id,"_length");
			Anim_Create(id,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,105, 47,8);
			Anim_Create(id,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN ,152,-47,8,52);
		}
	}
	audio_play_sound(snd_stab,2,false);
};

///Kutunun uzerinden KALBE nisan alip asagi ates eden ince blaster.
///1. kisimdaki F2UstBlaster'dan farki: o kutuya gore sabit bir x'e
///atesliyor, bu ise kalbin x'ini takip ediyor ve isini ince (XScale 1).
///@arg soldan	true ise sol ustten, false ise sag ustten giriyor
F2NisanBlaster = function(_soldan)
{
	var _bx = _soldan ? -50 : 690;
	return RegularBlaster(_bx,-50,battle_soul.x,(battle_board.y-battle_board.up)-70,270,270,30,5,1,2,40);
};

//==========================================================================
// FAZ 2 -- 6. KISIM (sari ruh) yardimcilari
//==========================================================================
// Sari ruh kucuk kutunun ortasina cakili duruyor, yer degistirmiyor; tek
// savunmasi sekiz yone nisan alip atesi. Motorun kurallari:
//   - kucuk mermi normal hedefte tukeniyor (9 kare bekleme)
//   - GUC VURUSU (32 kare sarj) normal hedefleri DELIP GECIYOR, yani bir
//     hattaki hedeflerin hepsini tek atista aliyor
//   - kucuk mermi buyuk hedeften sekiyor, buyugu sadece guc vurusu kiriyor
//   - aynaya atilan mermi geri donup RUHA HASAR VERIYOR
// Bolumun finali bu delme ozelligi uzerine kurulu: dort caprazdan dorder
// hedeflik hatlar geliyor, kucuk atisla yetismek matematiksel olarak
// mumkun degil, tek cozum her hatta bir guc vurusu.

sari_on = false;
sari_t = 0;
sari_son = 1575;		/// son hedef 1495'te variyor, kalanin temizlenmesi icin pay

///Sari bolumu acar: kutuyu kucuk kareye indirip ruhu sariya cevirir.
F2SariBasla = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(40,40,40,40,45);
	battle_board.angle = 0;
	Battle_SetSoul(battle_soul_yellow_dr);
	Camera_Shake(4,4,3,3);

	sari_on = true;
	sari_t = 0;
};

///Bolum bitince ekranda kalan hedefleri ve mermileri kaldirir.
F2SariBitir = function()
{
	sari_on = false;
	with (battle_dr_target) { instance_destroy(); }
	with (battle_dr_shot) { instance_destroy(); }
};

//==========================================================================
// FAZ 2 -- 7. KISIM (turuncu ruh koridoru)
//==========================================================================
// Koridorun butun dagarcigi battle_turn_18'den birebir portlandi: karusel
// (bileklik), Konuk, kutular, zincir barlari, ziplama halkalari, yandan
// blasterlar. Isim cakismasi yok, hepsi tur 18'deki adlariyla duruyor.
// Farklar tur 20'ye ozgu: taban hiz 5 (tur 18: 4), pencereler dar, sapma
// genis, ziplama zincirleri uzun ve karusel geri geldi (tur 16'da vardi,
// tur 18'de hic kullanilmamisti).
//==========================================================================
// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

yol=0;
bolum=0;			// hangi bolume gelindi (bkz. Step_0)
atak_yol=14450;		// koridorun bittigi yol. Son zincir (J) 12675te
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

///Zincir barlarinin sapmasi ayarlanabilir hali. ChainRun'in ofsetleri
///[-20,20] ile sabit; burada disaridan veriliyor.
///Genis sapma + dar mavi pencere zincirin en zor hali: kalp 3 px/kare
///gidiyor, barlar arasi 105 px = 15 kare, yani 45 px yer degistirebiliyor.
///90 px'lik sicrama (-45 -> +45) tam sinirda, gecikeni zincir birakiyor.
///@arg count	kac bar
///@arg gap		barlar arasi dikey mesafe
///@arg w		mavi pencere genisligi
///@arg ofs		mavi pencerelerin x ofset dizisi
ChainRunX = function(_count,_gap,_w,_ofs)
{
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = DrBone(_ofs[_i % array_length(_ofs)],_w);
		_b.y = -40-_i*_gap;
	}
	audio_play_sound(snd_exclamation,0,false);
};

///Turuncu bolume gecis: ekran karariyor, karanlikta kutu koridor bicimini
///aliyor ve ruh turuncuya donuyor, sonra ekran geri aciliyor.
F2TuruncuBasla = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	// Ust kenar 360: kutunun tepesi y = -40, yani ekranin biraz disinda.
	// 320 iken tepe tam y=0 idi ve yukari giden kalp gorunur duvara
	// carpiyordu. Halka/bar dogus noktalari da kutunun tepesine bagli,
	// ikisi de ayni 40 px kadar kayiyor -- aralari bozulmuyor, sadece
	// ziplama bolumlerinin varislari 40 px geciyor (esikler ona gore).
	Battle_SetBoardSizeCubic(360,160,120,120,1);
	Battle_SetSoul(battle_soul_orange_dr);
	battle_soul.x = battle_board.x;
	battle_soul.y = 400;
	// Taban 4: koridorun butun sayilari (bar araliklari, kutu bosluklari,
	// serit sapmalari) bu hiza gore hesaplandi. 5 denendi ve uc pattern de
	// oynanamaz hale geldi -- sarj icin gereken 40 kare sabit oldugu halde
	// her sey %25 erken geliyordu.
	DrCorridor(false,4);
	bolum = 0;
	yol = 0;
};

//==========================================================================
// FAZ 2 -- 8. KISIM (siyah bosluk: uc karakter birden)
//==========================================================================
// Turuncu ruh yukari, ekran disina kayiyor; ekran BEYAZA patlayip RGB
// kayiyor; beyazin icinde kalp kirmiziya donuyor ve kutu ekranin tamami
// oluyor. Geriye siyah bir bosluk kaliyor ve ucu birden saldiriyor:
//   Sans    -- devasa dairesel kemikler (ice kapanan halkalar)
//   Alphys  -- yukaridan dusen yildirim boltlari; carpacak yuzey olmadigi
//              icin rastgele yuksekliklerde patliyorlar (serbest_y)
//   Papyrus -- hancerler, kemik sprite'i Papyrus (RegularBone 10. arg = 1)
//==========================================================================

son_on = false;
son_t = 0;
son_bitis = -1;		/// 8. kisim hangi karede bitti (9. kisim buna bakiyor)

///Kutunun ekrandaki tam sinirlari. Kutu 640x480'in tamami oldugu icin
///merkez (320,320): ust kenar 0, alt kenar 480.
F2Merkez = function() { return { x : battle_board.x, y : battle_board.y }; };

///SANS -- devasa dairesel kemik halkasi.
///Kemikler _r yaricapli bir cemberin uzerine diziliyor ve hepsi merkeze
///dogru _hiz ile geliyor: halka kapaniyor.
///Aci _a+90 ve boy yayin tamami: kemikler yarilcap dogrultusunda, uc uca
///degil yan yana duruyorlar; aralarindaki bosluklardan geciliyor. Kapi
///yok, butun araliklar acik.
///MERKEZ kutunun y'si DEGIL, kutunun GORSEL merkezi. Kutu 320 yukari /
///160 asagi oldugu icin battle_board.y = 320 ama ekranda kapladigi alan
///0..480, yani gorsel merkez 240. Merkez 320 alininca cemberin alt yayi
///ekranin 160 px altinda kaliyor ve cember eksik gorunuyordu.
///Yaricap da bu yuzden en fazla 240: ekranin yuksekligi 480.
///@arg r			yaricap
///@arg n			kemik sayisi
///@arg hiz			merkeze yaklasma hizi
///@arg baslangic	ilk kemigin acisi -- her halkada donduruluyor ki
///					araliklar hep ayni yerde olmasin
F2Cember = function(_r,_n,_hiz,_baslangic)
{
	// Kutunun ekranda kapladigi alanin orta noktasi (bkz. yukaridaki not).
	var _my = (battle_board.y-battle_board.up)+(battle_board.up+battle_board.down)/2;
	var _boy = (2*pi*_r)/_n+8;
	for (var _i = 0; _i < _n; _i++)
	{
		var _a = _baslangic+_i*(360/_n);
		var _x = battle_board.x+lengthdir_x(_r,_a);
		var _y = _my+lengthdir_y(_r,_a);
		// AutoDestroy false: acik olsaydi ekranin kenarindaki kemikler
		// dogar dogmaz silinirdi.
		var _b = RegularBone(_x,_y,_boy,lengthdir_x(-_hiz,_a),lengthdir_y(-_hiz,_a),_a+90,0,1,0,0,1,0,0,false);
		Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,14);
	}
	audio_play_sound(snd_stab,2,false);
};

///ALPHYS -- rastgele yukseklikte patlayan yildirim boltu.
///serbest_y verildigi icin kutuya degmeyi beklemiyor (kutu zaten butun
///ekran); ekranin ustunden dusup verilen yukseklikte patliyor ve
///kavis cizen boltlar savruluyor.
F2SerbestBolt = function()
{
	var _x = irandom_range(60,580);
	var _b = AlphysBigBolt(_x,-70,270,7,7,2.4);
	_b.serbest_y = irandom_range(120,400);
	return _b;
};

///PAPYRUS -- hancer. battle_turn_18'deki Hancer ile ayni: once saydam ve
///yana bakarak beliriyor, aci yerine oturunca firliyor.
///Kemik sprite'i Papyrus (RegularBone'un 10. argumani = 1).
///@arg dx,dy		dogus noktasi
///@arg hsp,vsp		firlama hizi
///@arg ang			varis acisi
///@arg wait		firlamadan onceki bekleme
F2Hancer = function(_dx,_dy,_hsp,_vsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,58,0,0,_ang-110,0,1,0,1,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,18);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,5,_wait);
	return _b;
};

///Ekranin kenarindan belirip kalbe nisan alan hancer.
///@arg kenar	0 ust, 1 sag, 2 alt, 3 sol
F2HancerNisan = function(_kenar)
{
	var _x, _y;
	switch (_kenar)
	{
		case 0:  _x = irandom_range(60,580); _y = -40;  break;
		case 1:  _x = 680; _y = irandom_range(60,420);  break;
		case 2:  _x = irandom_range(60,580); _y = 520;  break;
		default: _x = -40; _y = irandom_range(60,420);  break;
	}
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	if (instance_exists(battle_soul)) { _cx = battle_soul.x; _cy = battle_soul.y; }
	var _d = point_direction(_x,_y,_cx,_cy);
	return F2Hancer(_x,_y,lengthdir_x(13,_d),lengthdir_y(13,_d),_d-90,30);
};

///Turuncu koridordan siyah bosluga gecisi baslatir: ruh yukari kayiyor.
F2SonKayma = function()
{
	Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN,battle_soul.y,-120-battle_soul.y,45);
};

///Beyaz patlama + RGB kaymasi.
F2SonBeyaz = function()
{
	fader.color = c_white;
	Fader_Fade(0,1,16);
	rgb_shake1(10,1,90);
	audio_play_sound(snd_noise,1,false);
	Camera_Shake(6,6,2,2);
};

///Beyazin icinde: kalp kirmizi, kutu ekranin tamami, siyah bosluk.
F2SonAc = function()
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(320,160,320,320,1);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y;
	F2SeritBasla();
	son_on = true;
	son_t = 0;
};

///Beyaz perde soluyor.
F2SonKapat = function()
{
	Fader_Fade(1,0,36);
};

///Fader rengini siyaha geri alir. Perde tamamen sondukten sonra cagrilmali:
///alfa hala > 0 iken cagrilirsa beyaz perde bir anda siyaha donerdi.
F2FaderSiyah = function()
{
	fader.color = c_black;
};

//==========================================================================
// KORIDOR SERITLERI -- "yukari gidiyoruz" hissi
//==========================================================================
// Koridorda kutu buyuyup dikey hale geliyor ama ekranda hareket eden tek
// sey asagi akan engeller; kalbin kostugu hissi zayif kaliyordu. Bu
// seritler tam tersi yone, asagidan yukariya suzuluyor ve gidis yonunu
// gosteriyor. Hizlari dunya carpanina bagli: dash atilinca onlar da
// hizlaniyor.
//==========================================================================

serit_on = false;
seritler = [];			// { x, y, boy, hiz, a }

///Bir serit uretir. yeni true ise ekranin altinda doguyor (donusum icin),
///false ise ekranin herhangi bir yerinde (ilk doldurma).
F2SeritYap = function(_yeni)
{
	return {
		x   : irandom_range(10,630),
		y   : _yeni ? (500+irandom(140)) : irandom_range(0,480),
		boy : irandom_range(30,90),
		hiz : irandom_range(6,13),
		a   : random_range(0.10,0.26)
	};
};

F2SeritBasla = function()
{
	seritler = [];
	for (var _i = 0; _i < 18; _i++) { array_push(seritler,F2SeritYap(false)); }
	serit_on = true;
};

F2SeritDur = function()
{
	serit_on = false;
	seritler = [];
};

//==========================================================================
// FAZ 2 -- 9. KISIM (mavi ruh: yukselen platform parkuru)
//==========================================================================
// Platformlar asagidan cikip yukari gidiyor. Kalp ustlerindeyken onlarla
// birlikte yukseliyor, yani beklemek olum: tavana varirsan olursun.
// Hayatta kalmanin tek yolu surekli bir alt basamaga atlamak. Basamaklar
// dar ve saga sola kaydirilmis, bazilarinin uzerinde kemik var -- yani
// bu bir DUSUS PARKURU: cok sayida zamanlama gerektiren ziplama.
//
// IKI ANI OLUM: ekranin altina dusmek ve tavana degmek.
//
// KUTUNUN TABANI EKRANIN COK ALTINDA (down 400 -> taban y=720). Onceden
// 160 idi ve taban tam ekranin dibindeydi: kalp asagi dusunce zemine
// konuyordu (battle_soul_blue on_board=1 yapiyor), yani "asagi dusme"
// olumu hic tetiklenmiyordu. Taban ekran disina alininca kalp gercekten
// dusuyor ve 500'u gecince oluyor.
//
// SAYILAR:
//   ziplama yuksekligi 4.8^2/(2*0.15) = 77 px, havada kalma ~64 kare
//   basamaklar arasi 100 px -> 100 px dusmek 37 kare, basamak basina
//   100/1.4 = 71 kare. Yani her basamakta bir ziplamalik vakit var.
//   Basamak uzerindeki kemik 44 px: ziplama yuksekliginin altinda.
//==========================================================================

mavi_on = false;
mavi_t = 0;
mavi_hiz = 1.4;			/// platformlarin yukselme hizi
mavi_adim = 0;			/// kacinci basamak uretildi

///Parkur basamaklari: [x, genislik, kemik]
///kemik: 0 = yok, -1 = sol ucta, 1 = sag ucta
///x'ler saga sola kaydirilmis, yani her basamakta yon degistirmek gerekiyor.
mavi_parkur = [
	// Kucuk basamaklar, aralarindaki bosluklar ziplama zorunlu.
	// Olcut PLATFORM cercevesinde (jump_speed 6.6, platform hizi 1.4):
	//   kenardan birakinca yatay erisim   90 px
	//   ziplayarak                       259 px
	// Butun bosluklar 95-235 arasi: hicbiri yuruyerek gecilmiyor,
	// hepsinde de en az 24 px pay var.
	//
	// ELEMAN: 0 duz, -1/+1 supuren kemik (hangi uctan basladigi),
	//         2 kemik duvari (basamak boyunca dizili, yuruyerek gecilmez)
	//
	// ILK YARI (0-14): kisa hoplar ve orta atlayislar, ritim kuruyor.
	// IKINCI YARI (15-25): buyuk ziplamalar (200-235 px) ve kemik
	// duvarlari. Uzerine yatay blasterler biniyor.
	[320, 120, 0],		// giris, genis
	[125,  80, 0],
	[300,  80, 1],
	[540,  70, 0],
	[370,  70,-1],
	[535,  70, 0],
	[300,  60, 1],
	[140,  60, 0],
	[300,  70,-1],
	[530,  70, 1],
	[365,  60, 0],
	[520,  60,-1],
	[285,  60, 1],
	[120,  70, 0],
	[290,  80,-1],
	//--- ikinci yari: buyuk ziplamalar ve duvarlar
	// Duvarlar bilerek ekranin farkli yerlerinde: 100 (sol uc), 195 (sol),
	// 270 (sol orta), 420 (sag orta), 570 (sag uc). Onceden besi de sag
	// yariya toplanmisti.
	[575,  90,-1],		// 200 px ziplama
	[270, 100, 2],		// 210 px -- DUVAR (sol orta)
	[495,  70, 1],
	[195,  90, 2],		// 220 px -- DUVAR (sol)
	[370,  60,-1],
	[100,  80, 2],		// 200 px -- DUVAR (sol uc)
	[420, 100, 2],		// 230 px -- DUVAR (sag orta)
	[185,  70, 1],
	[500,  90,-1],		// 235 px -- en buyuk ziplama
	[315,  70, 1],
	[570, 100, 2],		// DUVAR (sag uc)
	//--- INIS PLATFORMU: kursun son basamagi, FINAL BURADA BASLIYOR.
	// Genis ve kemiksiz: oyuncu buraya inince sinir duvarlari soluyor ve
	// kapanis sahnesi calisiyor. Onceki basamagin span sonu 620, bunun
	// basi 250 -> bosluk 110 px, ziplama zorunlu ama rahat.
	// Onceden dizi basa sardigi icin bu islevi indeks 0 goruyordu;
	// wrap kalkinca kayboldu, o yuzden ayri bir basamak olarak eklendi.
	[330, 160, 0]
];

///Bir basamak. Platformu doguruyor, uzerinde kemik varsa onu da kuruyor.
///@arg adim	[x, genislik, kemik] dizisi
F2Basamak = function(_adim)
{
	// sticky 1: kalp ustundeyken platformla birlikte tasiniyor
	// 505: kemik Center 0 ile platformun tabanindan 6 px yukarida
	// doguyor ve AutoDestroy y > 530'da siliyor. 540 olsaydi kemik
	// dogar dogmaz silinirdi.
	var _p = makeplatform(_adim[0],505,_adim[1],0,-mavi_hiz,1,0);
	_p.auto_destroy_dir = DIR.UP;
	// _adim[2]: 0 duz basamak, -1/+1 supuren kemik (hangi uctan
	// basladigi), 2 kemik duvari.
	// Boy 44: ziplama platformlara gore 90 px kaldiriyor, yani kemigin
	// ustunde 46 px bosluk kaliyor.
	if (_adim[2] == 2)
	{
		F2PlatDuvar(_p,_adim[1],44);
	}
	else if (_adim[2] != 0)
	{
		F2PlatKemik(_p,_adim[1],_adim[2],44);
	}
	return _p;
};

///Platformun uzerinde SUPUREN kemik.
///Kemik dik duruyor ve platformun bir ucundan digerine kayip geri
///donuyor -- silecek gibi degil, gercek bir supurme. Once tabanindan
///salinim yapiyordu (tek uca cakili), istenen bu degildi.
///
///Iki hareket ayni anda:
///  y  -> vspeed = -mavi_hiz  (platformla birlikte yukseliyor)
///  x  -> ANIM_MODE.PINGPONG  (uctan uca gidip geliyor)
///Ikisi ayri eksende oldugu icin catismiyorlar; kare kare kod gerekmiyor.
///
///BAYRAKLAR battle_turn_18'deki YelpazeKemik ile ayni: Inside 0,
///Center 0 (baslangic noktasi kemigin TABANI), Papyrus 1, AutoDestroy true.
///
///Supurme hizi ~1.2 px/kare: kalp 3 px/kare gittigi icin kemikten
///kacilabiliyor ama beklemek bedava degil. Dik durdugu icin yuksekligi
///hep _boy kadar; ziplama platformlara gore 77 px kaldirdigindan
///ustunden de atlanabiliyor.
///@arg plat	uzerinde supurecegi platform
///@arg gen		platform genisligi
///@arg yon		-1 sol uctan basliyor, +1 sag uctan
///@arg boy		kemik boyu (platforma gore ziplama yuksekliginin altinda)
F2PlatKemik = function(_plat,_gen,_yon,_boy)
{
	// Uclarda 10 px pay: kemik tam kenara dayanmiyor, kalbin basacagi
	// bir parca kaliyor.
	var _sol = _plat.x-_gen/2+10;
	var _sag = _plat.x+_gen/2-10;
	var _bas = (_yon < 0) ? _sol : _sag;
	var _deg = (_yon < 0) ? (_sag-_sol) : (_sol-_sag);
	var _sure = max(45,abs(_deg)/1.2);

	var _b = RegularBone(_bas,_plat.y-6,_boy,0,-mavi_hiz,0,0,0,1,1,0,0,0,true);
	Anim_Create(_b,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN_OUT,_bas,_deg,_sure,0,0,0,ANIM_MODE.PINGPONG);
	return _b;
};

///Platformun uzerine KEMIK DUVARI. Supuren kemikten farki: hareket etmiyor,
///bunun yerine basamagin boyunca birden fazla kemik diziliyor. Uzerinde
///yuruyerek ilerlenemiyor, basamagi tek ziplamada gecmek ya da kemiklerin
///arasindaki bosluklara basmak gerekiyor.
///Kemikler platformun hiziyla yukseliyor (bkz. F2PlatKemik).
///@arg plat	uzerine dizilecegi platform
///@arg gen		platform genisligi
///@arg boy		kemik boyu
F2PlatDuvar = function(_plat,_gen,_boy)
{
	var _kul = _gen-28;					// uclarda 14'er px pay
	var _n = max(2,floor(_kul/30)+1);
	var _ara = _kul/(_n-1);
	for (var _i = 0; _i < _n; _i++)
	{
		RegularBone(_plat.x-_kul/2+_i*_ara,_plat.y-6,_boy,0,-mavi_hiz,0,0,0,1,1,0,0,0,true);
	}
};

///Ekrani boydan boya kesen blaster. DORT KENARDAN da geliyor:
///yanlardan gelenler kalbin o andaki YUKSEKLIGINE, alttan/ustten
///gelenler kalbin o andaki SUTUNUNA nisan aliyor. Atesleme oncesi
///~45 karelik hazirlik var, yani "hemen yer degistir" diyen bir uyari.
///Aci: 0 saga, 180 sola, 270 asagi, 90 yukari.
///@arg kenar	0 sol, 1 sag, 2 ust, 3 alt
F2LabBlaster = function(_kenar)
{
	var _sx = 320;
	var _sy = 240;
	if (instance_exists(battle_soul))
	{
		_sx = battle_soul.x;
		_sy = battle_soul.y;
	}
	// Hedef noktalar ekranin icinde: blaster gorunur olmali, yoksa
	// telegraf islevini kaybediyor.
	switch (_kenar)
	{
		case 0:  return RegularBlaster(-80,_sy, 70,_sy,  0,  0,30,25,2,2,40);	// soldan saga
		case 1:  return RegularBlaster(720,_sy,570,_sy,180,180,30,25,2,2,40);	// sagdan sola
		case 2:  return RegularBlaster(_sx,-80,_sx, 60,270,270,30,25,2,2,40);	// ustten asagi
		default: return RegularBlaster(_sx,620,_sx,440, 90, 90,30,25,2,2,40);	// alttan yukari
	}
};

///Kirmizi bolum bitiyor: kalp bir platformun ustune konup maviye donuyor.
F2MaviBasla = function()
{
	// Kutu, ilk platform, sinir duvarlari ve seritler F2MaviKay'de
	// kuruldu; kalp de oraya kayarak geldi. Burada sadece ruh maviye
	// donuyor, yani isinlanma yok.
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = 292;
	battle_soul.dir = 270;			// yercekimi asagi
	battle_soul.jump_state = 2;		// ilk karede platforma konuyor

	// Ziplama gucu bu bolume ozel arttiriliyor (varsayilan 4.8).
	// Sebep: platformlar yukari giderken ziplama PLATFORMLARA GORE
	// olculuyor, yani etkili hiz 4.8-1.4 = 3.4 ve yukseklik sadece 39 px
	// kaliyordu -- uzun atlayislar imkansizdi.
	//
	// 6.6 -> etkili hiz 5.2, yukseklik 90 px, yatay erisim 259 px.
	// TAVAN: yukseklik basamak araligindan (109 px) kucuk kalmali, yoksa
	// bir UST basamaga ziplanip yukselisten kacilabilir. 90 < 109, 19 px
	// pay var. Bu yuzden ziplama tek basina arttirilamiyor; aralik da
	// 99'dan 109'a cikarildi (basamak periyodu 71 -> 78 kare).
	//
	// Bu bir ORNEK degiskeni: ruh her bolumde yeniden olusturuldugu icin
	// baska hicbir yeri etkilemiyor.
	battle_soul.jump_speed = 6.6;

	// Kontrol geri veriliyor (kayma sirasinda kapaliydi).
	battle_soul.moveable = 1;

	// Ilk platform artik yukselmeye baslayabilir: kalp uzerine kondu.
	if (instance_exists(mavi_ilk)) { mavi_ilk.move_y = -mavi_hiz; }

	mavi_on = true;
	mavi_t = 0;
	mavi_adim = 0;
	mavi_gecis = -1;
	mavi_final = false;
	final_t = 0;
	final_beyaz = 0;
	final_beyaz_hedef = 0;
	final_bitis = -1;
	final_dus1 = false;
	final_hiz = 0;
	final_kay = 0;
	final_kutu = false;
	sahte_on = false;
	mavi_son = noone;
};

///Ani olum. Normal oldurucu vurusla ayni yoldan gidiyor: cani 1'e cekip
///HURT olayini cagiriyoruz, Player_Hurt(4) onu 0'a indiriyor. Boylece
///olum makinasinin tamami (ses, sarsinti, oyun sonu) kendiliginden isliyor.
F2MaviOlum = function()
{
	if (!mavi_on) { return; }
	mavi_on = false;
	Player_SetHp(1);
	Battle_CallSoulEventHurt();
	Camera_Shake(6,6,6,6);
};

///Bolum biterken ortaligi toplar.
F2MaviBitir = function()
{
	mavi_on = false;
	sf_bekle = 50;			/// son atak bu kadar kare sonra basliyor
	F2SeritDur();
	with (battle_platform1) { instance_destroy(); }
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
};

//==========================================================================
// CAN GOSTERGESI -- kalbin uzerinde, sadece hasar alinca
//==========================================================================
// Normalde gorunmez. Can her azaldiginda tam opak oluyor, kisa bir sure
// oyle kalip sonra saydamlasip yeniden kayboluyor. Faz 2'nin TAMAMINDA
// calisiyor: kontrol bolume degil canin degismesine bagli.
//==========================================================================

can_onceki = -1;		/// gecen karedeki can (azalma boyle yakalaniyor)
can_alpha = 0;			/// 0 = gorunmez
can_bekle = 0;			/// tam opak kalacagi kare sayisi
can_bekle_max = 45;		/// hasardan sonra okunabilecek sure
can_sonme = 0.03;		/// kare basina saydamlasma

//==========================================================================
// SINIR DUVARLARI -- ekranin altina ve ustune kemik duvari
//==========================================================================
// Bu iki cizgiye deginca zaten oluyoruz; duvar bunu gorunur kiliyor.
// Kemikler Sans sprite'i (RegularBone 10. arg = 0) ve acilari rastgele:
// duz bir sira yerine dagilmis, ragged bir duvar cikiyor.
//==========================================================================

///Aci: RegularBone'da 0 = DIK, 90 = yatay. _sapma dikligin etrafindaki
///rastgele oynama payi (derece): 0 verilirse hepsi tam dik durur,
///30 verilirse -30..+30 arasi saga sola egilirler. Once irandom(359) ile
///tam rastgeleydi ve kemikler yere yatiyordu; duvarin yukari bakmasi icin
///sapma dar tutuluyor.
///@arg ust		true ust kenar, false alt kenar
///@arg n		kac kemik
///@arg boy		kemik boyu
///@arg sapma	diklikten sapma payi (derece)
F2SinirDuvar = function(_ust,_n,_boy,_sapma)
{
	// Kemikler olum cizgisiyle ayni yerde bitsin diye merkezleri
	// cizginin boy/2 kadar disinda: ust olum y<20, alt olum y>460.
	var _y = _ust ? (20-_boy/2) : (460+_boy/2);
	for (var _i = 0; _i < _n; _i++)
	{
		var _x = (640/_n)*(_i+0.5);
		var _a = (_sapma > 0) ? irandom_range(-_sapma,_sapma) : 0;
		array_push(mavi_sinir,RegularBone(_x,_y,_boy,0,0,_a,0,1,1,0,1,0,0,false));
	}
};

///Iki siniri birden kurar.
F2SinirlariKur = function()
{
	mavi_sinir = [];
	// 34 kemik: 640/34 = 19 px aralik, kemik sprite genisligi 13 px, yani
	// ust uste binip kesintisiz bir duvar cikiyor. 16 iken araliklar
	// aciktaydi.
	// Sapma 30: kemikler dik duruyor ama her biri biraz egik, yani
	// duzgun bir tarak yerine dogal duran bir duvar.
	F2SinirDuvar(true,34,24,30);
	F2SinirDuvar(false,34,24,30);
};

//==========================================================================
// KALBIN PLATFORMA SURUKLENMESI
//==========================================================================
// Isinlanma yerine: kirmizi ruh oldugu yerden platformun uzerine 40 karede
// kayiyor (kirmizi ruhta yercekimi yok, o yuzden kayarken dusmuyor).
// Kayma bitince mavi ruha geciliyor ve bolum basliyor.
//==========================================================================

mavi_gecis = -1;		/// mavi ruha gecilecek kare

///Kaymayi baslatir: ilk platformu kurar, ruhu uzerine dogru animasyonla
///goturur ve mavi ruha gecis karesini isaretler.
F2MaviKay = function()
{
	// Kutunun tabani ekranin cok altina aliniyor: yoksa dusen kalp
	// zemine konuyor ve "asagi dusme" olumu hic tetiklenmiyor.
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(320,400,320,320,1);

	F2SinirlariKur();
	F2SeritBasla();

	// Ilk platform kalbin inecegi yerde ve KAYMA BOYUNCA DURUYOR
	// (move_y = 0). Yukselseydi 40 karede 56 px cikar, kalp de onun ilk
	// konumuna gore hesaplanan yere inip platformun altinda kalirdi --
	// yakalayacak bir sey olmadigi icin dusup olurdu. Bolum baslayinca
	// F2MaviBasla platformu harekete geciriyor.
	mavi_ilk = makeplatform(battle_board.x,320,160,0,0,1,0);
	mavi_ilk.auto_destroy_dir = DIR.UP;

	// Kayma sirasinda oyuncu kontrolu kapali, yoksa animasyonla cakisiyor.
	if (instance_exists(battle_soul))
	{
		battle_soul.moveable = 0;
		Anim_Create(battle_soul,"x",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.x,battle_board.x-battle_soul.x,40);
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,292-battle_soul.y,40);
	}
	audio_play_sound(snd_bell,0,false);
	mavi_gecis = 40;
};

//==========================================================================
// LABIRENTIN FINALI
//==========================================================================
// Son platforma varilinca: sinir kemik duvarlari saydamlasip kayboluyor,
// kalp kirmiziya donup ekranin ortasina kayiyor, ekran beyaza patlayip
// RGB kayiyor ve bu olurken kalp maviye donusup hizla asagi iniyor.
//
// Duvarlar SOLDUKCE zararsizlasiyor: battle_regularbone sadece _alpha == 1
// iken carpisma kontrolu yapiyor, yani alfa duser dusmez temas kesiliyor.
// Ayrica finalde iki ani olum kontrolu de kapaniyor (mavi_final), yoksa
// hizla inen kalp alt cizgide olurdu.
//==========================================================================

mavi_sinir = [];		/// sinir duvarindaki kemikler (finalde soldurulecek)
mavi_final = false;		/// final basladi mi (olum kontrolleri ve uretim kapali)
final_t = 0;			/// final zincirinin sayaci
final_beyaz = 0;		/// finalin beyaz perdesinin alfasi (Draw_0 ciziyor)
final_beyaz_hedef = 0;	/// perdenin gitmek istedigi alfa (0 kapali, 1 tam beyaz)
final_beyaz_ac = 1/16;	/// kare basina acilma
final_beyaz_kapa = 1/30;	/// kare basina kapanma
final_dus1 = false;		/// ilk inis (ekranin altina) suruyor mu
final_kutu = false;		/// kutu her kare sabitlensin mi (finalin sonu)
sahte_on = false;		/// sahte kalp dusuyor mu (sadece cizim)
sahte_y = -40;			/// sahte kalbin y'si
sahte_hiz = 0;			/// sahte kalbin hizi
final_hiz = 0;			/// inisin o anki hizi
final_ivme = 0.15;		/// inisin ivmesi (kare basina)
final_dip = 375;		/// ikinci inisin duracagi y (kutu dibi 385, kalp yarim boy 10)
final_kay = 0;			/// ortaya kaymada kalan kare
final_kay_x = 0;		/// kare basina yatay adim
final_kay_y = 0;		/// kare basina dikey adim
final_bitis = -1;		/// inisten sonra bolumun kapanmasina kalan kare
mavi_son = noone;		/// son basamak (final onun uzerine konulunca basliyor)

///Sinir duvarlarini soldurur. Alfa 0'a inince kemikler hem gorunmez
///hem de zararsiz oluyor.
F2SinirSondur = function()
{
	for (var _i = 0; _i < array_length(mavi_sinir); _i++)
	{
		var _b = mavi_sinir[_i];
		if (instance_exists(_b))
		{
			Anim_Destroy(_b,"_alpha");
			Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,40);
		}
	}
};

///Final basliyor: uretim ve olum kontrolleri kapaniyor, duvarlar soluyor,
///platform uzerindeki kemikler ve diger tehlikeler kalkiyor.
F2MaviFinal = function()
{
	mavi_final = true;
	F2SinirSondur();

	// Platform kemikleri: sinir kemiklerinden farki dikey hizlarinin
	// olmasi (platformla birlikte yukseliyorlar). Sinir kemikleri duruyor,
	// onlara dokunmuyoruz -- onlar soluyor.
	with (battle_regularbone)
	{
		if (vspeed != 0) { instance_destroy(); }
	}
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
};

///Kalp kirmiziya donup ekranin ortasina kayiyor.
F2FinalKirmizi = function()
{
	Battle_SetSoul(battle_soul_red);
	battle_soul.moveable = 0;

	// Kayma ELLE suruluyor (bkz. Step_0). Bu finalde Anim_Create ile
	// yapilan her sey (beyaz perde, kutu boyutu, inisler) uygulanmadi;
	// hicbiri ona birakilmiyor.
	final_kay = 45;
	final_kay_x = (320-battle_soul.x)/45;
	final_kay_y = (240-battle_soul.y)/45;
};

///Finalin beyaz perdesi. 8. kisimdaki F2SonBeyaz fader'i kullaniyor,
///fader ise Draw GUI katmaninda cizildigi icin KALBIN DE ONUNE geciyor.
///Burada perdeyi kendimiz ciziyoruz (bkz. Draw_0): boylece beyazi
///cizdikten SONRA kalbi tekrar cizip onde tutabiliyoruz.
///RGB kaymasi ve kamera sarsintisi ayni.
F2FinalBeyaz = function()
{
	rgb_shake1(10,1,90);
	Camera_Shake(6,6,2,2);
	audio_play_sound(snd_noise,1,false);
	// Perde Anim sistemiyle degil ELLE suruluyor (bkz. Step_0).
	// Onceki hal Anim_Create(id,"final_beyaz",...) kullaniyordu ve perde
	// hic acilmiyordu -- ekran siyah kaliyordu.
	final_beyaz_hedef = 1;
};

///Kalp maviye donup hizla asagi iniyor. Inis animasyonla suruluyor:
///QUAD IN egrisi hizlanarak dusme hissini veriyor ve moveable kapali
///oldugu icin yercekimiyle cakismiyor.
F2FinalIn = function()
{
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = 320;
	battle_soul.y = 240;
	battle_soul.moveable = 0;
	battle_soul.dir = 270;
	battle_soul.jump_state = 2;
	// Inis ELLE suruluyor (bkz. Step_0).
	final_dus1 = true;
	final_hiz = 0;
	audio_play_sound(snd_stab,2,false);
};

//==========================================================================
// FINALIN IKINCI YARISI -- isinlanma, serbest dusus, acilis
//==========================================================================
// Kalp ekranin altindan cikti; simdi ekranin USTUNE isinlanip normal savas
// kutusunun dibine serbest dusuyor. Yere degdigi an beyaz perde ve RGB
// kalkiyor, yani sahne normale doner gibi aciliyor.
//==========================================================================

///Perde tam beyazken sahneyi bosaltir. Platformlar duruyordu ve kalp
///ikinci dususte onlara carpiyordu; perde opak oldugu icin yok olmalari
///gorunmuyor.
F2FinalTemizle = function()
{
	with (battle_platform1) { instance_destroy(); }
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	with (battle_gasterblaster) { instance_destroy(); }
	F2SeritDur();
};

///GERCEK savas ekranini kurar -- beyaz perdenin ARKASINDA.
///Kalp ilk inisiyle ekranin altina cikti; bu sirada perde tam opak
///oldugu icin sahneyi kimse gormeden hazirlayabiliyoruz: kutu normal
///savas olculerine doniyor ve gercek ruh kutunun dibindeki son yerine
///konuluyor. Boylece perde kalktiginda her sey zaten yerinde.
///
///moveable 0: perde kalkana kadar ruh kimildamasin.
F2FinalSahne = function()
{
	// F2MaviKay'in kurdugu kutu animasyonlari HALA CANLI ve her kare
	// up/down degerlerini 320/400'e geri yaziyorlardi; dogrudan atama da
	// bu yuzden tutmuyordu. Once onlari iptal ediyoruz.
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");

	// TIME = 0: dogrudan atama, animasyon yok.
	Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT,0);

	// Kutu bundan sonra her kare sabitleniyor (bkz. Step_0): iptal
	// edilemeyen bir animasyon kalirsa bile kutu yerinden oynamiyor.
	final_kutu = true;

	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = final_dip;		// kutunun dibi 385, kalbin yarim boyu 10
	battle_soul.dir = DIR.DOWN;
	battle_soul.moveable = 0;

	// Sahte kalp AYNI KAREDE basliyor: yoksa arada gercek ruh kutunun
	// dibinde yoktan bitmis gibi gorunuyor.
	sahte_on = true;
	sahte_y = -40;
	sahte_hiz = 0;
};

///Kalp kutunun dibine degdi: beyaz perde ve RGB kalkiyor.
F2FinalAcil = function()
{
	// Sahte kalp dibe vardi: gercek ruh zaten orada bekliyordu.
	// Kontrol geri veriliyor ve efektler kalkiyor.
	sahte_on = false;
	battle_soul.moveable = 1;
	Camera_Shake(8,8,1,1,1,1);
	final_beyaz_hedef = 0;
	with (obj_rgb) { instance_destroy(); }
	Camera_Shake(5,5,3,3);
	audio_play_sound(snd_stab,2,false);
	final_bitis = 60;
};

//==========================================================================
// FAZ 2 -- SON ATAK (atak20.gif'in birebir karsiligi)
//==========================================================================
// Butun sayilar atak20.gif'ten OLCULDU (ffmpeg ile 640x480'e indirilmis
// karelerin piksel taramasi). GIF 960x720 = oyunun 1.5 kati, 1740 kare /
// 29 sn = 60 fps; oyun da 60 fps (battle_enemy_engage/Step_0 icinde
// game_set_speed(60)). Yani GIF KARE NUMARASI = sf_t, olculen piksel
// degerleri de dogrudan oyun koordinati.
//
// KUTU OLCULERI
// Cerceve oyun dikdortgeninin 5 px DISINA ciziliyor
// (battle_board_extra/drawBorder), o yuzden GIF'te olculen DIS kenardan
// 5 px iceri girip up/down/left/right buluyoruz.
//   kare kutu : dis x 238-402, y 227-391 -> ic 243-397 / 232-386
//               -> up 88, down 66, left 77, right 77   (merkez 320,309)
//   koridor   : dis y 265-368, tam genislik
//               -> up 50, down 43, left 340, right 340
//   yarim kor.: dis sag kenar 410 -> right 85
// Kare kutunun merkezi 309, yani board.y = 320'nin 11 px USTUNDE. GIF'te
// oyle: up ve down bilerek esit degil.
//
// ZAMAN CIZELGESI (sf_t = GIF kare numarasi)
//     0- 23  kare kutu, kirmizi ruh (Sans'in son repligi bizde daha once)
//    24      ruh maviye doner, RASTGELE bir kenara slam
//    34-178  uc slam turu: kirmizi uyari seridi -> kemik taragi
//   151-345  ekrani DIKEY gecen 200 px'lik uzun kemikler, iki serit
//   173      ruh kirmiziya doner (kare kutuda serbest)
//   305      ruh mavi GORUNUR ama serbest hareket eder (GIF'te yercekimi yok)
//   333-433  kutu koridora acilir: once sag kenar, 20 kare sonra sol + dikey
//   432-607  koridor: 60.5 px arayla tavan/taban kemik ciftleri; aradaki
//            36 px'lik bosluk 13 kemiklik sinus dalgasi cizer
//   631-786  koridor: 9 adet 3'lu kemik grubu (tavan/taban donusumlu)
//   811-858  koridor: 30 px arayla daralan huni (bosluk 76 -> 30)
//   898-926  koridor sagdan kapanir (dis sag kenar 639 -> 410); ayni
//            karede ruh GERCEK mavi ruha donup saga slam ediliyor, yani
//            sag duvara yapisip oradan ziplayarak geciyor
//   978-999  yarim koridorda kirmizi uyari seridi (sag, 48 px)
//  1002-1030 sagdan kemik taragi (50 px)
//  1031-1055 EKRAN TAMAMEN SIYAH (25 kare, UI dahil)
//  1056      kare kutu geri gelir, mavi ruh kutunun dibinde
//  1058-1388 dort tarak turu daha (uyari bu sefer cogunlukla IKI kenarda).
//            Turlarin ARASINDA da 25 karelik tam siyah perde var ve slam
//            perdenin arkasinda atiliyor; bu yuzden GIF'in kare numaralari
//            burada +0 / +25 / +50 / +75 kaymis durumda:
//              tur A 1058/1093   siyah 1108-1133
//              tur B 1141/1178   siyah 1190-1215
//              tur C 1224/1262   siyah 1274-1299
//              tur D 1306/1344
//  1344      ruh kirmiziya doner
//  1356-1775 dev gaster blaster halkasi (r=190, 2.7 derece/kare, 2 karede bir)
//  1925      atak biter, kapanis diyalogu (halkanin kesilmesiyle arasindaki
//            150 kare son isinlarin sonmesi icin)
//==========================================================================

sf_on = false;			/// son atak suruyor mu
sf_t = 0;				/// son atagin sayaci (GIF kare numarasiyla ayni)
sf_bekle = -1;			/// bir onceki kisim bittikten sonra kalan kare

sf_grad = 1;			/// arka plan gradientinin alfasi (1 -> 0 soluyor)
sf_grad_hedef = 1;		/// Undertale'de arka plan siyah; gradient sifira
						/// inince bizde de oyle oluyor.

sfb_on = false;			/// Sans'in sahte bacaklari ciziliyor mu (Draw_0)

// Koridorda GIF'te kalp MAVI gorunuyor ama yercekimi yok: iki eksende de
// serbest hareket ediyor (kare kare izlendi, parabol yok, sabit hizla
// inip cikiyor). Motorun mavi ruhu yercekimli oldugu icin orada SERBEST
// (kirmizi) ruh kullanip sadece sprite'ini maviye ceviriyoruz.
sf_mavi_gorunum = false;

//-------------------------------------------------------------- olculer
// Tek yerde dursunlar: hem Create hem Step bunlari kullaniyor.
SF_KARE_U = 88;  SF_KARE_D = 66;  SF_KARE_L = 77;  SF_KARE_R = 77;
SF_KOR_U  = 50;  SF_KOR_D  = 43;  SF_KOR_L  = 340; SF_KOR_R  = 340;
SF_KOR_YARIM_R = 85;	/// yarim koridorun sag kenari (dis 410)

// Kemik hitboxu sprite'tan KISA. battle_regularbone/Draw_0 kemigi
// image_yscale = L/18 ile CIZIYOR ama carpisma icin L/20 veriyor:
//   gorunen uzunluk = 15/18 = 0.833 x L
// Yani istenen GORUNEN boy icin _length = boy * 1.2 vermek gerekiyor.
sf_cz = 1.2;

//------------------------------------------------------- kutu gecisleri
// Kutu gecisleri ELLE suruluyor: bu turda Anim_Create kutuya uygulanmadi
// (finalde defalarca denendi), hedefe her kare lerp ile yaklasiyoruz.
// GIF'te kenarlar AYRI AYRI ve FARKLI surelerde hareket ediyor (333'te
// sadece sag kenar, 353'te sol+sag 16 karede ama dikey 80 karede), o
// yuzden dort kenarin her biri kendi gecisini tasiyor.
//   0 = up, 1 = down, 2 = left, 3 = right
sf_ken = [];
for (var _i = 0; _i < 4; _i++)
{
	array_push(sf_ken,{ v0 : 0, v1 : 0, t : 0, sure : 1, on : false });
}

//--------------------------------------------------- uyari ve tarak listeleri
// GIF'te tarak gelmeden once kutunun icinde ince KIRMIZI bir dikdortgen
// cerceve beliriyor: gelecek duvarin tam ayak izi. Ikinci yarida AYNI ANDA
// IKI kenarda birden cikiyor, o yuzden liste.
sf_uy = [];				/// {yon,kal,kalan}
sf_tk = [];				/// {yon,derin,t,gir,tut,cik,kemik}

//------------------------------------------------------- koridor kemikleri
// Koridorda her sey sagdan sola 15.1 px/kare gidiyor (GIF'ten olculdu:
// 60.5 px aralikli kemikler 4 karede bir doguyor).
SF_KOR_HIZ = 15.1;
SF_KOR_X = 645;			/// dogum noktasi (ekranin biraz disi)
sf_dalga_i = 0;			/// dalga kemiginin sira numarasi (sinus icin)
sf_huni_i = 0;			/// huni kemiginin sira numarasi

//---------------------------------------------------------- blaster halkasi
sf_bl_on = false;		/// halka suruyor mu
sf_bl_aci = 350;		/// GIF'te ilk blaster 350 derecede beliriyor
SF_BL_R = 190;			/// olculen halka yaricapi
SF_BL_DON = 2.7;		/// derece/kare (GIF: on kenar 2.7 derece/kare ilerliyor)
SF_BL_DUR = 1775;		/// halkanin uretimi bu karede kesiliyor
SF_BL_BITIS = 1925;		/// atagin bitisi. Aradaki 150 kare bilerek: son
						/// blaster ucup ates edip isini sondurene kadar
						/// ~125 kare geciyor, diyalog once acilirsa isini
						/// yarida kesiyordu.

//------------------------------------------------------------- siyah perde
SF_KARA = 25;			/// siyah perdenin suresi (GIF'te olculen 25 kare)

// Baslangictaki uc slam'in yonu. F2SfBasla her oynayista yeniden
// kariyor; uyari seridi ve tarak da hep slam'in geldigi kenardan
// geliyor, yani atagin mantigi ayni kaliyor.
sf_slam = [DIR.RIGHT,DIR.DOWN,DIR.LEFT];

//----------------------------------------------------------- kapanis diyalogu
// SATIR UZUNLUGU: balonun metin alani 197 px
// (battle_dialog_enemy/Step_0: xscale_box*47 = 4.2*47).
//   Papyrus (font 4 = font_papyrus) sabit genislikte, karakter basi
//   11 px + 1 px aralik = 12 px  ->  satir basina EN FAZLA 16 karakter.
//   Sans (font 3) ve Alphys (font 2) ~9 px  ->  ~21 karakter.
// Papyrus'un satirlari 18-20 karakterdi ve balondan tasiyordu; asagidaki
// replikleri 16'ya sigacak sekilde yeniden bolduk (sayfa sayisi artti,
// metin degismedi).
//
// Konusmaci kodlari (battle_dialog_enemy/Create_0):
//   0 = Sans    {font 3}{voice 3}{head N}   -- N icin p2_head_sprite
//   1 = Papyrus {font 4}{voice 4}{pap_head N}
//   2 = Alphys  {font 2}{voice 2}{alp_head N}
sf_dlg = -1;			/// diyalog sirasi (-1 = kapali)
sf_dlg_bekle = -1;		/// diyalogdan sonra tur kapanmadan onceki bekleme
sf_toz_pap = -1;		/// Papyrus dagilirken diyalogu bekleten sayac (-1 = kapali)
sf_toz_alp = -1;		/// Alphys icin aynisi

//------------------------------------------------------------ dagilma
// Yenilen karakter PIKSEL PIKSEL dagiliyor: sprite'lari kucuk kare
// parcaciklara bolunuyor, parcaciklar yukaridan asagi dogru sirayla
// koparak agir agir yukseliyor ve soluyor (bkz. F2SfToz ve Draw_0).
// Ton bilerek sakin: savrulma yok, parca ucusmuyor, sadece dagiliyor.
sf_dag = [];			/// o an dagilan karakterler

// Parcacik boyu KAYNAK pikseli cinsinden. Karakterler 2x cizildigi icin
// 2 -> ekranda 4x4 px'lik parcacik. 1 yapilirsa gercek piksel boyu olur
// ama cizim sayisi 4 katina cikar (Papyrus'ta ~1400 yerine ~5600).
SF_DAG_BLOK = 2;

SF_DAG_SUPUR = 54;		/// kopma cizgisi tepeden ayaklara kac karede iniyor
SF_DAG_OMUR = 52;		/// bir parcacigin koptuktan sonraki omru
SF_DAG_TAM = 10;		/// koptuktan sonra tam opak kaldigi kare
SF_DAG_YUK = 0.55;		/// ortalama yukselme hizi (px/kare)
SF_DAG_YAN = 0.40;		/// yanal suruklenme
SF_DAG_SAL = 1.0;		/// salinim genligi (px)
sf_toz_sure = SF_DAG_SUPUR+SF_DAG_OMUR;		/// efektin toplam suresi

sf_dlg_metin =
[
	"{speaker 0}{font 3}{voice 3}{head 20}*huff*...{pause} *puff*...{pause}{clear}{head 21}Freak...!{pause}{clear}{head 20}W-... What's wrong&with you?!{pause}{clear}{head 21}Why can't I win?!",
	"{speaker 1}{font 4}{voice 4}{pap_head 4}HEY...{pause} SANS...?",
	"{speaker 0}{font 3}{voice 3}{head 25}Papyrus?",
	"{speaker 1}{font 4}{voice 4}{pap_head 1}LOOKS LIKE... I&USED UP ALL MY&MAGIC...{pause}{clear}IN THAT LAST&ATTACK.{pause}{clear}AND FOR GOOD&THIS TIME.{pause}{clear}I CAN'T GO ON&LIKE THIS.{pause}{clear}...{pause}{clear}{pap_head 4}SORRY, PAL...{pause}{clear}IT'S ALL UP TO&YOU NOW.",
	"{speaker 2}{font 2}{voice 2}{alp_head 5}W-... Weakling!{pause}{clear}{alp_head 1}I have... more than&enough magic to...&to...{pause}{clear}{alp_head 0}...",
	"{speaker 0}{font 3}{voice 3}{head 25}Alphys?",
	"{speaker 2}{font 2}{voice 2}{alp_head 0}Dang it...{pause}{clear}Sans...{pause}{clear}{alp_head 1}As your captain...&I have one last&order...{pause}{clear}Don't fail.",
];

//--------------------------------------------------------------- yardimcilar

///Kutuyu ANINDA verilen olcuye getirir.
///TIME = 0: SetBoardSize degeri dogrudan atiyor. Once eski animasyonlar
///iptal ediliyor, yoksa her kare eski hedefi geri yaziyorlar.
F2SfKutu = function(_u,_d,_l,_r)
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	for (var _i = 0; _i < 4; _i++) { sf_ken[_i].on = false; }
	Battle_SetBoardSizeCubic(_u,_d,_l,_r,0);
};

///TEK bir kenari _sure kare icinde hedefe goturur (bkz. Step_0).
///GIF'te kenarlar bagimsiz hareket ediyor: 333'te sadece sag kenar
///kayiyor, 353'te sol ve sag 16 karede giderken dikey kenarlar ayni anda
///80 karede gidiyor. Tek bir "kutu gecisi" bunu anlatamiyordu.
///@arg i	 0=up 1=down 2=left 3=right
F2SfKen = function(_i,_hedef,_sure)
{
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	var _k = sf_ken[_i];
	switch (_i)
	{
		case 0: _k.v0 = battle_board.up;    break;
		case 1: _k.v0 = battle_board.down;  break;
		case 2: _k.v0 = battle_board.left;  break;
		case 3: _k.v0 = battle_board.right; break;
	}
	_k.v1 = _hedef;
	_k.t = 0;
	_k.sure = max(1,_sure);
	_k.on = true;
};

//------------------------------------------------------------------ uyari
///Gelen kemik duvarinin UYARISI: kutunun icinde, duvarin kaplayacagi
///seridin uzerinde ince kirmizi bir dikdortgen cerceve (bkz. Draw_0).
///GIF'te ilk yarida serit 40-45 px, ikinci yarida 48 px ve AYNI ANDA IKI
///kenarda birden cikabiliyor -- o yuzden liste tutuluyor.
///@arg yon	 DIR.LEFT / DIR.RIGHT / DIR.UP / DIR.DOWN
///@arg kal	 seridin kalinligi
///@arg sure kac kare gorunecek
F2SfUyari = function(_yon,_kal,_sure)
{
	array_push(sf_uy,{ yon : _yon, kal : _kal, kalan : _sure });
};

///Verilen kenar icin GIF'te olculen serit kalinligi. Yatay kenarlarda
///(sol/sag) 40, dikey kenarlarda (ust/alt) 45 cikti.
F2SfUyKal = function(_yon)
{
	return ((_yon == DIR.UP) or (_yon == DIR.DOWN)) ? 45 : 40;
};

///Verilen yone slam. Slam yonu artik rastgele secildigi icin dort
///Battle_Slam* cagrisi tek yerde toplandi.
F2SfSlam = function(_yon)
{
	if (_yon == DIR.LEFT)  { Battle_SlamLeft();  }
	if (_yon == DIR.RIGHT) { Battle_SlamRight(); }
	if (_yon == DIR.UP)    { Battle_SlamUp();    }
	if (_yon == DIR.DOWN)  { Battle_SlamDown();  }
};

///Bir uyari seridinin kapladigi dikdortgen. Draw_0 bunu kullaniyor.
F2SfUyariAlan = function(_u)
{
	var _sol = battle_board.x-battle_board.left;
	var _sag = battle_board.x+battle_board.right;
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	if (_u.yon == DIR.LEFT)  { _sag = _sol+_u.kal; }
	if (_u.yon == DIR.RIGHT) { _sol = _sag-_u.kal; }
	if (_u.yon == DIR.UP)    { _dip = _tep+_u.kal; }
	if (_u.yon == DIR.DOWN)  { _tep = _dip-_u.kal; }
	// Koridorda kutu ekranin disina tasiyor; cerceve ekranda kalsin.
	_sol = max(_sol,0); _sag = min(_sag,639);
	return { l : _sol, r : _sag, u : _tep, d : _dip };
};

//------------------------------------------------------------------ tarak
///Bir kenardan iceri uzanan SIK kemik taragi -- GIF'te kutunun bir
///seridini kaplayan cizgili blok bu. Kemikler kenardan ICERI bakiyor ve
///12 px arayla diziliyor (GIF'te kare kutuda 13, koridorda 9 dis sayildi).
///Kemikler _length = 1 ile doguyor, boylari Step_0'da her kare
///guncelleniyor: tarak iceri KAYARAK giriyor ve geri cekiliyor.
F2SfTarakKemik = function(_yon)
{
	var _sol = battle_board.x-battle_board.left;
	var _sag = battle_board.x+battle_board.right;
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	var _dikey = (_yon == DIR.LEFT) or (_yon == DIR.RIGHT);

	// Center 0: verilen nokta kemigin TABANI, kemik _aci yonunde uzuyor.
	//   sol -> 270 (saga uzanir)   sag -> 90 (sola)
	//   ust -> 180 (asagi)         alt -> 0  (yukari)
	var _sx = 0, _sy = 0, _aci = 0;
	if (_yon == DIR.LEFT)  { _sx = _sol; _aci = 270; }
	if (_yon == DIR.RIGHT) { _sx = _sag; _aci = 90; }
	if (_yon == DIR.UP)    { _sy = _tep; _aci = 180; }
	if (_yon == DIR.DOWN)  { _sy = _dip; _aci = 0; }

	// Koridorda kutu ekranin disina tastigi icin tarak ekran sinirini
	// asmasin: dizilim aralikini ekrana kirpiyoruz.
	if (_dikey) { _tep = max(_tep,-6); _dip = min(_dip,486); }
	else        { _sol = max(_sol,-6); _sag = min(_sag,646); }

	// GIF'te disler 12 px arayla ve duvarin BIR UCUNDAN DIGERINE diziliyor
	// (kare kutuda 13-14 dis, koridorda 9 dis sayildi), o yuzden dagilim
	// kenardan kenara: ilk kemik bir ucta, son kemik obur ucta.
	var _uz = _dikey ? (_dip-_tep) : (_sag-_sol);
	var _n = max(2,round(_uz/12)+1);
	var _l = [];
	for (var _i = 0; _i < _n; _i++)
	{
		var _p = _i/(_n-1);
		var _bx = _sx;
		var _by = _sy;
		if (_dikey) { _by = lerp(_tep,_dip,_p); }
		else        { _bx = lerp(_sol,_sag,_p); }
		array_push(_l,RegularBone(_bx,_by,1,0,0,_aci,0,1,1,0,0,0,0,false));
	}
	return _l;
};

///Tarak baslatir. GIF'te olculen profil: boy _gir karede sifirdan
///_derin'e cikiyor, _tut kare sabit duruyor, _cik karede geri cekilip
///kayboluyor. Ilk yarida 4/3/3 ve derinlik ~25; ikinci yarida giris 9
///kare ve derinlik 42-52, cikis cogunlukla ani.
///@arg yon	  DIR.*
///@arg derin GORUNEN derinlik (px)
F2SfTarak = function(_yon,_derin,_gir,_tut,_cik)
{
	array_push(sf_tk,{
		yon : _yon, derin : _derin, t : 0,
		gir : max(1,_gir), tut : _tut, cik : _cik,
		kemik : F2SfTarakKemik(_yon)
	});
};

///Verilen kemik listesini yok eder.
F2SfSil = function(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { instance_destroy(_liste[_i]); }
	}
};

///Butun taraklari ve uyarilari temizler.
F2SfTarakTemizle = function()
{
	for (var _i = 0; _i < array_length(sf_tk); _i++) { F2SfSil(sf_tk[_i].kemik); }
	sf_tk = [];
	sf_uy = [];
};

//------------------------------------------------ uzun kemikler (2. asama)
///Ekrani DIKEY gecen uzun YATAY kemik. GIF'te iki serit var ve ikisi de
///198 px gorunen boyda, 5.56 px/kare hizla gidiyor:
///  sol serit  x 130-328 (merkez 229), yukaridan asagi
///  sag serit  x 331-529 (merkez 430), asagidan yukari
///Kemikler kutunun disina tasiyor (Inside 1).
///@arg mx	 seridin orta noktasi
///@arg asagi true ise yukaridan asagi
F2SfSuzul = function(_mx,_asagi)
{
	// Dogum y'si GIF'ten geri hesaplandi: asagi giden kemik 151. karede
	// ekranin ust kenarini kesiyor, yukari giden 176. karede alt kenari.
	var _y = _asagi ? -5 : 485;
	var _v = _asagi ? 5.56 : -5.56;
	// Aci 90 = yatay, Center 1 = verilen nokta kemigin ORTASI.
	return RegularBone(_mx,_y,198*sf_cz,0,_v,90,0,1,1,0,1,0,0,true);
};

//------------------------------------------------- koridor kemikleri (4-6)
///Koridorun tavanindan ve tabanindan gelen kemik CIFTI.
///@arg tip boslugun UST kenarinin y'si
///@arg bos boslugun yuksekligi (dalgada hep 36, hunide 76'dan 30'a iniyor)
F2SfKorCift = function(_tip,_bos)
{
	var _tep = battle_board.y-battle_board.up;
	var _dip = battle_board.y+battle_board.down;
	var _ust = _tip-_tep;				// tavan kemiginin gorunen boyu
	var _alt = _dip-(_tip+_bos);		// taban kemiginin gorunen boyu
	if (_ust > 2) { RegularBone(SF_KOR_X,_tep,_ust*sf_cz,-SF_KOR_HIZ,0,180,0,1,1,0,0,0,0,true); }
	if (_alt > 2) { RegularBone(SF_KOR_X,_dip,_alt*sf_cz,-SF_KOR_HIZ,0,0,0,1,1,0,0,0,0,true); }
};

///Dalga kemigi: GIF'te bosluk hep 36 px ama boslugun UST kenari 13
///kemiklik bir sinus cizerek 275 ile 324 arasinda gidip geliyor.
///Olculen dizi (432. kareden itibaren, 4 karede bir):
///   299 311 320 324 322 314 303 290 280 275 275 281 292 304 315 322 324
///asagidaki formulle 1-2 px icinde ortusuyor.
///@arg i kemigin sira numarasi (0 = ilk dogan)
F2SfKorDalga = function(_i)
{
	F2SfKorCift(299.5+24.5*dcos((_i-3)*(360/13)),36);
};

///Koridorda 3'lu uzun kemik grubu -- GIF'teki "III" bunlar. 15 px arayla
///uc kemik, tavandan ya da tabandan, gorunen boy ~49.
///@arg ust true ise tavandan sarkar
F2SfKorUclu = function(_ust)
{
	var _y = _ust ? (battle_board.y-battle_board.up) : (battle_board.y+battle_board.down);
	var _a = _ust ? 180 : 0;
	var _boy = _ust ? 49 : 48;
	for (var _i = 0; _i < 3; _i++)
	{
		RegularBone(SF_KOR_X+_i*15,_y,_boy*sf_cz,-SF_KOR_HIZ,0,_a,0,1,1,0,0,0,0,true);
	}
};

///Daralan huni: GIF'te 24 cift, 30 px arayla (2 karede bir). Her ciftte
///tavan kemigi 1 px asagi, taban kemigi 1 px yukari geliyor; boylece
///bosluk 76'dan 30'a iniyor. Olculen ilk cift T279/B355, son cift
///T302/B332 -- asagidaki iki formul tam bunlari veriyor.
///@arg j cift sira numarasi (0..23)
F2SfHuni = function(_j)
{
	F2SfKorCift(279+_j,76-2*_j);
};

//---------------------------------------------------------- siyah gecis
///GIF 1031: ekran UI dahil bir anda TAMAMEN siyah oluyor ve 25 kare oyle
///kaliyor. Fader Draw GUI katmaninda cizildigi icin butun sahneyi ortuyor.
F2SfSiyah = function()
{
	with (battle_regularbone) { instance_destroy(); }
	F2SfTarakTemizle();
	fader.color = c_black;
	Fader_Fade(0,1,1);
	audio_play_sound(snd_noise,1,false);
};

///Ikinci yaridaki DORT TARAK TURUNUN ARASINDAKI siyah perde.
///Buyuk gecisten (F2SfSiyah) farki: kutuya, ruha ve sahneye HIC
///dokunmuyor -- sadece perdeyi indirip slam'i atiyor. Boylece slam'in
///ucusu perdenin arkasinda kaliyor ve perde kalktiginda kalp yeni
///duvarina yapismis oluyor.
///@arg yon slam yonu
F2SfKara = function(_yon)
{
	fader.color = c_black;
	Fader_Fade(0,1,1);
	audio_play_sound(snd_noise,1,false);
	F2SfSlam(_yon);
};

///Turlar arasi siyah perde kalkiyor.
F2SfKaraBit = function()
{
	Fader_Fade(1,0,1);
	Camera_Shake(4,4,2,2);
};

///Perde kalkiyor: kare kutu geri geliyor, mavi ruh kutunun dibinde.
///Buradan sonra ruh GERCEK mavi ruh (yercekimli), sahte mavi gorunum
///kapaniyor -- acik kalirsa Step_0 her kare image_angle'i 90'a yazip
///mavi ruhun kendi yercekimi yonunu ezerdi.
F2SfSiyahBit = function()
{
	sf_mavi_gorunum = false;
	F2SfKutu(SF_KARE_U,SF_KARE_D,SF_KARE_L,SF_KARE_R);
	Battle_SetSoul(battle_soul_blue);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y+battle_board.down-8;
	battle_soul.dir = DIR.DOWN;
	battle_soul.jump_state = 0;
	battle_soul.moveable = 1;
	Fader_Fade(1,0,1);
	Camera_Shake(4,4,2,2);
};

//------------------------------------------------------- blaster halkasi
///Halkanin BIR blasterini dogurur. Blaster kendi acisinda ekranin
///disindan (r=400) gelip r=190'a oturuyor ve kutunun merkezine nisan
///aliyor. GIF'te yeni blasterler hem daha uzakta hem daha ileri acida
///duruyor, yani zincir disari dogru kivriliyor -- bu tam olarak o.
///Olculen boyut ~83x40 px; sprite 57x43 oldugu icin
///image_xscale 1.5 (YScale argumani), image_yscale 0.9 (XScale argumani).
F2SfBlaster = function()
{
	// Halkanin merkezi kutunun GORSEL merkezi. Kare kutuda up 88 / down 66
	// oldugu icin gorsel merkez board.y degil, 11 px yukarisi (GIF'te
	// olculen 320,309) -- halka ve isinlar oraya gore.
	var _cx = battle_board.x;
	var _cy = battle_board.y-battle_board.up+(battle_board.up+battle_board.down)/2;
	var _hx = _cx+lengthdir_x(SF_BL_R,sf_bl_aci);
	var _hy = _cy+lengthdir_y(SF_BL_R,sf_bl_aci);
	var _bx = _cx+lengthdir_x(400,sf_bl_aci);
	var _by = _cy+lengthdir_y(400,sf_bl_aci);
	RegularBlaster(_bx,_by,_hx,_hy,point_direction(_bx,_by,_cx,_cy),
		point_direction(_hx,_hy,_cx,_cy),20,5,0.9,1.5,30);
};

///Halkayi baslatir. GIF 1281: ilk blaster 350 derecede beliriyor, halka
///saat yonunun TERSINE 2.7 derece/kare doniyor ve 2 karede bir yeni
///blaster geliyor. Ruh zaten 1269'da kirmiziya donmustu (kare kutunun
///icinde serbestce kacabilsin diye); burada ruha DOKUNMUYORUZ, yoksa
///Battle_SetSoul ruhu silip yeniden yaratir ve oyuncu yerinden oynardi.
F2SfHalka = function()
{
	sf_bl_on = true;
	sf_bl_aci = 350;
};

///Son atagi baslatir. GIF'in ilk karesi: kare kutu, kirmizi ruh.
F2SfBasla = function()
{
	F2SfKutu(SF_KARE_U,SF_KARE_D,SF_KARE_L,SF_KARE_R);
	Battle_SetSoul(battle_soul_red);
	battle_soul.x = battle_board.x;
	battle_soul.y = battle_board.y;
	battle_soul.moveable = 1;

	// Sans'in bacaklari: motorun kendi salinimi surface zincirinden
	// gecmedigi icin bacaklari Draw_0'da kendimiz ciziyoruz.
	battle_enemy_engage.p2_legs_alpha = 0;
	battle_enemy_engage.p2_legs_alpha1 = 0;
	sfb_on = true;

	// Baslangictaki uc slam her oynayista FARKLI: dort kenardan ucu
	// rastgele seciliyor, tekrar yok. Uyari seridi ve tarak da hep
	// slam'in geldigi kenardan geldigi icin atagin mantigi bozulmuyor --
	// sadece hangi duvara yapisacagin onceden bilinmiyor.
	sf_slam = [DIR.UP,DIR.DOWN,DIR.LEFT,DIR.RIGHT];
	for (var _i = array_length(sf_slam)-1; _i > 0; _i--)
	{
		var _j = irandom(_i);
		var _gec = sf_slam[_i];
		sf_slam[_i] = sf_slam[_j];
		sf_slam[_j] = _gec;
	}

	// Kalbin ustundeki can yazisi son atakta kapali (alttaki UI yeterli).
	// Atak baslarken hala ekranda duruyorsa aninda silinsin.
	can_alpha = 0;
	can_bekle = 0;

	sf_grad_hedef = 0;					// arka plan siyahlaniyor
	sf_on = true;
	sf_t = 0;
	sf_dalga_i = 0;
	sf_huni_i = 0;
	audio_play_sound(snd_bell,0,false);
};

//==========================================================================
// DAGILMA -- Papyrus ve Alphys yenilince
//==========================================================================
// Motorun kendi olum efekti (battle_death_particle) karakteri once yok
// edip arkasinda toz birakiyordu. Onun yerine karakter PIKSEL PIKSEL
// dagiliyor: her sprite parcasi SF_DAG_BLOK x SF_DAG_BLOK'luk kucuk kare
// parcaciklara bolunuyor, parcaciklar YUKARIDAN ASAGI dogru sirayla
// kopuyor ve agir agir yukselip soluyor.
//
// Ton bilerek sakin tutuldu: parcaciklar savrulmuyor, dagilma cizgisi
// yavas yavas ayaklara iniyor. Kollar da ayni sekilde dagiliyor -- butun
// halde ucup gitmiyorlar.
//
// Karakterler battle_enemy_engage tarafindan bir surface'e cizilip ekrana
// (x-320) kadar kaydirilarak birlestiriliyor; surface'in tepesi ekranin
// tepesine oturdugu icin DUNYA konumu = surface konumu + (x-320) (yatayda)
// ve dogrudan surface y'si (dikeyde). Sahte bacaklarda kullanilan hesabin
// aynisi. Dagilma basladigi an motorun kendi cizimi kapatiliyor
// (pap_alpha = 0) ve karakteri bu blok ciziyor (bkz. Draw_0).
//==========================================================================

///Bir dagilmanin parcaciklarini hazirlar: her sprite parcasini tarayip
///SADECE saydam olmayan bloklari listeye aliyor (bos bloklar hem cizim
///hem bellek israfi olurdu) ve her blogun dunya konumunu, kopma
///gecikmesini, suruklenme hizini hesapliyor.
///
///Tarama surface + buffer ile yapiliyor, o yuzden DRAW olayindan
///cagrilmali (Step icinde surface hedefi degistirmek guvenli degil).
///Surface acilamazsa butun bloklar aliniyor -- gorunum ayni, sadece bos
///bloklar da cizilir.
F2SfDagHazirla = function(_dg)
{
	for (var _pi = 0; _pi < array_length(_dg.parca); _pi++)
	{
		var _p = _dg.parca[_pi];
		var _w = sprite_get_width(_p.spr);
		var _h = sprite_get_height(_p.spr);

		// --- sprite'in alfa maskesini oku
		var _buf = -1;
		var _srf = surface_create(_w,_h);
		if (surface_exists(_srf))
		{
			surface_set_target(_srf);
			draw_clear_alpha(c_black,0);
			// Origin'i (xoffset,yoffset) noktasina koyunca sprite'in
			// sol-ust kosesi (0,0)'a oturuyor.
			draw_sprite(_p.spr,_p.img,sprite_get_xoffset(_p.spr),sprite_get_yoffset(_p.spr));
			surface_reset_target();
			_buf = buffer_create(_w*_h*4,buffer_fixed,1);
			buffer_get_surface(_buf,_srf,0);
			surface_free(_srf);
		}

		var _bx = [], _by = [], _wx = [], _wy = [], _vx = [], _vy = [], _bek = [];
		var _cos = dcos(_p.aci), _sin = dsin(_p.aci);

		for (var _y = 0; _y < _h; _y += SF_DAG_BLOK)
		{
			for (var _x = 0; _x < _w; _x += SF_DAG_BLOK)
			{
				// blokta gorunur piksel var mi
				var _dolu = (_buf < 0);
				if (!_dolu)
				{
					var _y2 = min(_y+SF_DAG_BLOK,_h);
					var _x2 = min(_x+SF_DAG_BLOK,_w);
					for (var _jy = _y; (_jy < _y2) and (!_dolu); _jy++)
					{
						for (var _jx = _x; _jx < _x2; _jx++)
						{
							if (buffer_peek(_buf,(_jy*_w+_jx)*4+3,buffer_u8) > 40)
							{
								_dolu = true;
								break;
							}
						}
					}
				}
				if (!_dolu) { continue; }

				// blogun sol-ust kosesinin DUNYA konumu
				var _ox = (_x-_p.xoff)*_p.ex;
				var _oy = (_y-_p.yoff)*_p.ey;
				var _pwx = _p.px+_ox*_cos+_oy*_sin;
				var _pwy = _p.py-_ox*_sin+_oy*_cos;

				// kopma sirasi: karakterin tepesinden ayaklarina iniyor
				var _o = clamp((_pwy-_dg.ust)/_dg.boy,0,1);

				array_push(_bx,_x);
				array_push(_by,_y);
				array_push(_wx,_pwx);
				array_push(_wy,_pwy);
				// Yanal suruklenme kucuk ve disari dogru: govdeden uzaklasan
				// parcaciklar disa aciliyor ama savrulmuyorlar.
				array_push(_vx,random_range(-SF_DAG_YAN,SF_DAG_YAN)
					+sign(_pwx-_dg.mx)*random_range(0,SF_DAG_YAN*0.6));
				array_push(_vy,-random_range(SF_DAG_YUK*0.35,SF_DAG_YUK*1.5));
				array_push(_bek,_o*SF_DAG_SUPUR);
			}
		}

		if (_buf >= 0) { buffer_delete(_buf); }

		_p.bx = _bx; _p.by = _by;
		_p.wx = _wx; _p.wy = _wy;
		_p.vx = _vx; _p.vy = _vy;
		_p.bek = _bek;
	}
	_dg.hazir = true;
};

///Papyrus ya da Alphys dagiliyor.
///@arg pap	true ise Papyrus, false ise Alphys
F2SfToz = function(_pap)
{
	var _e = battle_enemy_engage;
	var _kay = _e.x-320;
	var _py = _e.y;
	var _bx = _pap ? (_e.pap_draw_x+_e.pap_shake_x+_e.kay_x+_kay)
	               : (_e.alp_draw_x+_e.alp_shake_x+_e.kay_x+_kay);
	var _bob = _pap ? _e.pap_bob : _e.alp_bob;

	// Parca tanimlari. Ofsetler battle_enemy_engage/Draw_0'daki cizim
	// satirlarinin BIREBIR aynisi.
	//   px,py     : parcanin cizildigi nokta (dunya)
	//   xoff,yoff : sprite origin'i (quad ile cizilenlerde 0)
	//   ex,ey     : kaynak piksel basina olcek
	//   aci       : cizim acisi (0 ise donme yok)
	var _par = [];
	var _yap = function(_spr,_img,_px,_py,_xo,_yo,_ex,_ey,_aci)
	{
		return { spr:_spr, img:_img, px:_px, py:_py, xoff:_xo, yoff:_yo,
		         ex:_ex, ey:_ey, aci:_aci,
		         bx:[], by:[], wx:[], wy:[], vx:[], vy:[], bek:[] };
	};

	// SIRA ONEMLI: Draw_0 bu diziyi bastan sona geziyor, yani sonraki
	// parca oncekinin USTUNE ciziliyor. Dizilim battle_enemy_engage/
	// Draw_0'daki cizim sirasinin BIREBIR aynisi olmali, yoksa katmanlar
	// ters doner (kol govdenin onune gecer, bacaklar govdeyi orter).
	//   Papyrus : bacak -> kol -> govde -> kafa
	//   Alphys  : sag kol -> govde -> kafa -> goz -> sol kol
	if (_pap)
	{
		var _hs = _e.pap_head_sprite, _bs = _e.pap_body_sprite;
		var _ls = _e.pap_legs_sprite, _as = _e.pap_arm_sprite;
		// Bacaklar quad ile ciziliyor (136 x 100): origin yok, olcek farkli.
		array_push(_par,_yap(_ls,_e.pap_legs_image,_bx-68,_py-100+_bob,
			0,0,136/sprite_get_width(_ls),100/sprite_get_height(_ls),0));
		// Kol aci ile ciziliyor; parcaciklarin dunya konumu donduruluyor.
		array_push(_par,_yap(_as,_e.pap_arm_image,_bx-50,_py-110+_bob,
			sprite_get_xoffset(_as),sprite_get_yoffset(_as),2,2,_e.pap_arm_angle));
		array_push(_par,_yap(_bs,_e.pap_body_image,_bx-8,_py-86+_bob,
			sprite_get_xoffset(_bs),sprite_get_yoffset(_bs),2,2,0));
		array_push(_par,_yap(_hs,_e.pap_head_image,_bx-14,_py-164+_bob,
			sprite_get_xoffset(_hs),sprite_get_yoffset(_hs),2,2,0));
	}
	else
	{
		var _ahs = _e.alp_head_sprite, _abs = _e.alp_body_sprite;
		var _alz = _e.alp_armleft_sprite, _arz = _e.alp_armright_sprite;
		array_push(_par,_yap(_arz,0,_bx+46,_py-74+_bob,
			sprite_get_xoffset(_arz),sprite_get_yoffset(_arz),2,2,_e.alp_armright_angle));
		// Govde quad ile ciziliyor (134 x 122) ve bacaklari da iceriyor.
		array_push(_par,_yap(_abs,_e.alp_body_image,_bx-66,_py-122+_bob,
			0,0,134/sprite_get_width(_abs),122/sprite_get_height(_abs),0));
		array_push(_par,_yap(_ahs,_e.alp_head_image,_bx+22,_py-94+_bob,
			sprite_get_xoffset(_ahs),sprite_get_yoffset(_ahs),2,2,0));
		if (_e.alp_eye_visible)
		{
			var _es = _e.alp_eye_sprite;
			array_push(_par,_yap(_es,_e.alp_eye_image,_bx+54,_py-122+_bob,
				sprite_get_xoffset(_es),sprite_get_yoffset(_es),2,2,0));
		}
		array_push(_par,_yap(_alz,0,_bx-2,_py-96+_bob,
			sprite_get_xoffset(_alz),sprite_get_yoffset(_alz),2,2,_e.alp_armleft_angle));
	}

	// Karakterin tepesi: dagilma cizgisi buradan ayaklara (=_py) iniyor.
	// Her parcanin dort kosesine bakiyoruz, cunku donmus parcalarda en
	// ust nokta kosede olmayabilir.
	var _ust = _py;
	for (var _i = 0; _i < array_length(_par); _i++)
	{
		var _p = _par[_i];
		var _pw = sprite_get_width(_p.spr)*_p.ex;
		var _ph = sprite_get_height(_p.spr)*_p.ey;
		var _c = dcos(_p.aci), _s = dsin(_p.aci);
		for (var _k = 0; _k < 4; _k++)
		{
			var _ox = ((_k == 1) or (_k == 2)) ? (_pw-_p.xoff*_p.ex) : (-_p.xoff*_p.ex);
			var _oy = (_k >= 2) ? (_ph-_p.yoff*_p.ey) : (-_p.yoff*_p.ey);
			_ust = min(_ust,_p.py-_ox*_s+_oy*_c);
		}
	}

	array_push(sf_dag,{
		t : 0, hazir : false, parca : _par,
		ust : _ust, boy : max(1,_py-_ust), mx : _bx
	});

	// Motorun kendi cizimi kapaniyor: karakteri bundan sonra Draw_0'daki
	// dagilma blogu ciziyor.
	if (_pap) { _e.pap_alpha = 0; sf_toz_pap = sf_toz_sure; }
	else      { _e.alp_alpha = 0; sf_toz_alp = sf_toz_sure; }
	audio_play_sound(snd_vaporize,0,false);
};

///Atak bitti: ortalik toplaniyor ve kapanis diyalogu basliyor.
F2SfBitir = function()
{
	sf_bl_on = false;
	F2SfTarakTemizle();
	with (battle_regularbone) { instance_destroy(); }
	with (o_alphys_spear) { instance_destroy(); }
	// Blaster'in ISINI ayri bir nesne (battle_gasterblaster/Step_0) ve
	// cemberi besleyen uretec de ayri; sadece blasterlari silmek yetmiyor,
	// son isin diyalog kutusunun uzerinde takili kaliyordu.
	with (battle_gasterblaster) { instance_destroy(); }
	with (battle_gasterblaster_beam) { instance_destroy(); }
	with (battle_blaster_circle_setup) { instance_destroy(); }

	// Siyah gecisten kalan perde varsa kalksin.
	Fader_Fade(-1,0,10);

	// Kutunun UST kenari bilerek asagida (up 45, varsayilan 65 degil).
	// Kadro kutunun ust kenarina bagli duruyor
	// (battle_enemy_engage/Step_0: y = (battle_board.y-battle_board.up)-10)
	// ve o y yuksekligindeki bir surface'e ciziliyor. Papyrus'un kafasi
	// ayaklarindan 228 px yukarida oldugu icin y 232'nin altina dustugunde
	// kafasi surface'in disinda kaliyor, yani ekranin tepesinde kesiliyor.
	// up = 45 -> y = 265: kafanin tepesiyle ekran arasinda ~33 px pay var.
	F2SfKutu(45,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
	sf_on = false;
	sfb_on = false;
	battle_enemy_engage.p2_legs_alpha = 1;

	// {head N} etiketi _head_image'i yaziyor ve bu deger p2 kafasina
	// SADECE p2_head_sprite == spr_p2_head iken uygulaniyor
	// (battle_enemy_engage/Draw_0). spr_p2_idle'da kafa kendi dongusunu
	// oynatiyor ve ifadeler hic gorunmuyordu.
	battle_enemy_engage.p2_head_sprite = spr_p2_head;
	sf_dlg = 0;
};
