_timer=0;
_start=false;
cang=false;
canga=0;

don_hiz = 0;

wall = [];
sea = [];
sea_x = [];
rip_x = [];
rip_t = [];
fan = [];
plat = noone;

WallMake = function(_ust,_len,_warn,_sure)
{
	wall = [];
	var _w = battle_board.left+battle_board.right;
	var _n = ceil(_w/11)+1;
	var _x0 = battle_board.x-battle_board.left;
	var _y = _ust ? (battle_board.y-battle_board.up+2) : (battle_board.y+battle_board.down-2);
	var _ang = _ust ? 180 : 0;
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _n; _i++)
	{
		var _b = RegularBone(_x0+_i*11,_y,0,0,0,_ang,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,7,_warn);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_len,-_len,12,_warn+7+_sure);
		array_push(wall,_b);
	}

	// KIRMIZI/SARI UYARI SERIDI. Bu duvar RegularBoneWall degil, dogrudan
	// RegularBone ile kuruluyor -- nesnenin kendi seridi yok, sadece ses
	// vardi. Serit kemikler uzamaya baslayana kadar (_warn kare) yanip
	// sonuyor ve kutunun ilgili kenarina yapisiyor.
	var _uy = battle_warn(0,0,0,0,_warn);
	_uy.follow_dir   = _ust ? DIR.UP : DIR.DOWN;
	_uy.follow_thick = _len;
};

Salvo = function()
{
	var _y = battle_board.y+battle_board.down-2;
	var _len = [94,80,55,30];
	var _spd = [4.0,3.7,3.45,3.2];
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < 4; _i++)
	{
		RegularBone(battle_board.x+battle_board.right+20,_y,_len[_i],-_spd[_i],0,0,0,0,1,0,0,0,0,true);
		RegularBone(battle_board.x-battle_board.left-20,_y,_len[_i],_spd[_i],0,0,0,0,1,0,0,0,0,true);
	}
};

AimBlaster = function(_a,_sure,_bekle,_olcek)
{
	if (!instance_exists(battle_soul)) { return noone; }
	var _tx = battle_board.x+lengthdir_x(150,_a);
	var _ty = battle_board.y+lengthdir_y(150,_a);
	var _ang = point_direction(_tx,_ty,battle_soul.x,battle_soul.y);
	return RegularBlaster(battle_board.x+lengthdir_x(400,_a),battle_board.y+lengthdir_y(400,_a),_tx,_ty,_ang,_ang,_sure,_bekle,_olcek,2,44);
};

GridBeam = function(_yatay,_i,_ters)
{
	// SERIT MERKEZLERI GERCEK KENARLARDAN OLCULUYOR.
	// Eskiden hem yatay hem dikey seritler tek bir _o ofsetiyle ve KUTU
	// GENISLIGINDEN turetilerek battle_board.x/y'ye gore yerlesiyordu.
	// Bu ancak kutu KARE ve battle_board.y tam ortasindayken dogru: kutu
	// asimetrik olunca (up != down) seritler kutunun disina tasiyordu.
	// Artik yatay seritler kutu YUKSEKLIGINE, dikey seritler GENISLIGINE
	// bolunuyor ve ofset ust/sol KENARDAN olculuyor. Kare-merkezli kutuda
	// sonuc eskisinin birebir aynisi.
	var _yuk = battle_board.up+battle_board.down;
	var _gen = battle_board.left+battle_board.right;
	var _ly = (battle_board.y-battle_board.up)  +(_i+0.5)*_yuk/4;	/// yatay seridin y'si
	var _lx = (battle_board.x-battle_board.left)+(_i+0.5)*_gen/4;	/// dikey seridin x'i
	var _b;
	if (_yatay)
	{
		if (_ters) { _b = RegularBlaster(760,_ly,battle_board.x+battle_board.right+70,_ly,180,180,30,14,1.8,2,44); }
		else       { _b = RegularBlaster(-120,_ly,battle_board.x-battle_board.left-70,_ly,0,0,30,14,1.8,2,44); }
	}
	else
	{
		if (_ters) { _b = RegularBlaster(_lx,600,_lx,battle_board.y+battle_board.down+70,90,90,30,14,1.8,2,44); }
		else       { _b = RegularBlaster(_lx,-120,_lx,battle_board.y-battle_board.up-70,270,270,30,14,1.8,2,44); }
	}
	_b._counter = 0;
	_b.BlasterDuration = 44;
	_b._blast_cooldown = 14;
	_b._blast_duration = 30;
	_b.image_index = 0;
	return _b;
};

SeaMake = function(_count,_taban,_sure)
{
	sea = [];
	sea_x = [];
	rip_x = [];
	rip_t = [];
	var _w = battle_board.left+battle_board.right;
	var _gap = _w/_count;
	var _x0 = battle_board.x-battle_board.left+_gap/2;
	for (var _i = 0; _i < _count; _i++)
	{
		var _x = _x0+_i*_gap;
		var _b = RegularBone(_x,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_taban,_sure);
		array_push(sea,_b);
		array_push(sea_x,_x);
	}
	audio_play_sound(snd_exclamation,0,false);
};

RipMake = function(_x)
{
	array_push(rip_x,_x);
	array_push(rip_t,0);
};

SeaStep = function(_taban,_amp,_hiz,_sonme,_zaman)
{
	for (var _j = array_length(rip_t)-1; _j >= 0; _j--)
	{
		rip_t[_j] += 1;
		if (rip_t[_j] > 300)
		{
			array_delete(rip_t,_j,1);
			array_delete(rip_x,_j,1);
		}
	}

	var _n = array_length(sea);
	var _m = array_length(rip_t);
	for (var _i = 0; _i < _n; _i++)
	{
		if (!instance_exists(sea[_i])) { continue; }
		var _l = _taban;
		for (var _j = 0; _j < _m; _j++)
		{
			var _d = abs(sea_x[_i]-rip_x[_j]);
			var _f = rip_t[_j]-_d/_hiz;
			if (_f <= 0) { continue; }
			_l += _amp/(1+_d/_sonme)*exp(-_f/_zaman)*dsin(_f*9);
		}
		sea[_i]._length = max(2,_l);
	}
};

SeaClear = function()
{
	var _n = array_length(sea);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(sea[_i])) { instance_destroy(sea[_i]); }
	}
	sea = [];
	sea_x = [];
	rip_x = [];
	rip_t = [];
};

PlatStep = function()
{
	if (!instance_exists(plat)) { return; }
	var _sol = battle_board.x-battle_board.left+plat.width/2;
	var _sag = battle_board.x+battle_board.right-plat.width/2;
	if (plat.x < _sol) { plat.move_x = abs(plat.move_x); }
	if (plat.x > _sag) { plat.move_x = -abs(plat.move_x); }
};

FanSet = function(_count,_spd,_dist,_sure)
{
	fan = [];
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _count; _i++)
	{
		var _a = _i*(360/_count);
		var _b = RegularBone(battle_board.x+lengthdir_x(_dist,_a),battle_board.y+lengthdir_y(_dist,_a),0,0,0,_a+90,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_dist,_sure);
		array_push(fan,{ b:_b, a:_a, spd:_spd, d:_dist });
	}
};

FanStep = function()
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		var _f = fan[_i];
		if (!instance_exists(_f.b)) { continue; }
		_f.a += _f.spd;
		_f.b.x = battle_board.x + lengthdir_x(_f.d,_f.a);
		_f.b.y = battle_board.y + lengthdir_y(_f.d,_f.a);
		_f.b._angle = _f.a + 90;
	}
};

FanRetract = function(_time)
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		var _f = fan[_i];
		if (!instance_exists(_f.b)) { continue; }
		Anim_Create(_f.b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_f.d,-_f.d,_time);
		Anim_Create(_f.b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,_time);
	}
};

FanClear = function()
{
	var _n = array_length(fan);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(fan[_i].b)) { instance_destroy(fan[_i].b); }
	}
	fan = [];
};
