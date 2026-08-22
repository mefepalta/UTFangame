//Kutunun dışında yol aldığı için doğrudan ekrana çiziliyor, alfa serbest.

//--- Parçalarına ayrılmış büyük kutu ---
if(split){
	var PA=1-(split_time/split_max);
	PA=1-max(0,(PA-0.55)/0.45);			//son üçte birde sönüyor
	for(var i=0;i<4;i++){
		var A=piece_ang[i];
		var PX=x+lengthdir_x(piece_off,A);
		var PY=y+lengthdir_y(piece_off,A)+piece_dy;
		draw_sprite_ext(spr_dr_box_part,0,PX,PY,2,2,-90*i+piece_rot,c_white,PA);
	}
	exit;
}

var SC=1;
var AL=1;
if(dead){
	var T=1-(death_time/death_max);
	SC=1+T*0.9;
	AL=1-T;
}
//Ayna kutuya yaklaştıkça sönüyor
AL*=fade;

//Kutular sekizgen, döndürülmüyor. Ayna yüzeyi gidişe dik duruyor.
var ANG=(kind==DR_TARGET.MIRROR ? dir+90 : 0);

draw_sprite_ext(sprite_index,0,x,y,SC,SC,ANG,c_white,AL);

//Vuruş parlaması: aynı kare üstüne toplamalı çizilince beyaz patlıyor
if(flash>0){
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,0,x,y,SC,SC,ANG,c_white,AL*(flash/6)*0.8);
	gpu_set_blendmode(bm_normal);
}
