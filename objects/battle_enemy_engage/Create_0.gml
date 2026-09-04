p2_anim_t=0;

#macro P15_BEKLE    50
#macro P15_KARARMA  55
#macro P15_SIYAH    20

p15_gecis = 0;
global.p2_bgm = -1;
global.p2_anim_hiz=1;
global.p2_anim_hedef=1;

	depth=DEPTH_BATTLE.ENEMY;
	global._enemy_phase_pose = 1;
	_enemy_slot=1;
	_body_speed=0;
	_body_loop=true;
	_action_step=1;

	global.slam_power = 0.15*5
	global.slam_damage = false
	instance_create_depth(0,0,0,battle_slam_manager)

	if (global.no_hit == true)
	{
		Player_SetHp(1);
		Player_SetHpMax(1);
	}

	wing_angle = 0;
	arm_angle = 0;
	head_angle = 0;

	wing_speed = 4;
	arm_speed = 2;
	head_speed = 0.5;

	_surface = -1
	index_img=0
	oh_god=0
	amk=0
	squish = 1
	_surf = -1;
	ynew=1

	action=SANS_ACTION.IDLE;
	_action_step=1;

	_papyrus_shadow_alpha=1;

	n=0

	god=0
	alarm[5]=1
	fps_color=c_black;
	timer_color=c_black;
	global.line_drift=0.1
	global.intensity=0.1

	global.invincibility = false

	global.inv=0;
	global.show_hitbox=false

	global.sans_mode = 0

	global.beam_dmg = 1;
	global.beam_kr = 10;

	global.bone_dmg = 1;
	global.bone_kr = 6;

	global.enemy_state="animation";

	slam_sprite=noone;
	slam_image=0;
	slam_alpha=0;
	slam_xscale=2;
	slam_yscale=2;
	slam_counter=0;
	slam_head_sprite=0;
	slam_reset_cooldown=10;
	slamming=false;

	x=320;
	global._inv=100;
	global.debug_mode=true;
	global.invinvible=0;
	global.timer=0;
	global.followboard=true;
	global.hardmode=false;
	global.easymode=false;
	global.krmore=0;
	global.kr=true;
	global.battleIntro = true;
	global.dodge=false;
	global.discord=true;
	global.enemy_animation="animation";
	global.mercy=50;
	global.go_dodge="block";

	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.BATTLE_MENU_FIGHT_OBJ,battle_menu_fight_knife);
	Border_SetEnabled(global.border_enabled);
	instance_create_depth(0,0,0,black_splash)

	_bottom_cloak_anim=0;
	bh_alpha=1;
	leg_image=0;
	_timee=0;
	_time=0;
	timin=0;
	timi=0;
	slam_timer=0;
	timer=0;

	leg_sprite=spr_sans_legs;
	legs_yscale=1;
	legs_xscale=1;
	_legs_alpha=1;
	_legs_image=0;

	leg_sprite1= s_p05legs;
	legs_yscale1=1;
	legs_xscale1=1;
	_legs_alpha1=0;
	_legs_image1=0;

	image_xscale=2;
	image_yscale=2;

	can_go=false;
	testus=0;
	adding=5;

	surfaces=1

	_wiggle=true

	global.battleTheme = c_white;

	_head_sprite=spr_sans_head;
	_head_alpha=1;
	_head_angle=0;
	_head_init_x=1;
	_head_init_y=-29;
	_head_x=0;
	_head_y=0;
	_head_image=0;

	_body_alpha=1;
	_body_angle=0;
	_body_init_x=-3.5;
	_body_init_y=-23.5;
	_body_x=0;
	_body_y=0;
	_body_image=0;
	_body_sprite=spr_sans_body;

	_armleft_sprite=spr_arm_1;
	_armleft_alpha=1;
	_armleft_angle=0;
	_armleft_init_x=1;
	_armleft_init_y=-29;
	_armleft_x=0;
	_armleft_y=0;
	_armleft_image=0;

	_armright_sprite=spr_arm_2;
	_armright_alpha=1;
	_armright_angle=0;
	_armright_init_x=1;
	_armright_init_y=-29;
	_armright_x=0;
	_armright_y=0;
	_armright_image=0;

	_armleft_sprite1=s_p05arm;
	_armleft_alpha1=0;
	_armleft_angle1=0;
	_armleft_init_x1=1;
	_armleft_init_y1=-29;
	_armleft_x1=0;
	_armleft_y1=0;
	_armleft_image1=0;

	_armright_sprite1=s_p05arm;
	_armright_alpha1=0;
	_armright_angle1=0;
	_armright_init_x1=1;
	_armright_init_y1=-29;
	_armright_x1=0;
	_armright_y1=0;
	_armright_image1=0;

	_wingthing1_sprite=spr_wingthing_1;
	_wingthing1_alpha=1;
	_wingthing1_angle=0;
	_wingthing1_init_x=1;
	_wingthing1_init_y=-29;
	_wingthing1_x=0;
	_wingthing1_y=0;
	_wingthing1_image=0;

	_wingthing2_sprite=spr_wingthing_2;
	_wingthing2_alpha=1;
	_wingthing2_angle=0;
	_wingthing2_init_x=1;
	_wingthing2_init_y=-29;
	_wingthing2_x=0;
	_wingthing2_y=0;
	_wingthing2_image=0;

	_spear_sprite=spr_spearp1;
	_spear_alpha=1;
	_spear_angle=0;
	_spear_init_x=1;
	_spear_init_y=-29;
	_spear_x=0;
	_spear_y=0;
	_spear_image=0;

	_hp=5000;
	_hp_max=5000;

	Anim_Create(camera,"scale_x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,90);
	Anim_Create(camera,"scale_y",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,90);


	p2_wing_angle_diddler = 0;
	p2_arm_angle_diddler = 0;
	p2_head_angle_diddler = 0;

	p2_wing_speed_diddler = 4;
	p2_arm_speed_diddler = 2;
	p2_head_speed_diddler = 0.5;

	_surface = -1
	index_img=0
	oh_god=0
	amk=0
	squish = 1
	_surf = -1;
	ynew=1

	action=SANS_ACTION.IDLE;
	_action_step=1;

	_papyrus_shadow_alpha=1;

	n=0

	god=0
	alarm[5]=1
	fps_color=c_black;
	timer_color=c_black;
	global.line_drift=0.1
	global.intensity=0.1

	global.invincibility = false

	global.inv=0;
	global.show_hitbox=false

	global.sans_mode = 0

	global.beam_dmg = 1;
	global.beam_kr = 10;

	global.bone_dmg = 1;
	global.bone_kr = 6;

	global.enemy_state="animation";

	slam_sprite=noone;
	slam_image=0;
	slam_alpha=0;
	slam_xscale=2;
	slam_yscale=2;
	slam_counter=0;
	slam_head_sprite=0;
	slam_reset_cooldown=10;
	slamming=false;

	x=320;
	global._inv=100;
	global.debug_mode=true;
	global.invinvible=0;
	global.timer=0;
	global.followboard=true;
	global.hardmode=false;
	global.easymode=false;
	global.krmore=0;
	global.kr=true;
	global.battleIntro = true;
	global.dodge=false;
	global.discord=true;
	global.enemy_animation="animation";
	global.mercy=50;
	global.go_dodge="block";

	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.BATTLE_MENU_FIGHT_OBJ,battle_menu_fight_knife);
	Border_SetEnabled(global.border_enabled);
	instance_create_depth(0,0,0,black_splash)

	_bottom_cloak_anim=0;
	bh_alpha=1;
	leg_image=0;
	_timee=0;
	_time=0;
	timin=0;
	timi=0;
	slam_timer=0;
	timer=0;

	p2leg_sprite = spr_p2_legs;
	p2legs_yscale=1;
	p2legs_xscale=1;
	p2_legs_alpha=1;
	p2_legs_image=0;

	p2leg_sprite1= spr_p2_legs;
	p2legs_yscale1=1;
	p2legs_xscale1=1;
	p2_legs_alpha1=0;
	p2_legs_image1=0;

	image_xscale=2;
	image_yscale=2;

	can_go=false;
	testus=0;
	adding=5;

	surfaces=1

	_wiggle=true

	global.battleTheme = c_white;

	p2_head_sprite=spr_p2_head;
	p2_head_alpha=1;
	p2_head_angle=0;
	p2_head_init_x=1;
	p2_head_init_y=-29;
	p2_head_x=0;
	p2_head_y=0;
	p2_head_image=0;

	p2_body_alpha=1;
	p2_body_angle=0;
	p2_body_init_x=-3.5;
	p2_body_init_y=-23.5;
	p2_body_x=0;
	p2_body_y=0;
	p2_body_image=0;
	p2_body_sprite=spr_p2_body;

	p2_armleft_sprite=spr_p2_arm_left;
	p2_armleft_alpha=1;
	p2_armleft_angle=0;
	p2_armleft_init_x=1;
	p2_armleft_init_y=-29;
	p2_armleft_x=0;
	p2_armleft_y=0;
	p2_armleft_image=0;

	p2_armright_sprite=spr_p2_arm_right
	p2_armright_alpha=1;
	p2_armright_angle=0;
	p2_armright_init_x=1;
	p2_armright_init_y=-29;
	p2_armright_x=0;
	p2_armright_y=0;
	p2_armright_image=0;
	
	p2_thingy_sprite=spr_p2_thingy
	p2_thingy_alpha=1;
	p2_thingy_angle=0;
	p2_thingy_init_x=1;
	p2_thingy_init_y=-29;
	p2_thingy_x=0;
	p2_thingy_y=0;
	p2_thingy_image=0;
	
	p2_cape_sprite=spr_p2_cape
	p2_cape_alpha=1;
	p2_cape_angle=0;
	p2_cape_init_x=1;
	p2_cape_init_y=-29;
	p2_cape_x=0;
	p2_cape_y=0;
	p2_cape_image=0;


	global.p2_revived_pap=false;
	global.p2_revived_alp=false;

	global.p25phase=0;
	global.p25_dlg=false;
	global.p25_iska=false;
	global.p25_t=0;
	global.p25_kacis=0;


	layout_margin=40;
	layout_speed=0.07;
	off_left=-180;
	off_right=820;

	p2_state=2;
	kay_x=0;

	p2_draw_x=320;
	p2_off_x=0;
	p2_shake_x=0;
	p2_snap=false;

	p2_offstage=false;

	_not_targetable=false;

	pap_state=0;
	pap_alpha=1;
	pap_draw_x=-180;
	pap_shake_x=0;
	pap_snap=false;
	pap_wiggle=0;
	pap_bob=0;
	pap_arm_angle=0;
	pap_head_sprite=spr_papyrus_head;
	pap_head_image=0;
	pap_body_sprite=spr_papyrus_body;
	pap_body_image=0;
	pap_head_alpha=1;
	pap_arm_alpha=1;
	pap_legs_sprite=spr_papyrus_legs;
	pap_legs_image=0;
	pap_arm_sprite=spr_papyrus_arm;
	pap_arm_image=0;

	pap_block_sprite=spr_papyrus_blockwall_up;
	pap_block_state=0;
	pap_block_image=0;
	pap_block_speed=0.5;
	pap_block_hold=45;
	pap_block_timer=0;
	pap_block_shake_x=0;

	alp_state=0;
	alp_alpha=1;
	alp_draw_x=820;
	alp_shake_x=0;
	alp_snap=false;
	alp_wiggle=0;
	alp_bob=0;
	alp_armleft_angle=0;
	alp_armright_angle=0;
	alp_head_sprite=spr_alphys_head;
	alp_head_image=0;
	alp_body_sprite=spr_alphys_body;
	alp_body_image=0;
	alp_armleft_sprite=spr_alphys_arm_left;
	alp_armright_sprite=spr_alphys_arm_right;
	alp_eye_sprite=spr_alphys_eye;
	alp_eye_image=0;
	alp_eye_visible=true;

	_hp=5000;
	_hp_max=5000;

	Anim_Create(camera,"scale_x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,90);
	Anim_Create(camera,"scale_y",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,2,-1,90);
	

go_mercy_hold = 0;
