var COL=make_color_rgb(35,35,175);
var WHT=make_color_rgb(235,235,235);

var _bl=x-half_w;
var _br=x+half_w;
var _cl=clamp(x+blue_off-blue_w/2,_bl,_br);
var _cr=clamp(x+blue_off+blue_w/2,_bl,_br);

if(!outside){
	var SURF=Battle_GetBoardSurface();
	if(!surface_exists(SURF)){
		exit;
	}
	surface_set_target(SURF);
}

draw_set_alpha(1);

if(_cl-_bl>1){
	draw_bone((_bl+_cl)/2,y,_cl-_bl,0,true,true,WHT);
}
if(_br-_cr>1){
	draw_bone((_cr+_br)/2,y,_br-_cr,0,true,true,WHT);
}

if(!broken){
	if(_cr-_cl>1){
		draw_bone((_cl+_cr)/2,y,_cr-_cl,0,true,true,COL);
	}
}else{
	var PY=y+piece_dy;

	var LW=split_at-_cl;
	if(LW>1){
		draw_bone((_cl+split_at)/2-piece_off,PY,LW,-piece_rot,true,false,COL);
	}

	var RW=_cr-split_at;
	if(RW>1){
		draw_bone((split_at+_cr)/2+piece_off,PY,RW,piece_rot,false,true,COL);
	}
}

draw_set_alpha(1);
draw_set_color(c_white);

if(!outside){
	surface_reset_target();
}
