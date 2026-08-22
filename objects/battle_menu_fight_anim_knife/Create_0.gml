depth=DEPTH_BATTLE.UI;
image_speed=1;
audio_play_sound(snd_slice,0,false);
if global.go_dodge="miss"{
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.QUART,ANIM_EASE.OUT,320,-110,40);
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.QUART,ANIM_EASE.OUT,210,110,40,40);
}
// Bloklama animasyonu sadece hedef Sans oldugunda oynamali; phase 2'de
// Papyrus ve Alphys de birer dusman slotu.
var _target_slot=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
var _hit_sans=(instance_exists(battle_enemy_engage) && _target_slot==battle_enemy_engage._enemy_slot);

if (room == room_battle_1) and (global.go_dodge == "block") and (_hit_sans)
{
	with (o_sans_blockp2)
	{
		sprite_index = spr_p2_block;
		shakemoment = true;
	}
}

// Papyrus'un kemik duvari da tam burada kalkiyor: slash animasyonu basliyor,
// duvar 4 karede yukseliyor ve vurus dustugunde tam yukarida oluyor.
// (Nisan alma asamasinda kaldirinca cok erken cikip vurustan once iniyordu.)
if (_target_slot == 0) and (instance_exists(battle_enemy_engage))
{
	with (battle_enemy_engage)
	{
		pap_block_state = 1;
		pap_block_image = 0;
		pap_block_timer = pap_block_hold;
	}
}