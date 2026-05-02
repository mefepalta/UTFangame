Camera_Shake(2,4,2,3)


if global.go_dodge = "miss"{
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,x,-50,75)
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,x-50,50,75,85)
}

audio_play_sound(snd_frypan,0,false)

var delay_bullets = 15
image_alpha=0

left=instance_create_depth(x,y,0,obj_fight_pan_particle)
rightL=instance_create_depth(x,y,0,obj_fight_pan_particle)
rightL2=instance_create_depth(x,y,0,obj_fight_pan_particle)
rightL3=instance_create_depth(x,y,0,obj_fight_pan_particle)
rightL4=instance_create_depth(x,y,0,obj_fight_pan_particle)
right=instance_create_depth(x,y,0,obj_fight_pan_particle)
up=instance_create_depth(x,y,0,obj_fight_pan_particle)
down=instance_create_depth(x,y,0,obj_fight_pan_particle)

left.direction=180
left.speed=3
Anim_Create(left,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

rightL.direction=45
rightL.speed=3
Anim_Create(rightL,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

rightL2.direction=-45
rightL2.speed=3
Anim_Create(rightL2,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

rightL3.direction=135
rightL3.speed=3
Anim_Create(rightL3,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

rightL4.direction=-135
rightL4.speed=3
Anim_Create(rightL4,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

right.direction=0
right.speed=3
Anim_Create(right,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

up.direction=90
up.speed=3
Anim_Create(up,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

down.direction=270
down.speed=3
Anim_Create(down,"speed",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,-3,90,delay_bullets)

if perfect = "perfect"
{
	audio_play_sound(snd_perfecthit,0,false)
	left.image_blend=make_color_rgb(211,255,100)
	right.image_blend=make_color_rgb(211,255,100)
	down.image_blend=make_color_rgb(211,255,100)
	up.image_blend=make_color_rgb(211,255,100)
	rightL.image_blend=make_color_rgb(211,255,100)
	rightL2.image_blend=make_color_rgb(211,255,100)
	rightL3.image_blend=make_color_rgb(211,255,100)
	rightL4.image_blend=make_color_rgb(211,255,100)
}else if perfect = "normal"
{
	left.image_blend=c_white
	right.image_blend=c_white
	down.image_blend=c_white
	up.image_blend=c_white
	rightL.image_blend=c_white
	rightL2.image_blend=c_white
	rightL3.image_blend=c_white
	rightL4.image_blend=c_white
}/*else if perfect = "bad"
{
	left.image_blend=c_red
	right.image_blend=c_red
	down.image_blend=c_red
	up.image_blend=c_red
	rightL.image_blend=c_red
	rightL2.image_blend=c_red
	rightL3.image_blend=c_red
	rightL4.image_blend=c_red
}