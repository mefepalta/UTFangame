
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
