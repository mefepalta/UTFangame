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

UDagger = function(_dy,_len,_spd,_turn_at,_rise)
{
	var _bx = battle_board.x-battle_board.left-70;
	var _b = Dagger(_bx,_dy,_len,_spd,0,90);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,_spd,-2*_spd,28,_turn_at);
	Anim_Create(_b,"y",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,_dy,-_rise,28,_turn_at);
	Anim_Create(_b,"_angle",ANIM_TWEEN.QUAD,ANIM_EASE.IN_OUT,90,180,28,_turn_at);
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
