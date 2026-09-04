function ZoomEffect(){
	Anim_Create(camera,"scale_x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1.1,-0.1,40)
	Anim_Create(camera,"scale_y",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1.1,-0.1,40)
}