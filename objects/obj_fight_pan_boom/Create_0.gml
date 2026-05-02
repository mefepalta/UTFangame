depth=DEPTH_BATTLE.UI_HIGH*2
image_speed=1/2

perfect="normal"

Anim_Create(id,"image_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,-10,65,180)
Anim_Create(id,"image_alpha",0,1,1,-1,60)
Anim_Create(id,"image_xscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-2,70)
Anim_Create(id,"image_yscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-2,70)

alarm[0]=7