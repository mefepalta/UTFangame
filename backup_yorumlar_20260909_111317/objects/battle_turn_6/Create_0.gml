_timer=0;
_start=false;
cang=false;
canga=0;

Dagger = function(_dx,_dy,_len,_hsp,_vsp,_ang)
{
	var _b = RegularBone(_dx,_dy,_len,0,0,_ang-110,0,1,0,0,1,0,0,true);
	Anim_Create(_b,"_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,18);
	Anim_Create(_b,"_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_ang-110,110,22);
	Anim_Create(_b,"hspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_hsp,8,20);
	Anim_Create(_b,"vspeed",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,_vsp,8,20);
	return _b;
};
