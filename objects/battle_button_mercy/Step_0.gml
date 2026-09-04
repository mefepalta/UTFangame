var STATUS=Battle_GetState();
var MENU=Battle_GetMenu();
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
}else if image_index = 0{
	_timer = 0;
}