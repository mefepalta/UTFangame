depth=DEPTH_BATTLE.UI;
image_speed=1;
image_xscale=2;
image_yscale=2;
audio_play_sound(snd_bookspin,0,false);
Anim_Create(id,"image_xscale",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,2,-4,12,0,0,0,ANIM_MODE.PINGPONG);
alarm[0]=30;