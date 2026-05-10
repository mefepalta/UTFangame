alarm[0]=1;
audio_play_sound(overworld_bg,1,true);

var warp_landmark=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_LANDMARK);
var warp_dir=Flag_Get(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_DIR);

if(warp_landmark!=-1&&instance_exists(hint_landmark)){
	var lx=x;
	var ly=y;
	with(hint_landmark){
		if(landmark_id==warp_landmark){
			lx=x;
			ly=y;
		}
	}
	x=lx;
	y=ly;
}
if(warp_dir!=-1){
	dir=warp_dir;
}

Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_LANDMARK,-1);
Flag_Set(FLAG_TYPE.TEMP,FLAG_TEMP.TRIGGER_WARP_DIR,-1);

var _found = false;
for(var i = 0; i < Phone_GetNumber(); i++){
    if(Phone_Get(i) == phone_asgore){
        _found = true;
        break;
    }
}
if(!_found){
    Phone_Add(phone_asgore);
}