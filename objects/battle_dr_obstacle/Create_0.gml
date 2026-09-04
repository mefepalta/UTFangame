event_inherited();

depth=DEPTH_BATTLE.BULLET;

spd_y=5;
half_w=100;

bone_scale=2;
bone_cap=sprite_get_height(spr_paps_bonetop)*bone_scale;
bone_shaft=5*bone_scale;
bar_h=bone_shaft;

outside=false;

stop_y=0;

blue_off=0;
blue_w=9999;

broken=false;
split_at=0;
tam_mavi=false;

piece_off=0;
piece_dy=0;
piece_vx=2.6;
piece_vy=-3;
piece_grav=0.42;
piece_rot=0;
piece_rot_spd=3;

function break_bar(CUT_X){
	if(broken){
		return;
	}
	if(abs(CUT_X-(x+blue_off))>blue_w/2){
		return;
	}
	broken=true;
	tam_mavi=(blue_w>=half_w*2);
	split_at=clamp(CUT_X,x+blue_off-blue_w/2,x+blue_off+blue_w/2);
	audio_play_sound(snd_break_0,0,false);
}

function rot_x(LX,LY,ANG){
	return LX*dcos(ANG)+LY*dsin(ANG);
}
function rot_y(LX,LY,ANG){
	return -LX*dsin(ANG)+LY*dcos(ANG);
}

function draw_rot_rect(CX,CY,W,H,ANG,COL){
	var HW=W/2;
	var HH=H/2;
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex_color(CX+rot_x(-HW,-HH,ANG),CY+rot_y(-HW,-HH,ANG),COL,1);
	draw_vertex_color(CX+rot_x( HW,-HH,ANG),CY+rot_y( HW,-HH,ANG),COL,1);
	draw_vertex_color(CX+rot_x(-HW, HH,ANG),CY+rot_y(-HW, HH,ANG),COL,1);
	draw_vertex_color(CX+rot_x( HW, HH,ANG),CY+rot_y( HW, HH,ANG),COL,1);
	draw_primitive_end();
}

function draw_bone_cap(CX,CY,ANG,COL){
	var SW=sprite_get_width(spr_paps_bonetop);
	var SH=sprite_get_height(spr_paps_bonetop);
	var DX=(SW/2-sprite_get_xoffset(spr_paps_bonetop))*bone_scale;
	var DY=(SH/2-sprite_get_yoffset(spr_paps_bonetop))*bone_scale;
	draw_sprite_ext(spr_paps_bonetop,0,CX-rot_x(DX,DY,ANG),CY-rot_y(DX,DY,ANG),bone_scale,bone_scale,ANG,COL,1);
}

function draw_bone(CX,CY,W,ANG,CAP_L,CAP_R,COL){
	if(W<=1){
		return;
	}
	var HW=W/2;

	var SL=-HW+(CAP_L ? bone_cap : 0);
	var SR=HW-(CAP_R ? bone_cap : 0);
	if(SR>SL){
		var SC=(SL+SR)/2;
		draw_rot_rect(CX+rot_x(SC,0,ANG),CY+rot_y(SC,0,ANG),SR-SL,bone_shaft,ANG,COL);
	}

	if(CAP_L){
		var LX=-HW+bone_cap/2;
		draw_bone_cap(CX+rot_x(LX,0,ANG),CY+rot_y(LX,0,ANG),ANG+90,COL);
	}
	if(CAP_R){
		var RX=HW-bone_cap/2;
		draw_bone_cap(CX+rot_x(RX,0,ANG),CY+rot_y(RX,0,ANG),ANG-90,COL);
	}
}
