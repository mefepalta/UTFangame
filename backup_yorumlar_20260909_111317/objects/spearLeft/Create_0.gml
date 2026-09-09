y_spr=0;
direction=0;
speed=0;
Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,battle_board._frame_left_x-50,70,30,60);
Anim_Create(id,"x",ANIM_TWEEN.SINE,ANIM_EASE.IN,battle_board._frame_left_x+20,-70,30,90);
Anim_Create(id,"speed",0,0,0,20,10,130);