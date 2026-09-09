event_inherited();

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;

_aim_x1=0;
_aim_x1_alpha=1;
_aim_x2=0;
_aim_x2_alpha=1;
_aim_x3=0;
_aim_x3_alpha=1;
_aim_x4=0;
_aim_x4_alpha=1;
_aim_x5=0;
_aim_x5_alpha=1;
_aim_x6=0;
_aim_x6_alpha=1;

_aim_image=0;
_aim_turn="first"
_aim_counter=0

first_time_1=true
first_time_2=true
first_time_3=true
first_time_4=true
first_time_5=true
first_time_6=true

delay=10

omg=""

_aim_perfect_counter=0
_aim_perfect=false

randomizer = random_range(3,7)
extra_damage = 0

image_xscale=0.5;
image_alpha=0;
image_yscale=1;

if(_dir==DIR.LEFT){
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	_aim_x1=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x2=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x3=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x4=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x5=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x6=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,0.5,0.5,40);
	Anim_Create(id,"_aim_x1",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x1,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75);
	Anim_Create(id,"_aim_x2",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x2,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75,delay+random_range(5,10));
	Anim_Create(id,"_aim_x3",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x3,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75,delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x4",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x4,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75,delay+delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x5",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x5,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75,delay+delay+delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x6",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x6,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75,delay+delay+delay+delay+delay+random_range(5,10));
}else{
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,0.5,0.5,40);
	_aim_x1=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x2=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x3=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x4=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x5=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x6=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x1",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x1,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75);
	Anim_Create(id,"_aim_x2",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x2,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75,delay+random_range(5,10));
	Anim_Create(id,"_aim_x3",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x3,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75,delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x4",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x4,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75,delay+delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x5",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x5,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75,delay+delay+delay+delay+random_range(5,10));
	Anim_Create(id,"_aim_x6",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x6,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75,delay+delay+delay+delay+delay+random_range(5,10));
}