if(_input_acceptable){
	if((_dir==DIR.LEFT&&_aim_x<=battle_board.x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x>=battle_board.x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)){
			global.go_dodge = "miss";
			Battle_SetMenuFightDamage(-1);
			Battle_EndMenuFightAim();
			_input_acceptable=false;
	}
	
	if(Input_IsPressed(INPUT.CONFIRM)&&_input_acceptable){
		Anim_Destroy(id,"_aim_x");
		with (o_sans_blockp1)
		{
			image_speed = 1;
			global.sanstalk = -999;
		}

		if (global.p25phase >= 1) and (instance_exists(battle_enemy_engage))
		{
			with (battle_enemy_engage)
			{
				p2_head_sprite = spr_p2_head;
				_head_image = 6;
			}
		}

		alarm[0]=1;
		
		var ATK=Player_GetAtkTotal();
		var DEF=Battle_GetEnemyDEF(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()));
		var DISTANCE=point_distance(x,y,_aim_x,y);
		var WIDTH=sprite_get_width(spr_battle_menu_fight_bg)/2;
		var damage=ATK-DEF+random(2);
		if(DISTANCE<=12){
			damage*=2.2;
		}else{
			damage*=(1-DISTANCE/WIDTH)*2;
		}
		damage=round(damage);
		if(damage<=0){
			damage=1;
		}
		
		if (global.p25phase == 2) and (instance_exists(battle_enemy_engage))
		{
			if (battle_enemy_engage._hp-damage <= 0) and (!global.p25_iska)
			{
				global.p25_iska = true;
				global.p25phase = 3;
				global.go_dodge = "miss";
				Battle_SetMenuFightDamage(0);
				Battle_SetMenuFightAnimTime(50);
				Battle_SetMenuFightDamageTime(95);
				Battle_EndMenuFightAim();
				_input_acceptable=false;
				exit;
			}
		}

		Battle_SetMenuFightDamage(damage);
		Battle_SetMenuFightAnimTime(50);
		Battle_SetMenuFightDamageTime(95);
		Battle_EndMenuFightAim();
		_input_acceptable=false;
	}
}