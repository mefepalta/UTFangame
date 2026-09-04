_timer=0;
_start=false;
cang=false;
canga=0;

fade_at = -1;

gate = [];
pend = [];
pend_gap = 0;
pend_t = 0;
pend_off = 0;
pend_in = 0;

Dagger = function(_dx,_dy,_len,_hsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-40,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,10);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-40,40,_wait);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,4,_wait);
	return _b;
};

GateLen = function(_p,_g,_ust)
{
	var _h = battle_board.up+battle_board.down;
	if (_ust) { return max(0,(_h-_p-_g/2)/0.7); }
	return max(0,(_p-_g/2)/0.7);
};

GateMake = function(_x,_hsp,_p,_g)
{
	var _bt = battle_board.y-battle_board.up+2;
	var _bb = battle_board.y+battle_board.down-2;
	var _a = RegularBone(_x,_bb,GateLen(_p,_g,false),_hsp,0,0,0,0,1,0,0,0,0,false);
	var _b = RegularBone(_x,_bt,GateLen(_p,_g,true),_hsp,0,180,0,0,1,0,0,0,0,false);
	array_push(gate,{ bot:_a, top:_b });
	return array_length(gate)-1;
};

GateGap = function(_i,_p,_g,_time)
{
	var _e = gate[_i];
	if (instance_exists(_e.bot))
	{
		var _t1 = GateLen(_p,_g,false);
		Anim_Create(_e.bot,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.bot._length,_t1-_e.bot._length,_time);
	}
	if (instance_exists(_e.top))
	{
		var _t2 = GateLen(_p,_g,true);
		Anim_Create(_e.top,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.top._length,_t2-_e.top._length,_time);
	}
};

GateStop = function(_i,_time)
{
	var _e = gate[_i];
	if (instance_exists(_e.bot)) { Anim_Create(_e.bot,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.bot.hspeed,-_e.bot.hspeed,_time); }
	if (instance_exists(_e.top)) { Anim_Create(_e.top,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.top.hspeed,-_e.top.hspeed,_time); }
};

GateTo = function(_i,_x,_time)
{
	var _e = gate[_i];
	if (instance_exists(_e.bot))
	{
		_e.bot.hspeed = 0;
		Anim_Create(_e.bot,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.bot.x,_x-_e.bot.x,_time);
	}
	if (instance_exists(_e.top))
	{
		_e.top.hspeed = 0;
		Anim_Create(_e.top,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.top.x,_x-_e.top.x,_time);
	}
};

GateMove = function(_i,_hsp,_time)
{
	var _e = gate[_i];
	if (instance_exists(_e.bot)) { Anim_Create(_e.bot,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.bot.hspeed,_hsp-_e.bot.hspeed,_time); }
	if (instance_exists(_e.top)) { Anim_Create(_e.top,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,_e.top.hspeed,_hsp-_e.top.hspeed,_time); }
};

GateClear = function()
{
	var _n = array_length(gate);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(gate[_i].bot)) { instance_destroy(gate[_i].bot); }
		if (instance_exists(gate[_i].top)) { instance_destroy(gate[_i].top); }
	}
	gate = [];
};

PendMake = function(_gap)
{
	var _bb = battle_board.y+battle_board.down-2;
	pend_gap = _gap;
	pend_t = 0;
	pend_off = 0;
	pend_in = 0;
	Anim_Create(id,"pend_in",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,1,44);
	var _a = RegularBone(battle_board.x-battle_board.left-24,_bb,152,0,0,0,0,0,1,0,0,0,0,false);
	var _b = RegularBone(battle_board.x+battle_board.right+24,_bb,152,0,0,0,0,0,1,0,0,0,0,false);
	pend = [_a,_b];
};

PendStep = function(_amp,_spd)
{
	pend_t += _spd;
	pend_off = _amp*dsin(pend_t);
	if (array_length(pend) < 2) { return; }
	var _gl = battle_board.x-battle_board.left-24;
	var _gr = battle_board.x+battle_board.right+24;
	if (instance_exists(pend[0])) { pend[0].x = lerp(_gl,battle_board.x-pend_gap/2+pend_off,pend_in); }
	if (instance_exists(pend[1])) { pend[1].x = lerp(_gr,battle_board.x+pend_gap/2+pend_off,pend_in); }
};

bars = [];

BarsSpawn = function(_spd)
{
	var _bt = battle_board.y-battle_board.up-6;
	var _a = RegularBone(battle_board.x-battle_board.left,_bt,4,0,_spd,270,0,0,1,0,0,0,0,true);
	var _b = RegularBone(battle_board.x+battle_board.right,_bt,4,0,_spd,90,0,0,1,0,0,0,0,true);
	array_push(bars,{ l:_a, r:_b });
};

BarsStep = function(_pay)
{
	var _bl = battle_board.x-battle_board.left;
	var _br = battle_board.x+battle_board.right;
	var _gl = _bl-24;
	var _gr = _br+24;
	var _lx = lerp(_gl,battle_board.x-pend_gap/2+pend_off,pend_in);
	var _rx = lerp(_gr,battle_board.x+pend_gap/2+pend_off,pend_in);
	var _tut = [];
	var _n = array_length(bars);
	for (var _i = 0; _i < _n; _i++)
	{
		var _e = bars[_i];
		var _var = false;
		if (instance_exists(_e.l))
		{
			_e.l.x = _bl;
			_e.l._length = max(0,(_lx-_pay-_bl)/0.833);
			_var = true;
		}
		if (instance_exists(_e.r))
		{
			_e.r.x = _br;
			_e.r._length = max(0,(_br-_rx-_pay)/0.833);
			_var = true;
		}
		if (_var) { array_push(_tut,_e); }
	}
	bars = _tut;
};

BarsClear = function()
{
	var _n = array_length(bars);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(bars[_i].l)) { instance_destroy(bars[_i].l); }
		if (instance_exists(bars[_i].r)) { instance_destroy(bars[_i].r); }
	}
	bars = [];
};

PendClear = function()
{
	var _n = array_length(pend);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(pend[_i])) { instance_destroy(pend[_i]); }
	}
	pend = [];
};

wall = [];

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
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,6,_warn);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_len,-_len,10,_warn+6+_sure);
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

WallClear = function()
{
	var _n = array_length(wall);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(wall[_i])) { instance_destroy(wall[_i]); }
	}
	wall = [];
};

