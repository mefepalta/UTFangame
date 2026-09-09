
event_inherited();

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;
_aim_x=0;
_aim_x2=0;
_aim_x3=0;
_aim_x4=0;
_aim_image=0;

additional_damage=0

first=true
second=false
third=false
fourth=false

missed=false
done=false

miss_count=0

f_scale = 1
f_colour = c_white
f_alpha = 1

s_scale = 1
s_colour = c_white
s_alpha = 1

t_scale = 1
t_colour = c_white
t_alpha = 1

for_scale = 1
for_colour = c_white
for_alpha = 1

total_hit = 0
total_perfect_hit = 0
total_bad_hit = 0

duration_ = 80
delay_ = 10

image_xscale=0.3;
image_alpha=0;
image_yscale=1;

if(_dir==DIR.LEFT){
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	_aim_x=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x2=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x3=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x4=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,0.3,0.7,40);
	Anim_Create(id,"_aim_x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),duration_);
	Anim_Create(id,"_aim_x2",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x2,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),duration_,delay_+random_range(5,10));
	Anim_Create(id,"_aim_x3",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x3,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),duration_,delay_+delay_+random_range(5,10));
	Anim_Create(id,"_aim_x4",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x4,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),duration_,delay_+delay_+delay_+random_range(5,10));
}else{
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,0.3,0.7,40);
	_aim_x=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x2=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x3=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	_aim_x4=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),duration_);
	Anim_Create(id,"_aim_x2",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x2,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),duration_,delay_+random_range(5,10));
	Anim_Create(id,"_aim_x3",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x3,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),duration_,delay_+delay_+random_range(5,10));
	Anim_Create(id,"_aim_x4",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,_aim_x4,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),duration_,delay_+delay_+delay_+random_range(5,10));
}