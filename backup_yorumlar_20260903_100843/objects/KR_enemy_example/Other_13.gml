///@desc Menu Switch
switch(Battle_GetMenu()){
	case BATTLE_MENU.FIGHT_ANIM:
		if(Battle_GetMenuFightDamage()>=0){
			/*if(_phase==2){
				audio_stop_all();
				audio_play_sound(snd_slice_echo,0,false);
				room_goto(room_end);
			}*/
			
			Anim_Create(self,"x",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,x,-100,25);
			Anim_Create(self,"x",ANIM_TWEEN.QUAD,ANIM_EASE.IN,x-100,100,25,35);
			Battle_SetMenuFightAnimTime(60);
		}
		break;
	case BATTLE_MENU.FIGHT_DAMAGE:
		instance_create_depth(x,y-125,0,battle_damage);
		break;
}