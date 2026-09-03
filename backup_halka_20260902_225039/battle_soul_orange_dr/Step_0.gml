event_inherited();

var STATE=Battle_GetState();
var ACTIVE=(STATE==BATTLE_STATE.IN_TURN && moveable);

//移动: sadece yatay. Ruh Y ekseninde hareket edemez.
if(ACTIVE){
	var SPD=Player_GetSpdTotal();
	SPD=(Input_IsHeld(INPUT.CANCEL) ? SPD/2 : SPD);
	repeat(SPD*10){
		if(Input_IsHeld(INPUT.LEFT)){
			if(!position_meeting(x-sprite_width/2,y,block)){
				x-=0.1;
			}
		}
		if(Input_IsHeld(INPUT.RIGHT)){
			if(!position_meeting(x+sprite_width/2,y,block)){
				x+=0.1;
			}
		}
	}
}

if(tap_cd>0){
	tap_cd-=1;
}
if(strike_time>0){
	strike_time-=1;
}
if(dash_time>0){
	dash_time-=1;
}

//Hızlanma yavaşça sönüp dünya orijinal hızına dönüyor
if(speed_boost>0){
	speed_boost=max(0,speed_boost-1/speed_boost_dur);
}

//Havadayken vuruş yapılamaz, sadece sağa sola hizalanılır
if(ACTIVE && !airborne){
	//--- Z'ye basıldığı anda ufak hareket çıkar (bırakmayı beklemez) ---
	if(Input_IsPressed(INPUT.CONFIRM) && tap_cd<=0){
		do_strike(1);
	}

	//--- Z basılı: güç hareketi şarj oluyor, turuncu daireler kalbe doğru akıyor ---
	if(Input_IsHeld(INPUT.CONFIRM)){
		charging=true;
		if(charge<charge_max){
			charge+=1;
			if(charge==charge_max){
				//snd_chance kullanilmisti ama o bir muzik parcasi: projede
				//baska yerde loop'lu calisiyor ve sarj her doldugunda ust
				//uste biniyordu. Kisa bir isaret sesi dogru olan.
				audio_play_sound(snd_ding,0,false);
			}
		}

		//Şarj dolduktan sonra yeni daire üretilmiyor; yoldakiler kalbe girip bitiyor
		if(charge<charge_max){
			orb_timer-=1;
			if(orb_timer<=0){
				orb_timer=3;
				array_push(orbs,{
					ang:irandom(359),
					dis:34+irandom(14),
					a:0,
					spd:1.6+random(1.2)
				});
			}
		}
	}else if(charging){
		//--- Z bırakıldı: sadece tam şarjlıysa güç hareketi çıkar ---
		if(charge>=charge_max){
			do_strike(2);
		}
		charging=false;
		charge=0;
		orbs=[];
	}
}else{
	charging=false;
	charge=0;
	orbs=[];
}

//Vuruş kutusu tek kare değil, strike_time boyunca açık kalıyor.
//Menzile o sırada giren engeller de ayrılıyor, zamanlama affedici oluyor.
if(strike_time>0){
	with(battle_dr_obstacle){
		if(!broken && abs(y-other.y)<=other.strike_rad){
			break_bar(other.x);
			//break_bar vuruş mavi pencerenin dışındaysa kırmadan dönüyor,
			//o yüzden zinciri uzatmadan önce gerçekten kırıldı mı diye
			//bakılıyor.
			if(broken && other.strike_pow==2){
				//ZİNCİR: kırılan her mavi bar vuruş penceresini baştan
				//başlatıyor, hızlanmayı tazeliyor ve dash izini yeniliyor.
				//Böylece tek input ile art arda kırış sürüyor.
				other.strike_time=other.chain_time;
				other.strike_dur=other.chain_time;
				other.speed_boost=max(other.speed_boost,1);
				other.dash_time=other.dash_max;
				other.dash_scale=1.15;

			}
		}
	}
}

//SUREKLI HALKA ARAMA
//Vurus penceresi acik oldugu SURECE daire aranir. do_strike sadece cikis
//aninda bakiyordu; zincir (kemik kirdikca yenilenen dash) cok daha uzun
//surdugu icin zincir devam ederken gelen halkalar yakalanmiyordu.
if(ACTIVE && !airborne && strike_time>0 && strike_pow==2){
	var RING=find_ring();
	if(RING!=noone){
		start_jump(RING);
	}
}

//--- Zıplama modu ---
var W_SPD=5;
if(instance_exists(battle_dr_corridor)){
	W_SPD=battle_dr_corridor.scroll_spd;
}

//Güç hareketi biraz erken yapıldıysa, daire menzile girene kadar bekliyor
if(!airborne && jump_buffer>0){
	jump_buffer-=1;
	var RING=find_ring();
	if(RING!=noone){
		start_jump(RING);
	}
}

if(airborne){
	jump_t+=W_SPD/jump_dist;

	//İnişte yeni bir zıplama dairesine denk gelirsen zincir sürüyor
	if(jump_t>=jump_land_from){
		var RING=find_ring();
		if(RING!=noone){
			RING.used=true;
			jump_t=0;
			jump_chain+=1;
			audio_play_sound(snd_bell,0,false);

			//Zincir inisi de vurus penceresini tazeliyor (bkz. start_jump)
			strike_pow=2;
			strike_rad=78;
			strike_time=chain_time;
			strike_dur=chain_time;
		}
	}

	//Daire kaçtı: orijinal turuncu ruh moduna dön
	if(jump_t>=1+jump_grace){
		airborne=false;
		jump_t=0;
		jump_chain=0;
		audio_play_sound(snd_impact,0,false);
	}
}

//Kalp önce büyüyor (kameraya yaklaşıyor), düşerken orijinal boyutuna dönüyor
jump_scale=airborne ? 1+jump_scale_max*dsin(clamp(jump_t,0,1)*180) : 1;

//Dünya hızı: zıplama zinciri uzadıkça artıyor, jump_chain_max'ta sabitleniyor
var JM_TARGET=1;
if(airborne){
	var CH=min(jump_chain,jump_chain_max);
	JM_TARGET=1+(jump_mul_max-1)*(CH/jump_chain_max);
}
jump_mul_cur=lerp(jump_mul_cur,JM_TARGET,0.08);
world_mul=(1+(speed_mul-1)*speed_boost)*jump_mul_cur;

//Daireler şeffaf başlar, hızlıca opak hale gelip kalbe girer.
for(var i=array_length(orbs)-1;i>=0;i--){
	var ORB=orbs[i];
	ORB.dis-=ORB.spd;
	ORB.a=min(1,ORB.a+0.18);
	if(ORB.dis<=2){
		array_delete(orbs,i,1);
	}
}
