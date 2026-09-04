///@desc End
var TIME=30;
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,1,-0.5,40);
Anim_Create(id,"image_alpha",0,0,1,-1,TIME);
alarm[1]=TIME;