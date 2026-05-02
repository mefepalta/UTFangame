image_xscale=3;
image_yscale=3;
if(_input_acceptable){
	if _missed && ((_dir==DIR.LEFT&&_aim_x2<=battle_board.x-battle_board.left+100-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x2>=battle_board.x+battle_board.right-100+sprite_get_width(spr_battle_menu_fight_aim)/2)){
			Anim_Destroy(id,"_aim_alpha");
			//Anim_Destroy(id,"_aim_alpha2");
			Anim_Create(id,"_aim_alpha2",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,-1,5);
			Anim_Destroy(id,"_aim_scale");
			Anim_Destroy(id,"_aim_scale2");
			Battle_SetMenuFightDamage(-1);
			Battle_EndMenuFightAim();
			_input_acceptable=false;
			_aim_alpha=0;
			_aim_alpha2=0;
	} else if !_missed && ((_dir==DIR.LEFT&&_aim_x2<=battle_board.x-battle_board.left+100-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x2>=battle_board.x+battle_board.right-100+sprite_get_width(spr_battle_menu_fight_aim)/2)){
		Anim_Create(id,"_aim_alpha2",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,-1,15);
		_missed1=1;
		_currenthit=2;
	}

	if !_missed && ((_dir==DIR.LEFT&&_aim_x<=battle_board.x-battle_board.left+100-sprite_get_width(spr_battle_menu_fight_aim)/2) || (_dir==DIR.RIGHT&&_aim_x>=battle_board.x+battle_board.right-100+sprite_get_width(spr_battle_menu_fight_aim)/2)){
			Anim_Create(id,"_aim_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,-1,15);
			_missed=true;
			_currenthit=1;
	}
	
	if(Input_IsPressed(INPUT.CONFIRM)&&_input_acceptable&&_currenthit==1){
		Anim_Destroy(id,"_aim_x2");
		Anim_Create(id,"_aim_alpha2",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,-1,30);
		Anim_Create(id,"_aim_scale2",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,2,90);
		var DISTANCE=point_distance(x,y,_aim_x2,y);
		if DISTANCE <= 9 {
			_perfect2=1;
		}
		alarm[2]=1;
		_currenthit=2;
		audio_play_sound(snd_multihit,0,0);
	}

	if(Input_IsPressed(INPUT.CONFIRM)&&_input_acceptable&&_currenthit==0){
		Anim_Destroy(id,"_aim_x");
		Anim_Create(id,"_aim_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,-1,30);
		Anim_Create(id,"_aim_scale",ANIM_TWEEN.LINEAR,ANIM_EASE.IN,1,2,90);
		var DISTANCE=point_distance(x,y,_aim_x,y);
		if DISTANCE <= 9 {
			_perfect=1;
		}
		alarm[0]=1;
		_currenthit=1;
		audio_play_sound(snd_multihit,0,0);
	}

	if(_input_acceptable&&_currenthit==2){
		var ATK=Player_GetAtkTotal();
		var DEF=Battle_GetEnemyDEF(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()));
		if !_missed && !_missed1 {
			var DISTANCE=point_distance(x,y,_aim_x,y)+point_distance(x,y,_aim_x2,y);
		} else if _missed && !_missed1 {
			var DISTANCE=point_distance(x,y,x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/4,y)+point_distance(x,y,_aim_x2,y);
		} else if !_missed && _missed1 {
			var DISTANCE=point_distance(x,y,x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/4,y)+point_distance(x,y,_aim_x,y);
		}
		var WIDTH=sprite_get_width(spr_battle_menu_fight_bg)/2;
		var damage=ATK-DEF+random(2);
		DISTANCE = clamp(DISTANCE,-100,150);
		if(DISTANCE<=30){
			damage*=2.2;
		}else{
			damage*=(1-DISTANCE/WIDTH)*2;
		}
		if _perfect && _perfect2 {
			damage+=irandom_range(8,12);	
		}
		damage=round(damage);
		if(damage<=0){
			damage=1;
		}
		
		Battle_SetMenuFightDamage(damage);
		Battle_SetMenuFightAnimTime(30);
		Battle_SetMenuFightDamageTime(95);
		Battle_EndMenuFightAim();
		_input_acceptable=false;
	}
}