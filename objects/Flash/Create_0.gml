depth=DEPTH_BATTLE.UI_HIGH
x=Warning.x
y=Warning.y
image_alpha=1
image_xscale=2
image_yscale=2
image_angle=random(360)
Anim_Create(id, "image_alpha", 1, 2, 1, -1, 25)
Anim_Create(id, "image_xscale", 1, 2, 2, 3, 30)
Anim_Create(id, "image_yscale", 1, 2, 2, 3, 30)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
instance_create_depth(Flash.x,Flash.y,1,BoneExp)
audio_play_sound(kaboom,0,false)
audio_stop_sound(warn)
Camera_Shake(-5,5)
timer_Des=0