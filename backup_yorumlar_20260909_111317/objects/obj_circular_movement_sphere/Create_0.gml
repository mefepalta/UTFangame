depth=DEPTH_BATTLE.ENEMY-2
Anim_Create(id,"image_xscale",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,1,2,40)
Anim_Create(id,"image_yscale",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,1,2,40)
Anim_Create(id,"image_alpha",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,0,1,30)
Anim_Create(id,"image_alpha",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,1,-1,30,40)
Anim_Create(id,"image_xscale",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,3,-3,40,40)
Anim_Create(id,"image_yscale",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,3,-3,40,40)
if battle_menu_fight_empty_gun._aim_perfect = true{
	image_blend = make_color_rgb(255,255,100)
}else{
	image_blend = c_white
}