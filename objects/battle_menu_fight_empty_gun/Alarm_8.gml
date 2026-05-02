///@desc Damage!
var ATK=Player_GetAtkTotal();
var DEF=Battle_GetEnemyDEF(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy()));
var DISTANCE=point_distance(x,y,(_aim_x1+_aim_x2+_aim_x3+_aim_x4+_aim_x5+_aim_x6)/6,y);
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
Battle_SetMenuFightDamage(damage+round(extra_damage));
Battle_SetMenuFightAnimTime(80);
Battle_SetMenuFightDamageTime(80);
Battle_EndMenuFightAim();