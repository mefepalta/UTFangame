
var _target = Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());

switch(Battle_GetMenu()){
    case BATTLE_MENU.FIGHT_TARGET:
        var inst=instance_create_depth(0,0,0,battle_menu_fight_hp_bar);
        inst.enemy_slot=_enemy_slot;
        inst.hp_max=_hp_max;
        inst.hp=_hp;
        break;

    case BATTLE_MENU.FIGHT_DAMAGE:
        if(_target!=_enemy_slot){
            break;
        }

        var dmg=0;
        var hp_orig=_hp;

        var inst=instance_create_depth(x,y,0,battle_damage);
        inst.damage=dmg;
        inst.force_number=true;
        inst.bar_hp_max=_hp_max;
        inst.bar_hp_original=hp_orig;
        inst.bar_hp_target=_hp;

        audio_play_sound(snd_damage,0,false);
        var shake=instance_create_depth(0,0,0,shaker);
        shake.target=battle_enemy_engage;
        shake.var_name="alp_shake_x";
        shake.shake_distance=15;
        shake.shake_decrease=3;
        shake.shake_speed=4;
        break;
}
