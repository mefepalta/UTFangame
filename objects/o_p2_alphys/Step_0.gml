// Hedefleme oku, HP bari ve hasar sayisi bu konumu kullaniyor.
// Hizalama her adim degisebildigi icin ciziim konumunu buraya kopyaliyoruz.
if (_enemy_slot >= 0) and (instance_exists(battle_enemy_engage))
{
	x = battle_enemy_engage.alp_draw_x;
	y = battle_enemy_engage.y - 90;
	Battle_SetEnemyCenterPos(_enemy_slot,x,y);
}
