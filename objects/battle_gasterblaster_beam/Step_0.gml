timer++
if(place_meeting(x,y,battle_soul)){
	if image_alpha > 0.2{
	if(global.kr){
		if (!instance_exists(hurtkr)){
			instance_create_depth(0, 0, 0, hurtkr)
			}
		}else{
			if(global._inv<1){
				Battle_CallSoulEventHurt();
				Player_Hurt(10);
			}
		}
	}
}