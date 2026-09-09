function Papyrus_SlamReset(){
global.enemystate="no_slam";
Battle_SetSoul(battle_soul_red);
battle_enemy_engage.slam_timer=0;
battle_enemy_engage.can_go=false;
battle_enemy_engage._body_image=0;
audio_play_sound(snd_grab,0,false);
var shake=instance_create_depth(0,0,0,shaker);
shake.target=battle_enemy_engage;
shake.var_name="x";
shake.shake_distance=6;
shake.shake_decrease=3;
shake.shake_speed=4;
if battle_enemy_engage._legs_image=1{
	battle_enemy_engage._legs_image=0;
}
}