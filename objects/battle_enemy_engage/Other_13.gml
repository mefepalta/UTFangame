///@desc Menu Switch

// Bu olay TUM dusmanlar icin cagriliyor. Phase 2'de Papyrus ve Alphys de birer
// slot oldugu icin, secili hedef biz degilsek hasar/titreme kismina girmemeliyiz.
if(Battle_GetMenu()==BATTLE_MENU.FIGHT_DAMAGE){
    if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
        exit;
    }
}

// Phase 2'de Sans hizalamaya gore yer degistiriyor; hasar sayisi nesnenin
// x'ini degil ciziim konumunu takip etmeli.
var _dmg_x=(room==room_battle_1 ? p2_draw_x : x);

switch(Battle_GetMenu()){
    case BATTLE_MENU.FIGHT_TARGET:
        //Create enemy's hp bar
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
        
        //Create damage number
        var inst=instance_create_depth(_dmg_x,y,0,battle_damage);
        inst.damage=dmg;
        inst.bar_hp_max=_hp_max;
        inst.bar_hp_original=hp_orig;
        inst.bar_hp_target=_hp;
        
        //Play damage sound and shake
        if(dmg>0){
            audio_play_sound(snd_damage,0,false);
            var shake=instance_create_depth(0,0,0,shaker);
            shake.target=self;
            // Phase 2'de Papyrus ve Alphys de bu nesne tarafindan ciziliyor.
            // "x"i sarsarsak ucu birden titriyordu; p2_shake_x sadece Sans'in
            // ciziimine giriyor.
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
    
	    // MISS yazısını göster
	    var inst=instance_create_depth(_dmg_x,y-250,0,battle_damage);
	    inst.damage=dmg;
	    inst.bar_visible=false; // HP barı gösterme
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
			
		//Create damage number
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
		
		//Create damage number
       /* var inst=instance_create_depth(320,y-250,0,battle_damage);
        inst.damage=dmg;
        inst.bar_hp_max=_hp_max;
        inst.bar_hp_original=hp_orig;
        inst.bar_hp_target=_hp;*/
		break;
	}
}
