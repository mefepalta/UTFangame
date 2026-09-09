function Item_GetName() {
	var ITEM=argument[0];

	// EASY: butun itemler "MaxHeal" (yeme davranisi Item_CallEvent'te; isimler
	// de burada birlesiyor ki envanterde/aksiyonda tutarli gorunsun).
	if(Difficulty_Easy() && Item_IsValid(ITEM)){ return "MaxHeal"; }

	if(Item_IsValid(ITEM)){
		var INST=instance_create_depth(0,0,0,ITEM);
		var NAME=INST._name;
		instance_destroy(INST);
		return NAME;
	}else{
		return "";
	}


}
