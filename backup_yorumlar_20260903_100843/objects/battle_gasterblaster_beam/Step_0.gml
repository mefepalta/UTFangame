timer++
if(place_meeting(x,y,battle_soul)){
	if image_alpha > 0.2{
	if(global.kr){
		if (!instance_exists(hurtkr)){
			instance_create_depth(0, 0, 0, hurtkr)
			}
		}else{
			// FAZ 2 -- klasik hasar. Eskiden burada hem Battle_CallSoulEventHurt
			// (kendi icinde Player_Hurt(4)) hem de Player_Hurt(10) vardi:
			// tek dokunus 14 hasar veriyordu. Artik tek yerden, tek deger.
			Battle_HurtNormal(DMG_BLASTER);
		}
	}
}