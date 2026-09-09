/// CYF (Create Your Frisk / Unitale) ATAK KOPRUSU
///
/// Kaynak ataklar Lua ile yazilmis bir CYF modundan bire bir cevriliyor.
/// Cevirinin butun kurallari burada; tur objeleri kaynaktaki sayilari
/// DEGISTIRMEDEN yaziyor, donusumu bu fonksiyonlar yapiyor.
///
/// 1) KARE HIZI. CYF varsayilan 30 fps, bu oyun 60 fps.
///      sure  x2      (tur Step_0'inda zaman damgalari zaten iki katiyla yazili)
///      hiz   /2      CYF_HIZ
///      ivme  /4      CYF_IVME
///
/// 2) KOORDINAT. CYF mermileri arena MERKEZINE gore ve Y YUKARI pozitif.
///    Bizde oda koordinati ve Y ASAGI pozitif:
///      x = battle_board.x + cx
///      y = battle_board.y - cy
///    CYF'in "mutlak" ekran koordinati da Y yukari (0,0 sol ALT):
///      x = ax          y = 480 - ay
///
/// 3) BOY. CYF kemik sprite'lari gercek piksel boyunda (bonew 150, bone 200,
///    b0 40). Bizim battle_regularbone 15 px'lik sprite'i _length/18 ile
///    olcekliyor, yani cizilen boy = _length * 0.833. Piksel boyu istenen
///    yerde _length = piksel * 1.2 (CYF_BOY).
///
/// 4) ACI. CYF sprite.rotation ile bizim _angle ayni yonde (CCW) ve kemikler
///    _center=1 ile ortadan cizildigi icin dogrudan gecirilebiliyor:
///    0 = dikey, 90 = yatay.
///
/// 5) ARENA. CYF Arena.Resize(w,h) -> Battle_SetBoardSizeCubic(h/2,h/2,w/2,w/2).
///    Kaynak ataklarin hepsi Arena.resize(150,150) kullaniyor -> 75,75,75,75.
///
/// 6) OMUR. CYF'te her mermi "timer" ile sayiliyor. Burada kemige cyf_omur
///    yaziliyor; turun Step_0'i her karede Cyf_OmurAdim() cagirip bitenleri
///    siliyor.

#macro CYF_HIZ   0.5
#macro CYF_IVME  0.25
#macro CYF_BOY   1.2

/// @desc CYF arena-goreli x -> oda x
function Cyf_X(_cx) { return battle_board.x + _cx; }

/// @desc CYF arena-goreli y (yukari +) -> oda y
function Cyf_Y(_cy) { return battle_board.y - _cy; }

/// @desc CYF mutlak ekran x -> oda x
function Cyf_AX(_ax) { return _ax; }

/// @desc CYF mutlak ekran y (0 = ekranin ALTI) -> oda y
function Cyf_AY(_ay) { return 480 - _ay; }

/// @desc CYF blaster acisi -> bizim RegularBlaster acisi.
/// gb.lua'da rotation 0 asagi ates ediyor; bizde 270 asagi.
function Cyf_Aci(_a) { return ((270 + _a) mod 360 + 360) mod 360; }

/// @desc CYF CreateProjectile(kemik) karsiligi.
///
/// @param _boy   CYF sprite piksel boyu (bonew 150, bone 200, b0 40)
/// @param _cx    arena-goreli x
/// @param _cy    arena-goreli y (yukari +)
/// @param _xv    CYF x hizi (kare basina)
/// @param _yv    CYF y hizi (yukari +)
/// @param _xcx   CYF x ivmesi
/// @param _ycy   CYF y ivmesi (yukari +)
/// @param _rot   CYF sprite.rotation
/// @param _rots  CYF donme hizi (kare basina derece)
/// @param _renk  0 beyaz, 1 mavi, 2 turuncu
/// @param _omur  CYF timer (kare); 0 verilirse omursuz
function Cyf_Kemik(_boy,_cx,_cy,_xv,_yv,_xcx,_ycy,_rot,_rots,_renk,_omur)
{
	var _b = RegularBone(
		Cyf_X(_cx), Cyf_Y(_cy),
		_boy*CYF_BOY,
		_xv*CYF_HIZ, -_yv*CYF_HIZ,
		_rot, _renk,
		0,        // _inside 0 -> tahta yuzeyine cizilir, CYF'teki mask ile ayni kirpma
		1,        // alpha
		1,        // papyrus stili kemik
		1,        // _center: ortadan cizilir, CYF sprite'i gibi
		0,        // _bottom 0: CYF kemiklerinin IKI ucunda da topuz var
		_rots*CYF_HIZ,
		false);

	// CYF her karede yv += ycy yapiyor. GameMaker'in kendi gravity'si
	// hspeed/vspeed'e ayni sekilde ekliyor, o yuzden vektoru oraya ceviriyoruz.
	if ((_xcx != 0) or (_ycy != 0))
	{
		var _ax = _xcx*CYF_IVME;
		var _ay = -_ycy*CYF_IVME;      // GML'de y asagi
		_b.gravity = point_distance(0,0,_ax,_ay);
		_b.gravity_direction = point_direction(0,0,_ax,_ay);
	}

	// CYF kemik sprite'lari 150-300 px, motorunki 15 px. Gerilerek cizilince
	// uclardaki topuzlar da bagintili buyuyup kayboluyor; uzun mod uclari
	// dogal boyda birakiyor (bkz battle_regularbone/Create_0 CizUzun).
	_b._uzun = true;

	if (_omur > 0) { _b.cyf_omur = _omur*2; }
	return _b;
}

/// @desc CYF blue.init() / blue.xinit(dir) karsiligi.
/// xinit sadece "ding" sesi + genisleyen kalp efekti ekliyor, gerisi ayni.
function Cyf_MaviRuh(_yon)
{
	instance_create_depth(0,0,0,battle_soul_blue_effect);
	Battle_SetSoul(battle_soul_blue);
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
	audio_play_sound(snd_ding,2,false);
}

/// @desc CYF blue.back() / blue.xback() karsiligi.
function Cyf_KirmiziRuh()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}

/// @desc CYF bullet.Move(dx,dy) -- tek kemik icin (y yukari +).
function Cyf_Hareket(_b,_dx,_dy)
{
	if (instance_exists(_b)) { _b.x += _dx*CYF_HIZ; _b.y -= _dy*CYF_HIZ; }
}

/// @desc CYF bullet.sprite.rotation += d
function Cyf_Don(_b,_d)
{
	if (instance_exists(_b)) { _b._angle += _d*CYF_HIZ; }
}

/// @desc Omru dolan kemikleri siler. Turun Step_0'inda her kare cagrilmali.
function Cyf_OmurAdim()
{
	with (battle_regularbone)
	{
		if (variable_instance_exists(id,"cyf_omur"))
		{
			cyf_omur -= 1;
			if (cyf_omur <= 0) { instance_destroy(); }
		}
	}
}

/// @desc CYF "bss" sprite'i: 485x300'luk hazir kemik targi.
///
/// Orijinal 44 kemik, 11 px araliklarla, her biri 300 px boyunda. Bizde tek
/// sprite yok, o yuzden ayni olculerde 44 kemik yaratiliyor. Donen targ icin
/// _rot verilir; kemikler merkez etrafinda dondurulur.
///
/// @returns kemik dizisi (Cyf_TargHareket ile toptan hareket ettirilir)
function Cyf_Targ(_cx,_cy,_rot)
{
	var _liste = [];
	var _x0 = Cyf_X(_cx);
	var _y0 = Cyf_Y(_cy);

	for (var _i = 0; _i < 44; _i++)
	{
		var _lx = -235.5 + _i*11;      // sprite merkezine gore kemik x'i
		var _px = _x0 + lengthdir_x(_lx,-_rot);
		var _py = _y0 + lengthdir_y(_lx,-_rot);

		var _b = RegularBone(_px,_py,300*CYF_BOY,0,0,_rot,0,0,1,1,1,0,0,false);
		_b._uzun = true;
		array_push(_liste,_b);
	}
	return _liste;
}

/// @desc Targi (veya herhangi bir kemik dizisini) CYF Move(dx,dy) gibi kaydirir.
function Cyf_TargHareket(_liste,_dx,_dy)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		var _b = _liste[_i];
		if (instance_exists(_b)) { _b.x += _dx*CYF_HIZ; _b.y -= _dy*CYF_HIZ; }
	}
}

/// @desc Kemik dizisini yok eder.
function Cyf_TargSil(_liste)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { instance_destroy(_liste[_i]); }
	}
}

/// @desc Kemik dizisinin rengini degistirir (CYF'teki SetVar("color",...)).
function Cyf_TargRenk(_liste,_renk)
{
	for (var _i = 0; _i < array_length(_liste); _i++)
	{
		if (instance_exists(_liste[_i])) { _liste[_i]._color = _renk; }
	}
}

/// @desc gb.New(x,y,x1,y1,angle,angle1,updatetimer,s1,s2,staytimer,...) karsiligi.
///
/// gb.lua isini soyle yapiyor: blaster hedefe dogru sureklenir, updatetimer-20
/// karede sarj animasyonu baslar, updatetimer karede ates eder, staytimer kadar
/// isin kalir. Bizim battle_gasterblaster'da sira: BlasterDuration ucus +
/// _blast_cooldown + 20 kare sarj -> ates. Ates ani ayni kalsin diye ucus
/// suresi geri hesaplaniyor.
///
/// Butun parametreler CYF birimlerinde (mutlak ekran koordinati, 30 fps kare).
function Cyf_Blaster(_x,_y,_x1,_y1,_ang,_ang1,_ates,_s1,_s2,_kal)
{
	var _ucus = _ates*2 - 21;          // 60 fps: ates ani = 2*_ates
	if (_ucus < 1) { _ucus = 1; }

	var _b = RegularBlaster(
		Cyf_AX(_x),  Cyf_AY(_y),
		Cyf_AX(_x1), Cyf_AY(_y1),
		Cyf_Aci(_ang1), Cyf_Aci(_ang),
		max(_kal*2,30),                // isin suresi
		1,                             // cooldown
		_s2, _s1,                      // RegularBlaster XScale->image_yscale, YScale->image_xscale
		_ucus);
	return _b;
}
