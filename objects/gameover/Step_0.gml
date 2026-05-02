timee++;
/*if timee = 0{
	x=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X);
    y=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y);
}
if timee = 30{
	sprite_ = spr_soul_game_over;
    audio_play_sound(snd_break_0,0,false);
}
if timee = 45{
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	instance_create_depth(Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_X),Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.GAMEOVER_SOUL_Y),0,gameover_shard);
	audio_play_sound(snd_break_1,0,false);
	alpg=0;
}
if timee = 175{
	room_goto(room_battle)
}