var STATUS=Battle_GetState();
var MENU=Battle_GetMenu();
//image_blend = make_color_hsv(0,0,sat);
image_xscale=lerp(image_xscale,1,0.3);
image_yscale=lerp(image_yscale,1,0.3);
if(STATUS==BATTLE_STATE.MENU && MENU!=BATTLE_MENU.FIGHT_AIM && MENU!=BATTLE_MENU.FIGHT_ANIM && MENU!=BATTLE_MENU.FIGHT_DAMAGE){
	if(Battle_GetMenuChoiceButton()==_button_slot){
		image_index=1;
		if(MENU==BATTLE_MENU.BUTTON){
			battle_soul.x=lerp(battle_soul.x,x+16,0.5);
			battle_soul.y=lerp(battle_soul.y,y+22,0.5);
		}
	}else{
		image_index=0;
	}
}else{
	image_index=0;
}
if image_index = 1{
	_timer++;
	//image_alpha=lerp(image_alpha,1,0.1)
	//image_alpha=1;
	/*if _timer = 1{
		image_xscale=1.25;
	}*/
}else if image_index = 0{
	//image_alpha=lerp(image_alpha,0.5,0.1)
	_timer = 0;
}