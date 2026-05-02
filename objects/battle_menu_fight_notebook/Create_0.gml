event_inherited();

depth=DEPTH_BATTLE.BOARD-1;

_thing = instance_create_depth(x,y,0,battle_menu_fight);

var spd = 90;

image_xscale=2;
image_yscale=2;

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;
_aim_x=0;
_aim_x2=0;
_colors=[c_white,c_yellow,c_aqua,c_red];
_ac=0;
_ac2=0;
_aim_color=_colors[_ac];
_aim_color2=_colors[_ac2];
_aim_alpha=0;
_aim_alpha2=0;
_aim_scale=1;
_aim_scale2=1;
_currenthit=0;
_missed=0;
_missed1=0;
_perfect=0;
_perfect2=0;
_delay=irandom_range(5,15);

if(_dir==DIR.LEFT){
	_aim_x=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x",0,0,_aim_x,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),spd);
	_aim_x2=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x2",0,0,_aim_x,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),spd,_delay);
}else{
	_aim_x=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x",0,0,_aim_x,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),spd);
	_aim_x2=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x2",0,0,_aim_x,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),spd,_delay);
}

Anim_Create(id,"_aim_alpha",0,0,0,1,1);
Anim_Create(id,"_aim_alpha2",0,0,0,1,1,_delay);