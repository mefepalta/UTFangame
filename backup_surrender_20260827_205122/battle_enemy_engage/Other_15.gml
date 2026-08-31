///@desc Menu End
if battle._menu_choice_enemy = _enemy_slot {
}switch(Battle_GetMenuChoiceButton()){
    case BATTLE_MENU_CHOICE_BUTTON.FIGHT:
        //Check: is enemy supposed to be dead?
        if(_hp<=0){
            // FINAL PHASE: olum motorun toz efektiyle bitmiyor. Sans once
            // son sozlerini soyluyor, sonra oyuncunun son vurusuyla veda
            // edip ekrandan yuruyerek cikiyor (bkz. scripts/P25).
            // Sahneyi bir sonraki tur suruyor; burada sadece sirayi
            // ilerletiyoruz.
            if(global.p25phase >= 1){
                if(global.p25phase == 4){ global.p25phase = 5; }       // son vurus -> olum konusmasi
                else if(global.p25phase == 6){ global.p25phase = 7; }  // veda vurusu -> veda konusmasi
                break;
            }
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

// Phase 2'de Papyrus ve Alphys de birer slot; ACT > Check baskasina yapildiysa
// Sans'in metnini basmayalim.
if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
	exit;
}

switch(Battle_GetMenuChoiceButton()){
case BATTLE_MENU_CHOICE_BUTTON.ACT:
     switch(Battle_GetMenuChoiceAction()){
		 case 0:  ///Check
			global.checkornot = true;
			// FINAL PHASE'de degerleri de metni de belge veriyor:
			// dovus basinda "18 ATK 5 DEF / He can't keep it up for long.",
			// yenildikten sonra "1 ATK 1 DEF / It's over."
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