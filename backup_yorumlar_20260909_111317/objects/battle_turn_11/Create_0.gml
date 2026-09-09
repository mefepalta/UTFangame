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

	var _uy = battle_warn(0,0,0,0,_warn);
	_uy.follow_dir   = DIR.DOWN;
	_uy.follow_thick = _len;
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

#macro T11_ILK     50
#macro T11_ARA    125
#macro T11_SON   1425
#macro T11_HIZ    2.8
#macro T11_BOS_PX  28
#macro T11_UZAK    10
#macro T11_CIZIM 0.833

T11_YER = [0.30,0.50,0.70];

t11_yon_torba = [];
t11_yon_son = -1;
t11_bos_torba = [];
t11_bos_son = -1;

T11Karistir = function(_adet,_son)
{
	var _t = [];
	for (var _i = 0; _i < _adet; _i++) { array_push(_t,_i); }
	for (var _i = _adet-1; _i > 0; _i--)
	{
		var _j = irandom(_i);
		var _g = _t[_i]; _t[_i] = _t[_j]; _t[_j] = _g;
	}
	if (_adet > 1) and (_t[_adet-1] == _son)
	{
		var _g = _t[_adet-1]; _t[_adet-1] = _t[_adet-2]; _t[_adet-2] = _g;
	}
	return _t;
};

T11Yon = function()
{
	if (array_length(t11_yon_torba) == 0) { t11_yon_torba = T11Karistir(4,t11_yon_son); }
	t11_yon_son = array_pop(t11_yon_torba);
	return t11_yon_son;
};

T11BoslukYeri = function()
{
	if (array_length(t11_bos_torba) == 0) { t11_bos_torba = T11Karistir(array_length(T11_YER),t11_bos_son); }
	t11_bos_son = array_pop(t11_bos_torba);
	return t11_bos_son;
};

T11Boy = function(_acik,_yer)
{
	var _yari = T11_BOS_PX/2;
	var _ilk = max(0,_acik*_yer-_yari);
	var _son = max(0,_acik-_acik*_yer-_yari);
	return [_ilk/T11_CIZIM,_son/T11_CIZIM];
};

T11Vurus = function()
{
	var _yon = T11Yon();
	var _yer = T11_YER[T11BoslukYeri()];

	var _sol = (battle_board.x-battle_board.left)-5;
	var _sag = (battle_board.x+battle_board.right)+5;
	var _dip = (battle_board.y+battle_board.down)-2;
	var _tep = (battle_board.y-battle_board.up)+2;

	var _dikey = T11Boy(_dip-_tep,_yer);
	var _yatay = T11Boy(_sag-_sol,_yer);

	audio_play_sound(snd_impact,2,false);

	switch (_yon)
	{
		case 0:
			Battle_SlamLeft();
			RegularBoneWall(DIR.LEFT,135,12,45,_sol,_tep,65,35,0,false);
			for (var _i = 0; _i < 2; _i++)
			{
				var _x = _sag+T11_UZAK+_i*10;
				RegularBone(_x,_dip,_dikey[0],-T11_HIZ,0,  0,0,0,1,0,0,0,0,true);
				RegularBone(_x,_tep,_dikey[1],-T11_HIZ,0,180,0,0,1,0,0,0,0,true);
			}
			break;

		case 1:
			Battle_SlamRight();
			RegularBoneWall(DIR.RIGHT,135,12,45,_sag,_tep,65,35,0,false);
			for (var _i = 0; _i < 2; _i++)
			{
				var _x = _sol-T11_UZAK-_i*10;
				RegularBone(_x,_dip,_dikey[0],T11_HIZ,0,  0,0,0,1,0,0,0,0,true);
				RegularBone(_x,_tep,_dikey[1],T11_HIZ,0,180,0,0,1,0,0,0,0,true);
			}
			break;

		case 2:
			Battle_SlamUp();
			RegularBoneWall(DIR.UP,145,12,45,_sol,_tep,65,35,0,false);
			for (var _i = 0; _i < 2; _i++)
			{
				var _y = _dip+T11_UZAK+_i*10;
				RegularBone(_sol,_y,_yatay[0],0,-T11_HIZ,270,0,0,1,0,0,0,0,true);
				RegularBone(_sag,_y,_yatay[1],0,-T11_HIZ, 90,0,0,1,0,0,0,0,true);
			}
			break;

		case 3:
			Battle_SlamDown();
			RegularBoneWall(DIR.DOWN,145,12,45,_sol,_dip,65,35,0,false);
			for (var _i = 0; _i < 2; _i++)
			{
				var _y = _tep-T11_UZAK-_i*10;
				RegularBone(_sol,_y,_yatay[0],0,T11_HIZ,270,0,0,1,0,0,0,0,true);
				RegularBone(_sag,_y,_yatay[1],0,T11_HIZ, 90,0,0,1,0,0,0,0,true);
			}
			break;
	}
};
