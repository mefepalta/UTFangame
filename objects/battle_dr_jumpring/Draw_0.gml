var SURF=Battle_GetBoardSurface();
if(!surface_exists(SURF)){
	exit;
}

var R=used ? ring_r*(1+(1-pop)*0.9) : ring_r;
if(R<=1){
	exit;
}

surface_set_target(SURF);
draw_set_alpha(1);

var C_DIS=(kirmizi ? make_color_rgb(255,60,60) : make_color_rgb(60,190,255));
var C_IC=(kirmizi ? make_color_rgb(60,8,8) : make_color_rgb(8,18,55));
draw_set_color(C_DIS);
draw_circle(x,y,R,false);
draw_set_color(C_IC);
draw_circle(x,y,max(0,R-3),false);
draw_set_color(C_DIS);
draw_circle(x,y,max(0,R-8),false);

draw_set_alpha(1);
draw_set_color(c_white);
surface_reset_target();
