function Player_HurtKr() {
	var kr=Player_GetKr();
	var hp=Player_GetHp();
	if(hp>1){
		Player_Hurt(2);
		if(kr<40){
			Player_SetKr(kr+1);
		}
	}else{
		if(Player_GetKr()>0){
			Player_SetKr(kr-1);
		}else{
			Player_SetHp(0);
		}
	}
	Player_SetKrTimer(-1);
	return true;


}
