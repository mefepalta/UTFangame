if global.dodge==false{
	audio_play_sound(snd_hurt,0,false)
	var kr=Player_GetKr();
	var hp=Player_GetHp();
	var hit_kr = 3
	if(hp>2){
		if (hp!= 2){
			if global.easymode == false {
				if global.hardmode == false {
					Player_Hurt(2+global.krmore);
					alarm[0]=2
				}else{
					Player_Hurt(3+global.krmore);
				
					alarm[0]=1
				}
			}else{
				Player_Hurt(2+global.krmore);
				//global.hpcolor-=2+global.krmore;
				alarm[0]=6
			}
		}else{
			if global.easymode == false {
				if global.hardmode == false {
					Player_Hurt(1);
					//global.hpcolor-=1;
					alarm[0]=hit_kr
				}else{
					Player_Hurt(1);
					//global.hpcolor-=1;
					alarm[0]=hit_kr
				}
			}else{
				Player_Hurt(1);
				//global.hpcolor-=1;
				alarm[0]=6
			}
		}
			//audio_play_sound(snd_hurt,0,false);
		if(kr<90){
			if global.easymode == false {
				if global.hardmode == false {
					Player_SetKr(kr+2+global.krmore);
					alarm[0]=hit_kr
				}else{
					Player_SetKr(kr+3+global.krmore);
					alarm[0]=hit_kr
				}
			}else{
				Player_SetKr(kr+1+global.krmore)
				alarm[0]=6
			}
		}
	}else{
		if(kr>0){
			if global.easymode == false {
				if global.hardmode == false {
					Player_SetKr(kr-2-global.krmore);
					alarm[0]=hit_kr
				}else{
					Player_SetKr(kr-3-global.krmore);
					alarm[0]=hit_kr
				}
			}else{
				Player_SetKr(kr-1-global.krmore);
				alarm[0]=6
			}
			Player_SetHp(1)
		}else{
			if(instance_exists(battle_turn)){
				Player_SetHp(0)
			}else{
				if global.easymode == false {
					if global.hardmode == false {
						alarm[0]=hit_kr
						//global.hpcolor-=hit
					}else{
						alarm[0]=hit_kr
						//global.hpcolor-=hit
					}
				}else{
					alarm[0]=6
				}
				if(Player_GetHp()+Player_GetKr())==2{
					Player_SetHp(1);
				}
				Player_SetHp(1);
				Player_SetHp(1);
			}
		}
	}
	Player_SetKrTimer(-1);
}else{
	if global.easymode == false {
		if global.hardmode == false {
			alarm[0]=hit_kr
		}else{
			alarm[0]=hit_kr
		}
	}else{
		alarm[0]=6
	}
}
if kr > 92{
	Player_SetKr(92)
}