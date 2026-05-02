event_inherited();

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;
_aim_x=0;
_aim_image=0;
image_xscale=1.3;
image_alpha=0;
image_yscale=2;

if(_dir==DIR.LEFT){
	if (!global.finalstretch == 1)
	{
		with (battle_enemy_engage)
		{
			_head_alpha = 0;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_legs_alpha = 0;
			_legs_alpha1 = 0;
			p2_armleft_alpha = 0;
			p2_armright_alpha = 0;
			p2_body_alpha = 0;
			p2_cape_alpha = 0;
			p2_legs_alpha = 0;
			p2_head_alpha = 0;
			p2_thingy_alpha = 0;
		}
	}
	else
	{
		with(battle_enemy_engage)
		{
			_head_image = 15;
		}
	}
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	_aim_x=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,1.3,0.7,40);
	Anim_Create(id,"_aim_x",ANIM_TWEEN.SINE,ANIM_EASE.IN,_aim_x,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75);
}else{
	if (!global.finalstretch == 1)
	{
		with (battle_enemy_engage)
		{
			_head_alpha = 0;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_legs_alpha = 0;
			_legs_alpha1 = 0;
			p2_armleft_alpha = 0;
			p2_armright_alpha = 0;
			p2_body_alpha = 0;
			p2_cape_alpha = 0;
			p2_legs_alpha = 0;
			p2_head_alpha = 0;
			p2_thingy_alpha = 0;
		}
	}
	else
	{
		with(battle_enemy_engage)
		{
			_head_image = 15;
		}
	}
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,1.3,0.7,40);
	_aim_x=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x",ANIM_TWEEN.SINE,ANIM_EASE.IN,_aim_x,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75);
}