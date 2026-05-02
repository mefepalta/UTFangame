timerr++;
if timerr = 40{
	index_soul = 1;
	audio_play_sound(snd_break_0,0,false);
}
if timerr = 80{
	alpha_soul = 0;
	audio_play_sound(snd_break_1,0,false);
	repeat(6){
		instance_create_depth(xxx,yyy,0,gameover_shard);
	}
}
if timerr = 160{
	BGM_SetVolume(bgm_game_over,game_over_volume);
	audio_play_sound(bgm_game_over,0,true);
	Anim_Create(id,"game_over_volume",ANIM_TWEEN.QUART,ANIM_EASE.OUT,0,100,90);
	Anim_Create(id,"alpha_over",0,1,0,1,80);
	Anim_Create(id,"ygm",ANIM_TWEEN.QUART,ANIM_EASE.OUT,-200,350,90);
	Anim_Create(id,"gastuh_alpha",0,1,0,1,80);
}
if timerr = 200{
	bruh=instance_create_depth(200,370,0,text_typer);
	bruh.text="This fate has no end{pause}{clear}But you're still determined"+string(FLAG_STATIC.NAME)+"Do not let this fate to beat you";
}
if ending=true{
	end_time++;
}
if end_time = 170{
	if selection = 1{
	audio_pause_sound(bgm_game_over)
	Anim_Create(id,"game_over_volume",ANIM_TWEEN.QUART,ANIM_EASE.OUT,100,-100,60);
	room_goto(room_battle);
	}else{
		audio_pause_sound(bgm_game_over)
	    Anim_Create(id,"game_over_volume",ANIM_TWEEN.QUART,ANIM_EASE.OUT,100,-100,60);
		game_end();
	}
}