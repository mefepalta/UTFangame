/// Hedeflenebilirlik.
///
/// Bir dusman slotta duruyor olabilir ama o an ekranda olmayabilir. Ornegin
/// phase 2'de 17-18. turlarda Sans sahne disina cikiyor; slotu birakamiyoruz
/// (tur dagitimi, ciziim ve savas mantigi ona bagli) ama FIGHT/ACT hedef
/// listesinde gorunmemesi gerekiyor.
///
/// Dusman ornegi uzerine _not_targetable = true yazarak listeden cikarilir.
/// Degisken tanimlamayan dusmanlar her zaman hedeflenebilir sayilir, boylece
/// mevcut davranis degismez.

///@arg enemy_slot
function Battle_IsEnemyTargetable() {
	var ENEMY=argument[0];

	var INST=Battle_GetEnemy(ENEMY);
	if(!instance_exists(INST)){
		return false;
	}
	if(variable_instance_exists(INST,"_not_targetable")){
		return !INST._not_targetable;
	}
	return true;


}

/// Hedef listesinde kac dusman var.
/// Battle_GetEnemyNumber ile karistirilmamali: o, savasin bitip bitmedigini
/// kontrol etmek icin slottaki tum dusmanlari sayar.
function Battle_GetEnemyTargetNumber() {
	var num=0;
	var proc=0;

	repeat(3){
		if(Battle_IsEnemyTargetable(proc)){
			num+=1;
		}
		proc+=1;
	}

	return num;


}
