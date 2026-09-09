if(_input_acceptable){
	if((_dir==DIR.LEFT&&_aim_x<=battle_board.x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2) or (_dir==DIR.RIGHT&&_aim_x>=battle_board.x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)){
		missed=true
		done=true
		miss_count+=1
	}
	if((_dir==DIR.LEFT&&_aim_x2<=battle_board.x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x2>=battle_board.x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)){
		missed=true
		done=true
		miss_count+=1
	}
	if((_dir==DIR.LEFT&&_aim_x3<=battle_board.x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x3>=battle_board.x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)){
		missed=true
		done=true
		miss_count+=1
	}
	if((_dir==DIR.LEFT&&_aim_x4<=battle_board.x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x4>=battle_board.x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)){
		missed=true
		miss_count+=1
		if !(miss_count>3){
		   done=true
		}else{
			Battle_SetMenuFightDamage(-1);
			Battle_EndMenuFightAim();
		}
	}
	var fake_distance = 100
	var perfect_left = 310
	var perfect_right = 330
	if(Input_IsPressed(INPUT.CONFIRM)&&first){
		Anim_Destroy(id,"_aim_x");
		alarm[0]=1;
		audio_play_sound(snd_pan_normal_hit,0,false)
		total_hit+=1
		f_alpha=0
		d=instance_create_depth(_aim_x,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,obj_stick)

        if _aim_x > perfect_left and _aim_x < perfect_right{
			d.hit="perfect"
			additional_damage+=choose(5,14,16)
			total_perfect_hit+=1
		}
		if _aim_x > 320+fake_distance or _aim_x < 320-fake_distance{
			d.hit="bad"
			total_bad_hit+=1
		}
		alarm[2]=5
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&second){
		Anim_Destroy(id,"_aim_x2");
		alarm[0]=1;
		audio_play_sound(snd_pan_normal_hit,0,false)
		s_alpha=0
		total_hit+=1
		dd=instance_create_depth(_aim_x2,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,obj_stick)
		
		if _aim_x2 > perfect_left and _aim_x2 < perfect_right{
			dd.hit="perfect"
			additional_damage+=choose(5,14,16)
			total_perfect_hit+=1
		}
		if _aim_x2 > 320+fake_distance or _aim_x2 < 320-fake_distance{
			dd.hit="bad"
			total_bad_hit+=1
		}
		alarm[3]=5
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&third){
		Anim_Destroy(id,"_aim_x3");
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[0]=1;
		t_alpha=0
		total_hit+=1
		ddd=instance_create_depth(_aim_x3,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,obj_stick)
		
		if _aim_x3 > perfect_left and _aim_x3 < perfect_right{
			ddd.hit="perfect"
			additional_damage+=choose(13,14,26)
			total_perfect_hit+=1
		}
		if _aim_x3 > 320+fake_distance or _aim_x3 < 320-fake_distance{
			ddd.hit="bad"
			total_bad_hit+=1
		}
		alarm[4]=5
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&fourth){
		Anim_Destroy(id,"_aim_x4");
		alarm[0]=1;
		audio_play_sound(snd_pan_normal_hit,0,false)
		for_alpha=0
		total_hit+=1
		dddd=instance_create_depth(_aim_x4,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,obj_stick)
		
		if _aim_x4 > perfect_left and _aim_x4 < perfect_right{
			dddd.hit="perfect"
			total_perfect_hit+=1
			additional_damage+=choose(13,14,26)
		}
		if _aim_x4 > 320+fake_distance or _aim_x4 < 320-fake_distance{
			dddd.hit="bad"
			total_bad_hit+=1
		}
		alarm[5]=5
		
		done=true
	}
	
	if total_hit > 0{
		if done=true{
		var ATK=Player_GetAtkTotal();
		var DEF=Battle_GetEnemyDEF(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()));
		var DISTANCE=point_distance(x,y,(_aim_x+_aim_x2+_aim_x3+_aim_x4)/4,y);
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
		
		Battle_SetMenuFightDamage(damage+additional_damage);
		Battle_SetMenuFightAnimTime(50);
		Battle_SetMenuFightDamageTime(100);
		Battle_EndMenuFightAim();
		_input_acceptable=false;
		}
	}
}