/// @desc Alphys'in savas slotu (hedeflenebilir dusman)
// Ciziimi battle_enemy_engage yapiyor; bu nesne sadece FIGHT menusunde
// hedef olarak gorunmek, hasar almak ve kendi titremesini yonetmek icin var.
// battle_enemy_engage.alp_state 2 oldugunda kaydediliyor, 0 oldugunda siliniyor.

event_inherited();

depth = DEPTH_BATTLE.ENEMY;
visible = false;

_hp = 2500;
_hp_max = 2500;
