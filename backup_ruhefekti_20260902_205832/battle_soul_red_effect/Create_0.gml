depth=DEPTH_BATTLE.SOUL-1
x=battle_soul.x
y=battle_soul.y
sprite_index=spr_battle_soul_red
image_speed=0
audio_play_sound(snd_ding,0,false)
Anim_Create(id,"image_alpha",0,1,1,-1,70)

Anim_Create(id,"image_xscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1,2,65)
Anim_Create(id,"image_yscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1,2,65)