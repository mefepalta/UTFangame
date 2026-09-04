
if(split){
	var PA=1-(split_time/split_max);
	PA=1-max(0,(PA-0.55)/0.45);
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
AL*=fade;

var ANG=(kind==DR_TARGET.MIRROR ? dir+90 : 0);

draw_sprite_ext(sprite_index,0,x,y,SC,SC,ANG,c_white,AL);

if(flash>0){
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index,0,x,y,SC,SC,ANG,c_white,AL*(flash/6)*0.8);
	gpu_set_blendmode(bm_normal);
}
