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

		// FINAL PHASE: atak barina basildigi an Sans'in kafasi
		// spr_p2_head'in 6. karesine (gozler siyah ve bos) geciyor.
		// Bu yalnizca faz 2 sprite'i hala sahnedeyken, yani oyuncunun
		// final phase'i acan ILK vurusunda goruluyor; sonrasinda sahnede
		// yaralanmis p25 Sans'i var.
		if (global.p25phase >= 1) and (instance_exists(battle_enemy_engage))
		{
			// Faz 2 kafasinin karesi _head_image'ten okunuyor ve bu deger
			// kafaya SADECE p2_head_sprite == spr_p2_head iken uygulaniyor
			// (battle_enemy_engage/Draw_0), o yuzden ikisi birden.
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
		
		//------------------------------------------------------ FINAL PHASE
		// Belgede yedi turun sonunda "You attack and miss." diyor: olumcul
		// olacak ILK vurus SAHTE olarak iskalaniyor, Sans "There's no way
		// I'm letting you-" deyip direniyor, siradaki vurus kesin
		// olduruyor. Boylece olum, canin tam sifirlandigi rastgele bir
		// karede degil, belgedeki yerde oluyor.
		if (global.p25phase == 2) and (instance_exists(battle_enemy_engage))
		{
			if (battle_enemy_engage._hp-damage <= 0) and (!global.p25_iska)
			{
				global.p25_iska = true;
				global.p25phase = 3;
				global.go_dodge = "miss";
				// Hasar -1 DEGIL 0: battle_menu_fight_knife/Other_10 slash'i
				// sadece hasar >= 0 iken yaratiyor. Sans kacacagi icin vurus
				// zaten islemiyor (Other_13'un "miss" dali cani ellemiyor),
				// ama BICAK DARBESI oynamali -- oyuncu vurdu, Sans kacti.
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