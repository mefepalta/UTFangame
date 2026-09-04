event_inherited();

depth=DEPTH_BATTLE.BULLET;

spd_y=5;			//taban hız; hızlanmayı ruhun world_mul'u belirliyor
half_w=100;

//Kemik ölçüleri. Uçlar spr_paps_bonetop (13x6), arası düz şaft ile dolduruluyor.
bone_scale=2;
bone_cap=sprite_get_height(spr_paps_bonetop)*bone_scale;	//ucun kemik boyunca uzunluğu
bone_shaft=5*bone_scale;									//şaft kalınlığı (sprite'ta 5 px)
bar_h=bone_shaft;											//çarpışma yüksekliği = şaft

//Kutu yuzeyine mi yoksa dogrudan ekrana mi cizilecek. Ekrana cizilen bar
//kutunun disinda da gorunuyor.
outside=false;

//0 disinda bir deger verilirse bar bu y de durup orada bekliyor.
stop_y=0;

//Mavi pencere: barin SADECE bu bolumu guc hareketiyle kirilip gecilebiliyor.
//Geri kalani beyaz; beyaz kisimdan dash yapilamiyor, normal hasar veriyor.
//Varsayilan genislik bari tamamen kapsiyor, yani bar bastan sona mavi.
blue_off=0;
blue_w=9999;

//Mavi pencere kırıldı mı. Kırılınca SADECE o pencere gidiyor, beyaz kısımlar
//yerinde kalıp hasar vermeye devam ediyor.
broken=false;
split_at=0;			//kırılma noktası
tam_mavi=false;		//bar baştan sona maviyse kırılınca geriye hiçbir şey kalmıyor

//Kırıldıktan sonra iki parçanın savrulması
piece_off=0;		//yatay uzaklaşma (sol -, sağ +)
piece_dy=0;			//dikey savrulma (önce yukarı, sonra düşüş)
piece_vx=2.6;
piece_vy=-3;		//kırılma anındaki yukarı fırlama
piece_grav=0.42;
piece_rot=0;		//dönüş açısı (sol -, sağ +)
piece_rot_spd=3;

///@arg cut_x kalbin engeli ikiye ayırdığı x konumu
function break_bar(CUT_X){
	if(broken){
		return;
	}
	//Beyaz bolumden gecilmiyor: vurus mavi pencerenin disindaysa bar kirilmiyor
	if(abs(CUT_X-(x+blue_off))>blue_w/2){
		return;
	}
	broken=true;
	tam_mavi=(blue_w>=half_w*2);
	//Kırılma noktası mavi pencerenin içinde kalıyor: savrulan parçalar sadece
	//o pencerenin iki yarısı, beyaz kısımlara hiç dokunulmuyor.
	split_at=clamp(CUT_X,x+blue_off-blue_w/2,x+blue_off+blue_w/2);
	audio_play_sound(snd_break_0,0,false);
}

//--- Döndürme yardımcıları (GameMaker yönü: pozitif açı = saat yönünün tersi) ---
function rot_x(LX,LY,ANG){
	return LX*dcos(ANG)+LY*dsin(ANG);
}
function rot_y(LX,LY,ANG){
	return -LX*dsin(ANG)+LY*dcos(ANG);
}

///Merkezi (CX,CY) olan, ANG derece döndürülmüş dolu dikdörtgen
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

///Kemik ucunu, sprite origin'i neresi olursa olsun merkezi (CX,CY)'ye gelecek şekilde çizer
function draw_bone_cap(CX,CY,ANG,COL){
	var SW=sprite_get_width(spr_paps_bonetop);
	var SH=sprite_get_height(spr_paps_bonetop);
	var DX=(SW/2-sprite_get_xoffset(spr_paps_bonetop))*bone_scale;
	var DY=(SH/2-sprite_get_yoffset(spr_paps_bonetop))*bone_scale;
	draw_sprite_ext(spr_paps_bonetop,0,CX-rot_x(DX,DY,ANG),CY-rot_y(DX,DY,ANG),bone_scale,bone_scale,ANG,COL,1);
}

///Yatay kemik çiz.
///CX,CY merkez | W uzunluk | ANG dönüş | CAP_L/CAP_R o uçta kemik başlığı var mı
function draw_bone(CX,CY,W,ANG,CAP_L,CAP_R,COL){
	if(W<=1){
		return;
	}
	var HW=W/2;

	//Şaft SADECE uçların arasını dolduruyor. Kemik boyunca uçların altına
	//kadar uzatılırsa, ucun tepesindeki çentik boşluğunu doldurup
	//kemiği düz bir çubuğa çeviriyor.
	var SL=-HW+(CAP_L ? bone_cap : 0);
	var SR=HW-(CAP_R ? bone_cap : 0);
	if(SR>SL){
		var SC=(SL+SR)/2;
		draw_rot_rect(CX+rot_x(SC,0,ANG),CY+rot_y(SC,0,ANG),SR-SL,bone_shaft,ANG,COL);
	}

	//Uçlar: sprite dikey (ucu yukarı bakıyor), +90 sola, -90 sağa çevirir
	if(CAP_L){
		var LX=-HW+bone_cap/2;
		draw_bone_cap(CX+rot_x(LX,0,ANG),CY+rot_y(LX,0,ANG),ANG+90,COL);
	}
	if(CAP_R){
		var RX=HW-bone_cap/2;
		draw_bone_cap(CX+rot_x(RX,0,ANG),CY+rot_y(RX,0,ANG),ANG-90,COL);
	}
}
