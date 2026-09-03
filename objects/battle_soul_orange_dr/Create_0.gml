event_inherited();

moveable=true;

//Ruh ters duruyor
image_angle=180;

//--- Güç hareketi (Z basılı tutulunca dolan şarj) ---
charging=false;
charge=0;
charge_max=40;
orb_timer=0;
orbs=[];

//--- Ufak hareket (Z'ye basar basmaz çıkar, cooldown'lu) ---
tap_cd=0;
tap_cd_max=24;

//--- Zincir dash ---
//Güç hareketi bir MAVİ engeli kırdığında vuruş penceresi baştan başlıyor.
//Yani dash tek bir input; süresince önüne gelen mavi engelleri kendisi
//kırıyor ve her kırılış onu uzatıyor. Menzil içinde kıracak bir şey
//kaldığı sürece zincir sonsuza kadar sürebiliyor; kırılacak bir şey
//bulamadığı anda pencere dolup dash bitiyor.
//Oyuncunun tek işi zincir sürerken sağa sola gidip mavi pencerelere
//hizalanmak: hizasız kalan bar kırılmıyor ve zincir orada kopuyor.

//--- Dash efekti (Deltarune SOUL sheet'indeki 3 kare) ---
//Sprite'ın origin'i kuyruğun değil kafanın merkezinde: kafa ruhun üstünde
//kalıyor, kuyruk arkaya uzanıyor. Yön sabit yukarı, girdiyle değişmiyor.
dash_time=0;
dash_max=45;		//güç hareketi boyunca (speed_boost_dur ile aynı) görünüyor
dash_dir=90;		//90 = kuyruk aşağı, koridorda yukarı koşma yönü
dash_scale=1;
dash_off_y=6;		//kalbe göre ekranda aşağı kaydırma
dash_alpha_max=0.72;	//en parlak anındaki opaklık (1 = tamamen opak)
dash_fade_in=0.12;	//bu orana kadar açılıyor
dash_fade_from=0.7;	//bu orandan sonra sönüyor

///@arg scale dash çizgisinin büyüklüğü
function fire_dash(SC){
	dash_scale=SC;
	dash_time=dash_max;
}

//--- Vuruş dalgası ---
strike_time=0;

//--- VURUS HALKASI ANAHTARI ---
//Draw_0'daki genisleyen daire (vurus dalgasi). CIZIM KODU YERINDE,
//sadece cizilip cizilmeyecegi buradan belirleniyor.
//
//KAPALI: surekli dash sirasinda her kirilan bar vurus penceresini
//yeniden baslatiyor ve her carpismada bir halka patliyordu.
//
//GERI GETIRMEK ICIN: asagidaki strike_ring_ac degerini true yap.
//  true  -> halka oyuncunun kendi vurusunda cikar, zincir
//           tekrarlarinda cikmaz (Step_0 zinciri false'a cekiyor)
//  false -> halka hic cizilmez
strike_ring_ac=false;	//ANA ANAHTAR
strike_ring=false;		//o anki vurusta cizilecek mi (do_strike kuruyor)
strike_max=12;
//Zincir sürerken pencere daha uzun tutuluyor. Kırılış bar menzile GİRDİĞİ
//anda oluyor, yani sıradaki bar tam bir aralık kadar geride kalıyor:
//12 kare ona yetmiyordu. 26 kare güvenli tavanı ~150 px yapıyor.
chain_time=26;
//Acik pencerenin suresi. Cizimdeki halka animasyonu buna gore ilerliyor;
//strike_max sabitine bakilsaydi zincirde oran 1i asip yaricap negatife
//duserdi.
strike_dur=12;
strike_pow=0;
strike_rad=0;

//--- Güç hareketi sonrası hızlanma ---
//Z bırakılıp güç hareketi çıktığı anda 1 olur, sonra yavaşça 0'a inip
//dünya orijinal hızına döner. Şarj tutulurken hızlanma yok.
speed_boost=0;
speed_boost_dur=45;
speed_boost_tap=0.45;	//ufak hareketin verdiği daha küçük hızlanma

//--- Zıplama modu ---
//Bir zıplama dairesinin üstünde güç hareketi yapılınca başlar. Yay boyunca
//kalp büyür (kameraya yaklaşır), inerken normale döner. İniş anında yeni bir
//daireye denk gelinirse zincir sürer ve dünya hızlanır; kaçırılırsa
//normal turuncu ruh moduna dönülür.
airborne=false;
jump_t=0;				//0..1 tek bir zıplama yayının ilerlemesi
jump_dist=260;			//bir zıplamanın dünyada kat ettiği mesafe (px)
jump_grace=0.12;		//yay bittikten sonraki tolerans payı
jump_land_from=0.55;	//yayın bu noktasından sonra daireye konabilir
jump_chain=0;			//üst üste kaçıncı zıplama
jump_scale=1;			//kalbin görsel büyümesi
jump_scale_max=0.9;		//tepe noktasındaki ek büyüme oranı

//Güç hareketi daire menzile girmeden yapıldıysa birkaç kare hatırlanıyor.
//Erken basmayı affediyor; geç basmayı zaten hit_y toleransı karşılıyor.
jump_buffer=0;
jump_buffer_max=18;

///Menzildeki kullanılmamış zıplama dairesini döndürür, yoksa noone
function find_ring(){
	var RES=noone;
	with(battle_dr_jumpring){
		if(!used && abs(x-other.x)<=hit_x && abs(y-other.y)<=hit_y){
			RES=id;
		}
	}
	return RES;
}

///Zıplama modunu başlat
function start_jump(RING){
	RING.used=true;
	airborne=true;
	jump_t=0;
	jump_chain=1;
	jump_buffer=0;
	fire_dash(1.3);
	audio_play_sound(snd_bell,0,false);

	//Halkaya binmek de zinciri uzatiyor: vurus penceresi bastan basliyor,
	//boylece halkadan sonra gelen mavi barlar ayni dash ile kiriliyor.
	//Bunlar olmadan dash halkaya biner binmez oluyordu.
	strike_pow=2;
	strike_rad=78;
	strike_time=chain_time;
	strike_dur=chain_time;
}

//--- Dünya hızı: koridor, kemikler ve daireler bunu okuyor ---
speed_mul=1.8;			//güç hareketi sonrası anlık hızlanma
jump_chain_max=10;		//bu zincirden sonra hızlanma sabit kalıyor
jump_mul_max=2.4;		//10. zıplamadaki tavan hız
jump_mul_cur=1;
world_mul=1;

///@arg power 1=ufak hareket, 2=güç hareketi
function do_strike(POW){
	strike_pow=POW;
	strike_time=strike_max;
	strike_dur=strike_max;
	strike_ring=strike_ring_ac;	//halka ana anahtardan geliyor
	strike_rad=(POW==2 ? 78 : 52);

	if(POW==2){
		//Dash çizgisi sadece güç hareketinde çıkıyor, ufak harekette yok
		fire_dash(1.15);
		audio_play_sound(snd_punchstrong,0,false);
		Camera_Shake(3,3,4,4);
		speed_boost=max(speed_boost,1);

		//Altında zıplama dairesi varsa zıplama moduna geç.
		//Yoksa birkaç kare bekleyip daire gelirse yine de zıplat.
		var RING=find_ring();
		if(RING!=noone){
			start_jump(RING);
		}else{
			jump_buffer=jump_buffer_max;
		}
	}else{
		audio_play_sound(snd_punchweak,0,false);
		tap_cd=tap_cd_max;
		//Ufak hareket de hızlandırıyor, güç hareketinden az olmak üzere.
		//max ile: devam eden büyük hızlanmayı aşağı çekmiyor.
		speed_boost=max(speed_boost,speed_boost_tap);
	}
}

instance_create_depth(x,y,0,battle_soul_orange_effect);
