var perfect_hit_left_limit = 310
var perfect_hit_right_limit = 330

var normal_hit_left_limit = 150
var normal_hit_right_limit = 590

var bad_hit_left_limit = 150
var bad_hit_right_limit = 490

if(_input_acceptable){
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="first"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[2]=5
		_aim_x1_alpha=0
		if _aim_x1 > perfect_hit_left_limit and _aim_x1 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x1,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			_aim_perfect_counter+=1
			extra_damage+=random_range(10,20)
		}else if _aim_x1 > normal_hit_left_limit and _aim_x1 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x1,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x1 < bad_hit_left_limit or _aim_x1 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x1,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x1");
		alarm[0]=1;
		_aim_counter=1
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="second"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[3]=5
		_aim_x2_alpha=0
		if _aim_x2 > perfect_hit_left_limit and _aim_x2 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x2,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			extra_damage+=random_range(10,20)
			_aim_perfect_counter+=1
		}else if _aim_x2 > normal_hit_left_limit and _aim_x2 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x2,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x2 < bad_hit_left_limit or _aim_x2 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x2,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x2");
		alarm[0]=1;
		_aim_counter=2
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="third"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[4]=5
		_aim_x3_alpha=0
		if _aim_x3 > perfect_hit_left_limit and _aim_x3 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x3,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			extra_damage+=random_range(10,20)
			_aim_perfect_counter+=1
		}else if _aim_x3 > normal_hit_left_limit and _aim_x3 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x3,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x3 < bad_hit_left_limit or _aim_x3 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x3,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x3");
		alarm[0]=1;
		_aim_counter=3
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="fourth"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[5]=5
		_aim_x4_alpha=0
		if _aim_x4 > perfect_hit_left_limit and _aim_x4 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x4,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			_aim_perfect_counter+=1
			extra_damage+=random_range(10,20)
		}else if _aim_x4 > normal_hit_left_limit and _aim_x4 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x4,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x4 < bad_hit_left_limit or _aim_x4 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x4,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x4");
		alarm[0]=1;
		_aim_counter=4
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="fifth"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[6]=5
		_aim_x5_alpha=0
		if _aim_x5 > perfect_hit_left_limit and _aim_x5 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x5,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			extra_damage+=random_range(10,20)
			_aim_perfect_counter+=1
		}else if _aim_x5 > normal_hit_left_limit and _aim_x5 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x5,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x5 < bad_hit_left_limit or _aim_x5 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x5,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x5");
		alarm[0]=1;
		_aim_counter=5
	}
	if(Input_IsPressed(INPUT.CONFIRM)&&_aim_turn="sixth"){
		audio_play_sound(snd_pan_normal_hit,0,false)
		alarm[7]=5
		alarm[8]=5
		_aim_x6_alpha=0
		if _aim_x6 > perfect_hit_left_limit and _aim_x6 < perfect_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x6,y,0,obj_stick_effect)
			attackbullet.hit="perfect"
			_aim_perfect_counter+=1
			extra_damage+=random_range(10,20)
		}else if _aim_x6 > normal_hit_left_limit and _aim_x6 < normal_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x6,y,0,obj_stick_effect)
			attackbullet.hit="normal"
			extra_damage+=random_range(3,7)
		}else if _aim_x6 < bad_hit_left_limit or _aim_x6 > bad_hit_right_limit{
			var attackbullet = instance_create_depth(_aim_x6,y,0,obj_stick_effect)
			attackbullet.hit="bad"
		}
		Anim_Destroy(id,"_aim_x6");
		alarm[0]=1;
		_aim_counter=6
	}
	
	if _dir = DIR.LEFT{
		if _aim_x1 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_1){
				_aim_turn="second"
				first_time_1=false
			}
		}
		if _aim_x2 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_2){
				_aim_turn="third"
				first_time_2=false
			}
		}
		if _aim_x3 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_3){
				_aim_turn="fourth"
				first_time_3=false
			}
		}
		if _aim_x4 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_4){
				_aim_turn="fifth"
				first_time_4=false
			}
		}
		if _aim_x5 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_5){
				_aim_turn="sixth"
				first_time_5=false
			}
		}
		if _aim_x6 = (x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2)-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)){
			if (first_time_6){
				first_time_6=false
				_aim_turn="done"
				if !(_aim_counter > 0){
					_aim_turn="missed"
					Battle_SetMenuFightDamage(-1)
					Battle_EndMenuFightAim();
					_input_acceptable=false;
				}else{
					alarm[8]=1
				}
			}
		}
	}else if _dir = DIR.RIGHT{
		if _aim_x1 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_1){
				_aim_turn="second"
				first_time_1=false
			}
		}
		if _aim_x2 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_2){
				_aim_turn="third"
				first_time_2=false
			}
		}
		if _aim_x3 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_3){
				_aim_turn="fourth"
				first_time_3=false
			}
		}
		if _aim_x4 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_4){
				_aim_turn="fifth"
				first_time_4=false
			}
		}
		if _aim_x5 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_5){
				_aim_turn="sixth"
				first_time_5=false
			}
		}
		if _aim_x6 = (x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2)+battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim){
			if (first_time_6){
				first_time_6=false
				_aim_turn="done"
				if !(_aim_counter > 0){
					_aim_turn="missed"
					Battle_SetMenuFightDamage(-1)
					Battle_EndMenuFightAim();
					_input_acceptable=false;
				}else{
					alarm[8]=1
				}
			}
		}
	}
}

if _aim_perfect_counter > 3{
	_aim_perfect = true
}else{
	_aim_perfect = false
}