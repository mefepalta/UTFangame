var SURF=Battle_GetBoardSurface();
if(!surface_exists(SURF)){
	exit;
}

//Kullanılınca genişleyerek sönüyor
var R=used ? ring_r*(1+(1-pop)*0.9) : ring_r;
if(R<=1){
	exit;
}

surface_set_target(SURF);
//Alfa kullanma: kutu yüzeyi iki kez kopyalanırken alfa<1 siyaha eriyor
draw_set_alpha(1);

draw_set_color(make_color_rgb(60,190,255));
draw_circle(x,y,R,false);
draw_set_color(make_color_rgb(8,18,55));
draw_circle(x,y,max(0,R-3),false);
draw_set_color(make_color_rgb(60,190,255));
draw_circle(x,y,max(0,R-8),false);

draw_set_alpha(1);
draw_set_color(c_white);
surface_reset_target();
