///@desc Menu End
if battle._menu_choice_enemy = _enemy_slot {
}switch(Battle_GetMenuChoiceButton()){
    case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
        //Check: is enemy supposed to be dead?
        if(_hp<=0){
            //Create particle effect
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

if battle._menu_choice_enemy = _enemy_slot {
}switch(Battle_GetMenuChoiceButton()){
case BATTLE_MENU_CHOICE_BUTTON.ACT:
     switch(Battle_GetMenuChoiceAction()){
		 case 0:  ///Check
			global.checkornot = true;
		    Dialog_Add("* SANS 80 ATK 50 DEF{pause}{clear}* He was recently promoted to&  captain of the royal guard.{pause}{clear}* And nicknamed as The Titan’s&  Watch, lapdog of the throne.{pause}{clear}* A spark of determination flows&  like a river deep within.")
			break;
		 case 1:  ///Insult
		    Dialog_Add("* You held your arms up.")
			global.checkornot = false;
			if (global.sanstalk < 12)
			{
				global.sanstalk++;
			}
			break;
	 }
}