event_inherited();

//Sarı ruh küçük kutuda sabit duruyor, yer değiştirmiyor.
//Sadece nişan yönü değişiyor; kalbin ucu basılan yöne bakıyor.
moveable=false;

sprite_index=spr_dr_soul_yellow;
image_angle=0;			//sprite zaten ucu sağa bakacak şekilde çizili
aim=90;					//başlangıçta yukarı nişan alıyor

//--- Ateş ---
//Z'ye basınca küçük mermi, basılı tutup bırakınca büyük mermi.
charge=0;
charge_max=32;			//büyük merminin dolma süresi

//Güç vuruşu sayacı: tur objesi bunu okuyup dönüşümü tetikleyebiliyor
big_fired=0;

//Küçük atış kapatılabiliyor: sadece güç vuruşuna izin veren bölümler için
small_on=true;
charging=false;

//Dolum animasyonu: turuncu ruhtaki gibi etraftan kalbe akan daireler
orb_timer=0;
orbs=[];
tip_dist=13;			//merminin kalbin ucundan çıkma mesafesi

small_cd=0;
small_cd_max=9;

//Namlu geri tepmesi (sadece görsel)
recoil=0;

///Basılan yönlerden 8 yönlü nişan açısı üretir. Girdi yoksa açı korunur.
function aim_update(){
	var DX=0;
	var DY=0;
	if(Input_IsHeld(INPUT.LEFT)){
		DX-=1;
	}
	if(Input_IsHeld(INPUT.RIGHT)){
		DX+=1;
	}
	if(Input_IsHeld(INPUT.UP)){
		DY-=1;
	}
	if(Input_IsHeld(INPUT.DOWN)){
		DY+=1;
	}
	if(DX!=0 || DY!=0){
		//point_direction zaten 45'in katlarını veriyor: 8 yön
		aim=point_direction(0,0,DX,DY);
	}
}

///@arg big true ise büyük mermi
function fire(BIG){
	var SX=x+lengthdir_x(tip_dist,aim);
	var SY=y+lengthdir_y(tip_dist,aim);

	var SHOT=instance_create_depth(SX,SY,DEPTH_BATTLE.BULLET,battle_dr_shot);
	SHOT.big=BIG;
	SHOT.dir=aim;
	//ang çizimde kullanılıyor ve Create'te 0. Burada atanmazsa mermi
	//ilk karede sprite'ın ham açısıyla, yani yatay çiziliyor.
	SHOT.ang=aim;
	SHOT.image_angle=aim;
	SHOT.sprite_index=(BIG ? spr_dr_bullet_big : spr_dr_bullet_small);
	SHOT.spd=(BIG ? 9 : 13);

	recoil=(BIG ? 6 : 3);

	if(BIG){
		big_fired+=1;
		audio_play_sound(snd_gb_release,0,false);
		Camera_Shake(2,2,3,3);
	}else{
		audio_play_sound(snd_swift,0,false);
		small_cd=small_cd_max;
	}
}
