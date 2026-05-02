depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2
angle = 0; 
orbit_radius = 5; 
sprite_count = 8; 

xscale_bullet = 1.3
yscale_bullet = 1.3
angle_bullet = random(360)
color_bullet = c_white
alpha_bullet = 1
speed_bullet = 8
image_bullet = 0

counter=0
Anim_Create(id,"angle_bullet",0,1,0,360,120)

Anim_Create(id,"orbit_radius",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,5,65,40)
Anim_Create(id,"orbit_radius",ANIM_TWEEN.BOUNCE,ANIM_EASE.OUT,70,-70,50,40)

Anim_Create(id,"speed_bullet",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,3,9,40)
Anim_Create(id,"speed_bullet",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,12,-6,50,40)

Anim_Create(id,"xscale_bullet",1,0,1.3,-1.3,50,30)
Anim_Create(id,"yscale_bullet",1,0,1.3,-1.3,50,30)

//Anim_Create(id,"alpha_bullet",0,1,0,1,35)
Anim_Create(id,"alpha_bullet",0,1,1,-1,35,40)

if battle_menu_fight_empty_gun._aim_perfect = true{
	color_bullet = make_color_rgb(255,255,100)
	audio_play_sound(snd_perfecthit,0,false)
}else{
	audio_play_sound(snd_metalic,0,false)
	color_bullet = c_white
}

if global.go_dodge="missed"{
	Camera_Shake(2,5,1,2)
	Anim_Create(battle_enemy_engage,"oh_god",0,1,0.5,-0.5,65)
	alarm[0]=85
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,320,-65,60);
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,320-65,65,60,75);
}