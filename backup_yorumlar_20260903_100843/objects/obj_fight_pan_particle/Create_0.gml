depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2
image_speed=1/2

Anim_Create(id,"image_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,-10,65,180)
Anim_Create(id,"image_alpha",0,1,1,-1,60,35)
Anim_Create(id,"image_xscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,70)
Anim_Create(id,"image_yscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,70)