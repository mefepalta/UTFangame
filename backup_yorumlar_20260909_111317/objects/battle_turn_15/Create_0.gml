_timer=0;
_start=false;
cang=false;
canga=0;

faz=0;

forest = [];
forest_x = [];
plat = noone;
arm_reset = -1;
roof = [];

ForestMake = function(_count,_len,_sure,_warn = 0)
{
	forest = [];
	forest_x = [];
	var _w = battle_board.left+battle_board.right;
	var _gap = _w/_count;
	var _x0 = battle_board.x-battle_board.left+_gap/2;
	var _y = battle_board.y+battle_board.down-2;
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < _count; _i++)
	{
		var _bx = _x0+_i*_gap;
		var _b = RegularBone(_bx,_y,0,0,0,0,0,0,1,1,0,0,0,false);
		Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0,_len,_sure,_warn);
		array_push(forest,_b);
		array_push(forest_x,_bx);
	}

	if (_warn > 0)
	{
		var _uy = battle_warn(0,0,0,0,_warn);
		_uy.follow_dir   = DIR.DOWN;
		_uy.follow_thick = _len;
	}
};

ForestBurst = function(_x)
{
	var _y = battle_board.y+battle_board.down-14;
	var _ac = [72,81,90,99,108];
	var _hz = [5.8,4.7,4.2,4.7,5.8];
	for (var _i = 0; _i < 5; _i++)
	{
		var _b = RegularBone(_x,_y,34,0,0,0,0,1,0,1,1,0,0,true);
		Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,8);
		_b.hspeed = lengthdir_x(_hz[_i],_ac[_i]);
		_b.vspeed = lengthdir_y(_hz[_i],_ac[_i]);
		_b.gravity = 0.22;
		_b.gravity_direction = 270;
		_b._angle_speed = (_ac[_i] < 90) ? -6 : ((_ac[_i] > 90) ? 6 : 3);
	}
};

SansBone = function(_sag,_len,_y,_spd)
{
	var _x = _sag ? (battle_board.x+battle_board.right+40) : (battle_board.x-battle_board.left-40);
	battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
	arm_reset = _timer+9;
	audio_play_sound(snd_swift,0,false);
	return RegularBone(_x,_y,_len,_sag?-_spd:_spd,0,_sag?270:90,0,1,1,0,1,0,0,true);
};

ForestDagger = function()
{
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = array_length(forest)-1; _i >= 0; _i--)
	{
		if (_i % 2 == 0) { continue; }
		var _b = forest[_i];
		if (instance_exists(_b))
		{
			Anim_Destroy(_b,"_length");
			_b.y -= 0.833*_b._length/2;
			_b._center = 1;
			_b.autoDestroy = true;
			_b._angle = -110;
			Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,-110,110,22);
			Anim_Create(_b,"vspeed",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0,-7,26);
		}
		array_delete(forest,_i,1);
		array_delete(forest_x,_i,1);
	}
};

ForestRise = function(_len,_sure)
{
	audio_play_sound(snd_exclamation,0,false);
	for (var _i = 0; _i < array_length(forest); _i++)
	{
		if (instance_exists(forest[_i]))
		{
			Anim_Create(forest[_i],"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,forest[_i]._length,_len-forest[_i]._length,_sure);
		}
	}
};

ForestClear = function()
{
	for (var _i = 0; _i < array_length(forest); _i++)
	{
		if (instance_exists(forest[_i])) { instance_destroy(forest[_i]); }
	}
	forest = [];
	forest_x = [];
};

PlatStep = function()
{
	if (!instance_exists(plat)) { return; }
	var _sol = battle_board.x-battle_board.left+plat.width/2;
	var _sag = battle_board.x+battle_board.right-plat.width/2;
	if (plat.x < _sol) { plat.move_x = abs(plat.move_x); }
	if (plat.x > _sag) { plat.move_x = -abs(plat.move_x); }
};

PapSlam = function(_spr)
{
	audio_play_sound(snd_exclamation,0,false);
	Camera_Shake(4,4,2,2);
	battle_enemy_engage.pap_body_sprite = _spr;
	battle_enemy_engage.pap_body_image = 0;
	Anim_Create(battle_enemy_engage,"pap_body_image",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,2.99,16);
};

PapIdle = function()
{
	battle_enemy_engage.pap_body_sprite = spr_papyrus_body;
	battle_enemy_engage.pap_body_image = 0;
};

RoofBone = function(_off,_len,_sure)
{
	var _b = RegularBone(battle_board.x+_off,battle_board.y-battle_board.up+2,0,0,0,180,0,0,1,1,0,0,0,false);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_len,10);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_len,-_len,12,10+_sure);
	array_push(roof,_b);
	return _b;
};

RoofClear = function()
{
	for (var _i = 0; _i < array_length(roof); _i++)
	{
		if (instance_exists(roof[_i])) { instance_destroy(roof[_i]); }
	}
	roof = [];
};
