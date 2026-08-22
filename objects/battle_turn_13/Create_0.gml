_timer=0;
_start=false;
cang=false;
canga=0;

fade_at = -1;

wall = [];
dag_x = 0;

Dagger = function(_dx,_dy,_len,_hsp,_wait)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,270-40,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,10);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,270-40,40,_wait);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	return _b;
};

Gate = function(_p,_g,_spd,_sag)
{
	var _h = battle_board.up+battle_board.down;
	var _bt = battle_board.y-battle_board.up+2;
	var _bb = battle_board.y+battle_board.down-2;
	var _x = _sag ? (battle_board.x+battle_board.right+16) : (battle_board.x-battle_board.left-16);
	var _v = _sag ? -_spd : _spd;
	var _lf = max(0,(_p-_g/2)/0.7);
	var _lc = max(0,(_h-_p-_g/2)/0.7);
	if (_lf > 6) { RegularBone(_x,_bb,_lf,_v,0,0,0,0,1,0,0,0,0,true); }
	if (_lc > 6) { RegularBone(_x,_bt,_lc,_v,0,180,0,0,1,0,0,0,0,true); }
};

WallMake = function(_len,_warn)
{
	wall = [];
	var _h = battle_board.up+battle_board.down;
	var _n = ceil(_h/11)+1;
	var _y0 = battle_board.y-battle_board.up+2;
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _n; _i++)
	{
		var _b = RegularBone(battle_board.x-battle_board.left,_y0+_i*11,0,0,0,-90,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,7,_warn);
		array_push(wall,_b);
	}
};

WallStep = function()
{
	var _lx = battle_board.x-battle_board.left;
	var _n = array_length(wall);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(wall[_i])) { wall[_i].x = _lx; }
	}
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

