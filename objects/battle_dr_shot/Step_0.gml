//--- Savrulmuş mermi: serbest düşüş, kimseye etki etmiyor ---
if(bounced){
	vy+=grav;
	x+=vx;
	y+=vy;
	ang+=spin;

	if(y-16>room_height || x<-60 || x>room_width+60){
		instance_destroy();
	}
	exit;
}

x+=lengthdir_x(spd,dir);
y+=lengthdir_y(spd,dir);
ang=dir;

life-=1;
if(life<=0){
	instance_destroy();
	exit;
}

//--- Hedeflere çarpma ---
var KILL_SELF=false;
with(battle_dr_target){
	//Sönmekte olan ayna artık yansıtmıyor, görünmeyen şeye çarpılmasın.
	//Çatlamış/parçalanmış kutu da artık hedef değil.
	if(dead || cracked || fade<inert_at || point_distance(x,y,other.x,other.y)>hit_r){
		continue;
	}
	flash=6;

	if(kind==DR_TARGET.MIRROR){
		//Ayna mermiyi geldiği yöne geri yansıtıyor
		other.dir=(other.dir+180) mod 360;
		other.reflected=true;
		other.x+=lengthdir_x(hit_r+6,other.dir);
		other.y+=lengthdir_y(hit_r+6,other.dir);
		audio_play_sound(snd_bell,0,false);
	}else if(kind==DR_TARGET.BIG && !other.big){
		//Küçük mermi büyük hedefi delemiyor: çarpıp geri savruluyor,
		//sonra yerçekimiyle dönerek düşüyor
		other.bounced=true;
		other.reflected=false;
		other.vx=lengthdir_x(2.4,other.dir+180)+random_range(-1.2,1.2);
		other.vy=-3;
		other.spin=random_range(-7,7);
		audio_play_sound(snd_metalic,0,false);
	}else if(kind==DR_TARGET.BIG){
		//Güç vuruşu büyük kutuyu çatlatıyor, kısa süre sonra parçalanıyor.
		//Mermi burada tükeniyor: delip geçseydi arkadaki aynaya gidip
		//oyuncuya geri dönüyordu.
		crack();
		KILL_SELF=true;
	}else{
		//Normal hedef her mermiyle ölüyor
		dead=true;
		death_time=death_max;
		audio_play_sound(snd_break_0,0,false);
		//Küçük mermi hedefte tükeniyor, büyük mermi delip geçiyor
		if(!other.big){
			KILL_SELF=true;
		}
	}
	break;
}

//--- Turuncu ruhun mavi kemik barlari ---
//Sari ruh kutunun merkezine cakili oldugu icin bu barlardan kacamiyor;
//tek cikis yolu vurmak. Sadece guc vurusu kiriyor, kucuk mermi sekiyor.
with(battle_dr_obstacle){
	if(broken || other.bounced){
		continue;
	}
	if(abs(other.y-y)>bar_h/2+6 || other.x<x-half_w || other.x>x+half_w){
		continue;
	}
	if(other.big){
		break_bar(other.x);
		KILL_SELF=true;
	}else{
		other.bounced=true;
		other.reflected=false;
		other.vx=lengthdir_x(2.4,other.dir+180)+random_range(-1.2,1.2);
		other.vy=-3;
		other.spin=random_range(-7,7);
		audio_play_sound(snd_metalic,0,false);
	}
	break;
}
if(KILL_SELF){
	instance_destroy();
	exit;
}

//--- Sekmiş mermi ruha çarparsa hasar veriyor (spam engelleyici) ---
if(reflected && instance_exists(battle_soul)){
	if(point_distance(x,y,battle_soul.x,battle_soul.y)<=10){
		if(global.kr){
			if(!instance_exists(hurtkr)){
				instance_create_depth(0,0,0,hurtkr);
			}
		}else{
			if(global._inv<1){
				Battle_CallSoulEventHurt();
			}
		}
		instance_destroy();
		exit;
	}
}

//Ekran dışına çıkanı temizle
if(x<-60 || x>room_width+60 || y<-60 || y>room_height+60){
	instance_destroy();
}
