event_inherited();
_phase_pause_state=0;

_list_turn=ds_list_create();
ds_list_add(_list_turn,battle_turn_intro,battle_turn_orange_gb,battle_turn_jumping,battle_turn_platform_gb,battle_turn_fancy_platform,battle_turn_parkour,battle_turn_platform_gb2,battle_turn_screen_rotate,battle_turn_bounce_platform,battle_turn_jumping2,noone,battle_turn_leaned_bone,battle_turn_vh_bone);
_turn=9;


_body_init_x=0;
_body_init_y=-20;
_body_sprite=spr_sans_body;
_body_x=0;
_body_y=0;
_body_image=0;
_body_speed=0.065;
_body_loop=true;



_wiggle=true;
_wiggle_sin=0;

_head_init_x=0;
_head_init_y=-29;
_head_x=0;
_head_y=0;

_bgm_x=-380;
Anim_Create(self,"_bgm_x",ANIM_TWEEN.SINE,ANIM_EASE.OUT,_bgm_x,-_bgm_x,60);
Anim_Create(self,"_bgm_x",ANIM_TWEEN.SINE,ANIM_EASE.IN,0,_bgm_x,60,400);
_bgm_x=0;

var inst=instance_create_depth(0,0,0,face_sans_battle);
inst.face_id=0;

var inst=instance_create_depth(0,0,0,face_sans_battle_body);
inst.face_id=1;

_intro_ready=false;