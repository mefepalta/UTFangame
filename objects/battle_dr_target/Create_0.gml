event_inherited();

//Ekranın dışından 8 açıdan merkezdeki ruha doğru yaklaşan hedef.
//Kutunun dışında yol aldığı için doğrudan ekrana çiziliyor.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_LOW;

kind=DR_TARGET.NORMAL;
dir=0;				//ruha doğru gidiş yönü
spd=1.6;

hit_r=12;			//mermiyle çarpışma yarıçapı
reach_r=18;			//ruha bu kadar yaklaşınca temas sayılıyor (setup ile ölçeklenir)

//Kutular sekizgen olduğu için döndürülmüyorlar, pikselleri net kalsın.
//Sadece ayna gidiş yönüne dik duruyor, yüzeyi ruha bakıyor.
flash=0;			//vurulduğunda kısa parlama

//Aynalar kutuya yaklaşınca sönüp yok oluyor, yoksa oyuncunun
//atış açılarını kapatıyorlar. fade 1'den 0'a inince obje siliniyor.
fade=1;
fade_start=105;		//bu mesafeden itibaren sönmeye başlıyor
fade_end=58;		//burada tamamen yok oluyor (kutunun hemen dışı)
inert_at=0.4;		//bu saydamlığın altında artık mermi yansıtmıyor

dead=false;
death_time=0;
death_max=14;

//--- Büyük hedef: güç vuruşu yiyince önce çatlıyor, kısa süre sonra
//--- çatlaklarından dört parçaya ayrılıyor.
cracked=false;
crack_time=0;
crack_max=20;		//çatlak halinde bekleme süresi
split=false;
split_time=0;
split_max=42;		//parçaların savrulup kaybolma süresi

piece_off=0;		//parçaların merkezden dışa açılması
piece_dy=0;			//ortak düşüş
piece_vy=-2.4;		//kırılma anındaki yukarı fırlama
piece_grav=0.35;
piece_spread=1.8;
piece_rot=0;
piece_rot_spd=4;

//Parçaların çeyrek konumları: spr_dr_box_part sol üst çeyrek çiziyor,
//-90'ın katlarıyla döndürülünce diğer üç çeyreği veriyor.
piece_ang=[135,45,315,225];

///Türe göre sprite, ölçü ve hız ayarları
function setup(KIND){
	kind=KIND;
	if(KIND==DR_TARGET.BIG){
		sprite_index=spr_dr_box_large;
		hit_r=24;
		spd=1.2;
	}else if(KIND==DR_TARGET.MIRROR){
		sprite_index=spr_dr_box_mirror;
		hit_r=24;
		spd=1.4;
	}else{
		sprite_index=spr_dr_box;
		hit_r=12;
		spd=1.9;
	}
	//Temas yarıçapı: hedefin gövdesi + ruhun yarı boyu
	reach_r=hit_r*0.7+9;
}

///Güç vuruşu büyük hedefi çatlatır. Çatlak kutu yerinde durur,
///kısa süre sonra parçalarına ayrılır.
function crack(){
	if(cracked){
		return;
	}
	cracked=true;
	crack_time=crack_max;
	spd=0;
	sprite_index=spr_dr_box_large_cracked;
	audio_play_sound(snd_metalic,0,false);
	Camera_Shake(2,2,2,2);
}

setup(DR_TARGET.NORMAL);
