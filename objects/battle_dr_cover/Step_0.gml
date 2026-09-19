if(!kapan && !instance_exists(battle_soul_yellow_dr)){
	kapan=true;
}

if(kapan){
	alpha=max(0,alpha-fade);
	if(alpha<=0){
		instance_destroy();
	}
}else{
	alpha=min(1,alpha+fade);
}
