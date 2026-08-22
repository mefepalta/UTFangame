_timer=0;
_start=false;
cang=false;
canga=0;

fade_at = -1;

sari_aktif = true;

sea = [];
wall = [];

WallMake = function(_len,_warn)
{
	wall = [];
	var _w = battle_board.left+battle_board.right;
	var _n = ceil(_w/11)+1;
	var _x0 = battle_board.x-battle_board.left;
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _n; _i++)
	{
		var _b = RegularBone(_x0+_i*11,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,7,_warn);
		array_push(wall,_b);
	}
};

WallClear = function()
{
	var _n = array_length(wall);
	for (var _i = 0; _i < _n; _i++)
	{
		if (instance_exists(wall[_i]))
		{
			Anim_Create(wall[_i],"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,wall[_i]._length,-wall[_i]._length,12);
			Anim_Create(wall[_i],"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,1,-1,14);
		}
	}
	wall = [];
};

SeaMake = function(_count)
{
	sea = [];
	var _w = battle_board.left+battle_board.right;
	var _gap = _w/_count;
	var _x0 = battle_board.x-battle_board.left+_gap/2;
	for (var _i = 0; _i < _count; _i++)
	{
		var _b = RegularBone(_x0+_i*_gap,battle_board.y-battle_board.up+2,18,0,0,180,0,0,1,0,0,0,0,false);
		array_push(sea,_b);
	}
};

SeaDrop = function(_count,_warn,_hold)
{
	var _n = array_length(sea);
	var _pick = [];
	for (var _i = 0; _i < _n; _i++) { array_push(_pick,_i); }
	for (var _i = _n-1; _i > 0; _i--)
	{
		var _j = irandom(_i);
		var _t = _pick[_i]; _pick[_i] = _pick[_j]; _pick[_j] = _t;
	}
	audio_play_sound(snd_exclamation,0,false);
	for (var _k = 0; _k < _count; _k++)
	{
		var _b = sea[_pick[_k]];
		if (!instance_exists(_b)) { continue; }
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,18,38,8);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,56,126,9,_warn);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,182,-164,14,_warn+9+_hold);
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
};

Dagger = function(_dx,_dy,_len,_hsp,_vsp,_ang,_wait)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,12);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,18);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,5,_wait);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,5,_wait);
	return _b;
};

