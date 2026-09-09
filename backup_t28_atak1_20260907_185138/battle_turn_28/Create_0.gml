/// EASY'YE OZEL PAPYRUS ATAGI ("DONEN ODA")
///
/// Sadece EASY'de oynaniyor: Difficulty_TurnList'in faz 2 EASY listesinde
/// t18'in hemen ardinda duruyor. HARD/NORMAL bu objeyi hic yaratmiyor.
///
/// Atak bes bolumden olusuyor, toplam 1080 kare (18 sn @60fps):
///   1)  50-240   Donen yercekimi. Her 90 derecede bir yeni kemik targi yeni
///                "zeminden" buyuyor, oda kademeli olarak "+" seklinde bir
///                koridora kapaniyor.
///   2) 242-500   Yercekimi SOLDA kaliyor. Sol duvar zemin, oyuncu dikey
///                kosuyor; donen capraz kemikler ve mavi/turuncu bant.
///   3) 500-736   Sol duvardan (yani zeminden) yukselen kemikler; oyuncu saga
///                zipliyor. Ortada sabit dikey kemik tavani.
///   4) 736-930   Kirmizi ruh, dar yatay koridor, turuncu/mavi merdiven.
///   5) 900-1030  Blaster finali: once "+", sonra "X".
///
/// Mavi ruhun 4 yonlu yercekimi motorda zaten var (battle_soul_blue/Step_0:
/// dir + battle_platform1.angle eslesmesi). Kemik duvarlari KATI DEGIL, o
/// yuzden her yercekimi yonu icin kemik uclarina bir battle_platform1
/// konuyor -- oyuncunun bastigi yer o.

_timer=0;
_start=false;
cang=false;
canga=0;

zemin=noone;
bant_mavi=noone;
bant_turuncu=noone;
bariyer=[];

// --- kutu kenarlari -------------------------------------------------------
T28IcSol = function() { return battle_board.x-battle_board.left; };
T28IcSag = function() { return battle_board.x+battle_board.right; };
T28IcTep = function() { return battle_board.y-battle_board.up; };
T28IcDip = function() { return battle_board.y+battle_board.down; };

T28Sol = function() { return T28IcSol()-5; };
T28Sag = function() { return T28IcSag()+5; };
T28Dip = function() { return T28IcDip()-2; };
T28Tep = function() { return T28IcTep()+2; };
T28Ust = function() { return T28IcTep()-5; };

T28Gen = function() { return battle_board.left+battle_board.right+20; };
T28Yuk = function() { return battle_board.up+battle_board.down+20; };

// Kutu icinde oransal konum (0 = tepe/sol, 1 = dip/sag).
T28Y = function(_o) { return T28IcTep()+(T28IcDip()-T28IcTep())*_o; };
T28X = function(_o) { return T28IcSol()+(T28IcSag()-T28IcSol())*_o; };

// --- kemik duvarlari ------------------------------------------------------
#macro T28_KEMIK_SAYISI 16

DuvarDip = function(_uzun,_uyari,_omur)
{
	return RegularBoneWall(DIR.DOWN,T28Gen(),T28_KEMIK_SAYISI,_uzun,T28Sol(),T28Dip(),_uyari,_omur,1,false);
};

DuvarTep = function(_uzun,_uyari,_omur)
{
	return RegularBoneWall(DIR.UP,T28Gen(),T28_KEMIK_SAYISI,_uzun,T28Sol(),T28Tep(),_uyari,_omur,1,false);
};

DuvarSag = function(_uzun,_uyari,_omur)
{
	return RegularBoneWall(DIR.RIGHT,T28Yuk(),T28_KEMIK_SAYISI,_uzun,T28Sag(),T28Ust(),_uyari,_omur,1,false);
};

DuvarSol = function(_uzun,_uyari,_omur)
{
	return RegularBoneWall(DIR.LEFT,T28Yuk(),T28_KEMIK_SAYISI,_uzun,T28Sol(),T28Ust(),_uyari,_omur,1,false);
};

// --- yercekimi + zemin ----------------------------------------------------
//
// battle_soul_blue kati zemini su sirayla ariyor: block -> tahta kenari ->
// battle_platform1. Kemikler kati olmadigi icin her yon degisiminde kemik
// uclarina bir platform konuyor; aci kontrolu (angle mod 180 == (dir+90)
// mod 180) yuzunden yatay yercekiminde platform 90 derece olmali.

ZeminSil = function()
{
	if (instance_exists(zemin)) { instance_destroy(zemin); }
	zemin = noone;
};

Zemin = function(_yon,_uzun)
{
	ZeminSil();

	var _px = battle_board.x;
	var _py = battle_board.y;
	var _ac = 0;

	switch (_yon)
	{
		case DIR.DOWN:  _py = T28IcDip()-_uzun; _ac =  0; break;
		case DIR.UP:    _py = T28IcTep()+_uzun; _ac =  0; break;
		case DIR.RIGHT: _px = T28IcSag()-_uzun; _ac = 90; break;
		case DIR.LEFT:  _px = T28IcSol()+_uzun; _ac = 90; break;
	}

	var _p = instance_create_depth(_px,_py,DEPTH_BATTLE.BULLET,battle_platform1);
	_p.width = T28Gen();
	_p.angle = _ac;
	_p.sticky = 0;
	_p.move_x = 0;
	_p.move_y = 0;
	_p.bounce_x = false;
	_p.auto_destroy = false;
	zemin = _p;
	return _p;
};

Yercekimi = function(_yon)
{
	if (instance_exists(battle_soul)) { battle_soul.dir = _yon; }
	Camera_Shake(4,4,2,2);
	audio_play_sound(snd_impact,2,false);
};

// --- tekil kemikler -------------------------------------------------------

/// Kutuyu bastan basa kesen yatay kemik (merkezden cizilir, sabit durur).
YatayKemik = function(_y,_uzun,_renk)
{
	return RegularBone(battle_board.x,_y,_uzun,0,0,90,_renk,0,1,1,1,1,0,false);
};

/// Kutuyu bastan basa kesen dikey kemik.
DikeyKemik = function(_x,_uzun,_renk)
{
	return RegularBone(_x,battle_board.y,_uzun,0,0,0,_renk,0,1,1,1,1,0,false);
};

/// Soldan giren, donerek ilerleyen capraz kemik cifti (GIF'teki "X").
CaprazX = function(_y,_hiz)
{
	RegularBone(T28Sol()-24,_y,44,_hiz,0, 45,0,0,1,1,1,1,1.7,true);
	RegularBone(T28Sol()-24,_y,44,_hiz,0,135,0,0,1,1,1,1,1.7,true);
	audio_play_sound(snd_swift,2,false);
};

/// Odayi supuren uzun donen kemik.
UzunDonen = function(_x,_hiz,_don)
{
	var _b = RegularBone(_x,battle_board.y,300,_hiz,0,irandom(180),0,0,1,1,1,1,_don,true);
	audio_play_sound(snd_stab,2,false);
	return _b;
};

/// Sol kenara civili, tek uctan donebilen tam boy kemik (mavi/turuncu bant).
/// _angle -90 = saga uzanan kemik (motor kurali: 0 yukari, 90 sola, -90 saga).
BantKemik = function(_y,_renk)
{
	var _b = RegularBone(T28Sol(),_y,T28Gen(),0,0,-90,_renk,0,1,1,0,1,0,false);
	audio_play_sound(snd_swift,2,false);
	return _b;
};

/// Zeminden (sol duvardan) yukselip geri inen kemik.
ZeminKemik = function(_y,_uzun,_omur)
{
	var _b = RegularBone(T28Sol(),_y,0,0,0,-90,0,0,1,1,0,1,0,false);
	Anim_Create(_b,"_length",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_uzun,8);
	Anim_Create(_b,"_length",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_uzun,-_uzun,8,_omur);
	audio_play_sound(snd_stab,2,false);
	return _b;
};

/// Kirmizi ruh bolumundeki turuncu/mavi merdiven kemikleri.
MerdivenKemik = function(_sag,_y,_renk,_hiz)
{
	var _x = _sag ? (T28Sag()+16) : (T28Sol()-16);
	var _h = _sag ? -_hiz : _hiz;
	return RegularBone(_x,_y,52,_h,0,90,_renk,0,1,1,1,1,0,true);
};

// --- blaster finali -------------------------------------------------------
//
// BlasterDuration kadar ucus + _blast_cooldown + ~20 kare sarj animasyonu
// sonra isin cikiyor; yani cagirmadan ~62 kare sonra vuruyor.
#macro T28_BLAST_YOL   40
#macro T28_BLAST_BEKLE  1
#macro T28_BLAST_SURE  55

/// "+" : sol, sag ve tepe blasteri.
ArtiBlaster = function()
{
	var _cx = battle_board.x;
	var _cy = battle_board.y;
	RegularBlaster(_cx-380,_cy,T28IcSol()-56,_cy,  0,  0,T28_BLAST_SURE,T28_BLAST_BEKLE,2.6,2.6,T28_BLAST_YOL);
	RegularBlaster(_cx+380,_cy,T28IcSag()+56,_cy,180,180,T28_BLAST_SURE,T28_BLAST_BEKLE,2.6,2.6,T28_BLAST_YOL);
	RegularBlaster(_cx,-80,_cx,T28IcTep()-56,270,270,T28_BLAST_SURE,T28_BLAST_BEKLE,2.6,2.6,T28_BLAST_YOL);
};

/// "X" : dort kose blasteri.
CarpiBlaster = function()
{
	var _l = T28IcSol()-52;
	var _r = T28IcSag()+52;
	var _t = T28IcTep()-52;
	var _d = T28IcDip()+52;
	RegularBlaster(_l-280,_t-280,_l,_t,315,315,T28_BLAST_SURE,T28_BLAST_BEKLE,2.4,2.4,T28_BLAST_YOL);
	RegularBlaster(_r+280,_t-280,_r,_t,225,225,T28_BLAST_SURE,T28_BLAST_BEKLE,2.4,2.4,T28_BLAST_YOL);
	RegularBlaster(_l-280,_d+280,_l,_d, 45, 45,T28_BLAST_SURE,T28_BLAST_BEKLE,2.4,2.4,T28_BLAST_YOL);
	RegularBlaster(_r+280,_d+280,_r,_d,135,135,T28_BLAST_SURE,T28_BLAST_BEKLE,2.4,2.4,T28_BLAST_YOL);
};

// --- temizlik -------------------------------------------------------------
Temizle = function(_blaster)
{
	with (battle_regularbone)     { instance_destroy(); }
	with (battle_regularbonewall) { instance_destroy(); }
	with (battle_platform1)       { instance_destroy(); }
	if (_blaster)
	{
		with (battle_gasterblaster)      { instance_destroy(); }
		with (battle_gasterblaster_beam) { instance_destroy(); }
	}
	zemin = noone;
	bant_mavi = noone;
	bant_turuncu = noone;
	bariyer = [];
};
