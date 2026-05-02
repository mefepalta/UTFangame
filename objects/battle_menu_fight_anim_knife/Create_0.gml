depth=DEPTH_BATTLE.UI;
image_speed=1;
audio_play_sound(snd_slice,0,false);
if global.go_dodge="miss"{
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.QUART,ANIM_EASE.OUT,320,-110,40);
	Anim_Create(battle_enemy_engage,"x",ANIM_TWEEN.QUART,ANIM_EASE.OUT,210,110,40,40);
}
if (room == room_battle_1) and (global.go_dodge == "block")
{
	with (o_sans_blockp2)
	{
		sprite_index = spr_p2_block;
		shakemoment = true;
	}
}