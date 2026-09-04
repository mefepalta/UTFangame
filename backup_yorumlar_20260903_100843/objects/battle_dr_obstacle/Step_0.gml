if(!instance_exists(battle_board)){
	exit;
}

//Kırılan mavi pencerenin iki yarısı dönerek dışa savrulup aşağı düşüyor.
//Bar bundan bağımsız olarak inmeye devam ediyor: beyaz kısımlar duruyor.
if(broken){
	piece_off+=piece_vx;
	piece_vy+=piece_grav;
	piece_dy+=piece_vy;
	piece_rot+=piece_rot_spd;
}

//Dünya hızını ruh belirliyor (güç hareketi + zıplama zinciri)
var MUL=1;
var AIR=false;
if(instance_exists(battle_soul_orange_dr)){
	MUL=battle_soul_orange_dr.world_mul;
	AIR=battle_soul_orange_dr.airborne;
}
y+=spd_y*MUL;

//Duracak noktası verilmişse orada kalıp tehdit olarak bekliyor
if(stop_y>0 && y>stop_y){
	y=stop_y;
}

//Kutu ile aynı genişlikte kal. Kırıldıktan sonra dondurulur, yoksa savrulan
//parçalar kutuyla birlikte yeniden hizalanıyor.
if(!broken){
	x=battle_board.x;
	half_w=max(battle_board.left,battle_board.right)+2;
}

//Bar beyaz atak işlevi görür. Havadaki ruha değmiyor. Kırılan mavi pencerenin
//yerinde artık boşluk var, ruh sadece oradan geçebiliyor.
if(instance_exists(battle_soul) && !AIR){
	var SW=battle_soul.sprite_width/2;
	var SH=battle_soul.sprite_height/2;
	var HIT=(battle_soul.x+SW>x-half_w && battle_soul.x-SW<x+half_w
		&& battle_soul.y+SH>y-bar_h/2 && battle_soul.y-SH<y+bar_h/2);

	if(HIT && broken){
		//Ruh tamamen boşluğun içindeyse geçiyor
		if(battle_soul.x-SW>=x+blue_off-blue_w/2 && battle_soul.x+SW<=x+blue_off+blue_w/2){
			HIT=false;
		}
	}

	if(HIT){
		if(global.kr){
			if(!instance_exists(hurtkr)){
				instance_create_depth(0,0,0,hurtkr);
			}
		}else{
			// FAZ 2 -- klasik hasar (bkz. scripts/Macro_Battle)
			Battle_HurtNormal(DMG_DR_BAR);
		}
	}
}

//Ekranın altına inen her şey yok ediliyor ki instance birikmesin
if(broken && tam_mavi){
	//Geriye beyaz kısım kalmadı, sadece savrulan parçalar var
	if(y+piece_dy-bar_h>room_height){
		instance_destroy();
	}
}else{
	if(y-bar_h>room_height || y-bar_h>battle_board.y+battle_board.down+20){
		instance_destroy();
	}
}
