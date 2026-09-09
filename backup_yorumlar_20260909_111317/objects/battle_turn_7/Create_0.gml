_timer=0;
_start=false;
cang=false;
canga=0;

arm_reset = -1;

Dagger = function(_dx,_dy,_len,_hsp,_vsp,_ang)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,18);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,22);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,8,20);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,8,20);
	return _b;
};

Gate = function(_from_left,_top,_bot,_spd)
{
	var _gx = (_from_left ? (battle_board.x-battle_board.left-5) : (battle_board.x+battle_board.right+5));
	var _gs = (_from_left ? _spd : -_spd);
	var _ty = battle_board.y-battle_board.up+2;
	var _by = battle_board.y+battle_board.down-2;
	RegularBone(_gx,_ty,_top,_gs,0,180,0,0,1,0,0,0,0,true);
	RegularBone(_gx,_by,_bot,_gs,0,0,0,0,1,0,0,0,0,true);
};

BlueWall = function(_off)
{
	var _bx = battle_board.x+battle_board.right+5+_off;
	var _b = RegularBone(_bx,battle_board.y-battle_board.up+2,140,-8,0,180,1,0,1,0,0,0,0,true);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,-8,8,60);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.IN,0,-10,55,85);
	return _b;
};
