function MakeSlash(xSlash,ySlash,angleSlash,timerSlash,beamColor){
	slash = instance_create_depth(xSlash,ySlash,-20000,Obj_Slash);
	slash.x=xSlash;
	slash.y=ySlash;
	slash.image_angle=angleSlash;
	slash._beam_timer=timerSlash;
	slash._beam_color=beamColor;
}