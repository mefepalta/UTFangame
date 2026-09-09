function Item_GetNumber() {
	if(variable_global_exists("no_heal") && global.no_heal && (room==room_battle || room==room_battle_1)){
		return 0;
	}

	var proc=0;
	var num=0;
	repeat(8){
		if(Item_IsValid(Item_Get(proc))){
			num+=1;
		}
		proc+=1;
	}
	return num;


}
