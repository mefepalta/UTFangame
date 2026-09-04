if battle._menu_choice_enemy = _enemy_slot {
}switch(Battle_GetMenuChoiceButton()){
    case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
        if(_hp<=0){
            if(global.p25phase >= 1){
                if(global.p25phase == 4){ global.p25phase = 5; }
                else if(global.p25phase == 6){ global.p25phase = 7; }
                break;
            }
			_legs_sprite=spr_dust_sprite;
            var inst=instance_create_depth(x,y+7,0,battle_death_particle);
            inst.sprite=id;
			inst.scale_x=2;
			inst.scale_y=2;
            audio_play_sound(snd_vaporize,0,false);
			

            Player_SetKills(Player_GetKills()+1);
            Battle_RewardExp(+110);
            Battle_RewardGold(+50);

            image_alpha=0;
			
			
        }
        break;
}

if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
	exit;
}

switch(Battle_GetMenuChoiceButton()){
case BATTLE_MENU_CHOICE_BUTTON.ACT:
     switch(Battle_GetMenuChoiceAction()){
		 case 0:
			global.checkornot = true;
			if (global.p25phase >= 5)
			{
				Dialog_Add("* SANS 1 ATK 1 DEF{pause}{clear}* It's over.")
			}
			else if (global.p25phase >= 1)
			{
				Dialog_Add("* SANS 18 ATK 5 DEF{pause}{clear}* He can't keep it up for long.")
			}
			else
			{
				Dialog_Add("* SANS 80 ATK 50 DEF{pause}{clear}* He was recently promoted to&  captain of the royal guard.{pause}{clear}* And nicknamed as The Titan’s&  Watch, lapdog of the throne.{pause}{clear}* A spark of determination flows&  like a river deep within.")
			}
			break;
		 case 1:
		    Dialog_Add("* You held your arms up.")
			global.checkornot = false;
			if (global.sanstalk < 12)
			{
				global.sanstalk++;
			}
			break;
	 }
}