function Player_Hurt() {
	var DAMAGE=argument[0];

	// EASY: alinan hasar sabit 1. Tum mermi ve isin yollari buradan geciyor,
	// o yuzden tek nokta yeterli. Negatif deger iyilestirme, dokunulmuyor.
	DAMAGE=Difficulty_Hasar(DAMAGE);

	if(DAMAGE>=0){
		var HP=Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.HP);
		Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.HP,(HP-DAMAGE>=0 ? HP-DAMAGE : 0));
		return true;
	}else{
		return Player_Heal(-DAMAGE);
	}


}
