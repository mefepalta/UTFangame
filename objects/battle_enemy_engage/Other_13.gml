
if(Battle_GetMenu()==BATTLE_MENU.FIGHT_DAMAGE){
    if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
        exit;
    }
}

var _dmg_x=(room==room_battle_1 ? p2_draw_x : x);

switch(Battle_GetMenu()){
    case BATTLE_MENU.FIGHT_TARGET:
        if(!Battle_IsEnemyTargetable(_enemy_slot)){
            break;
        }
        var inst=instance_create_depth(0,0,0,battle_menu_fight_hp_bar);
        inst.enemy_slot=_enemy_slot;
        inst.hp_max=_hp_max;
        inst.hp=_hp;
        break;
        
    case BATTLE_MENU.FIGHT_DAMAGE:
	if global.go_dodge="damage"{
        var dmg=Battle_GetMenuFightDamage();
        var hp_orig=_hp;
        
        _hp=(_hp-dmg >= 0 ? _hp-dmg : 0);
        
        var inst=instance_create_depth(_dmg_x,y,0,battle_damage);
        inst.damage=dmg;
        inst.bar_hp_max=_hp_max;
        inst.bar_hp_original=hp_orig;
        inst.bar_hp_target=_hp;
        
        if(dmg>0){
            audio_play_sound(snd_damage,0,false);
            var shake=instance_create_depth(0,0,0,shaker);
            shake.target=self;
            shake.var_name=(room==room_battle_1 ? "p2_shake_x" : "x");
            shake.shake_distance=15;
            shake.shake_decrease=3;
            shake.shake_speed=4;
			global.p1sanshp = true;
        }
        break;
	}else if global.go_dodge="miss"{
	    var dmg=-1;
	    var hp_orig=_hp;
    
	    var inst=instance_create_depth(_dmg_x,y-250,0,battle_damage);
	    inst.damage=dmg;
	    inst.bar_visible=false;
	    inst.bar_hp_max=_hp_max;
	    inst.bar_hp_original=hp_orig;
	    inst.bar_hp_target=_hp;
	    break;
	}else if global.go_dodge="block"{
		
		var dmg=-1;
        var hp_orig=_hp;
        
        _hp=(_hp-dmg >= 0 ? _hp-dmg : 0);
		
		audio_play_sound(snd_damage,0,false);
            var shake=instance_create_depth(0,0,0,shaker);
            shake.target=id;
            shake.var_name=(room==room_battle_1 ? "p2_shake_x" : "x");
            shake.shake_distance=15;
            shake.shake_decrease=3;
            shake.shake_speed=4;
			
        var inst=instance_create_depth(_dmg_x,y-250,0,battle_damage);
        inst.damage=dmg;
        inst.bar_hp_max=_hp_max;
        inst.bar_hp_original=hp_orig;
        inst.bar_hp_target=_hp;
		break;
	}else if global.go_dodge="missed"{
		var dmg=-1;
        var hp_orig=_hp;
        
        _hp=(_hp-dmg >= 0 ? _hp-dmg : 0);
		
		break;
	}
}
