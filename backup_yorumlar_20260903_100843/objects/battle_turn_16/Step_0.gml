var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 1)
	{
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,87,6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,87,-6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 70)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,top_box,87,6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,87,-6,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 130)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,67,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,67,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,67,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,67,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box,152,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 210)
	{
		Battle_SlamDown();
		Battle_SetBoardSizeCubic(65,65,155,155);
	}
	if (_timer > 220) and (_timer < 720)
	{
		if (_timer % 52 == 0)
		{
			RegularBone(left_box,bottom_box,24,2.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,2.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 50,bottom_box,152,2.5,0,0,1,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 220)
	{
		RegularBlaster(320,-50,right_box - 30,top_box - 70,270,270,480,1,2,2,50);
	}
	if (_timer == 320)
	{
		RegularBlaster(320,-50,right_box - 80,top_box - 70,270,270,380,1,2,2,50);
	}
	if (_timer == 420)
	{
		RegularBlaster(320,-50,right_box - 130,top_box - 70,270,270,280,1,2,2,50);
	}
	if (_timer == 520)
	{
		RegularBlaster(320,-50,right_box - 180,top_box - 70,270,270,180,1,2,2,50);
	}
	if (_timer == 620)
	{
		RegularBlaster(320,-50,right_box - 230,top_box - 70,270,270,80,1,2,2,50);
	}
	if (_timer == 800)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 40,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 825)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(right_box,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 880)
	{
		RegularBlaster(320,-50,right_box + 60,bottom_box - 20,180,180,40,1,2,2,50);
	}
	if (_timer == 950)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer == 960)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,125,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,17,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,17,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,125,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 990)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,105,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,37,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,37,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1020)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,85,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,57,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,57,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,85,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1050)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,65,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,77,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,77,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1080)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,97,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,97,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,45,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1110)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,25,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,117,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,117,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1160)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
		RegularBlaster(-50,320,left_box - 10,top_box + 60,0,0,18,20,3,3,50);
		RegularBlaster(-50,320,left_box + 152,top_box - 100,0,270,18,20,3,3,50);
	}
	if (_timer == 1310)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* The Knight has appeared.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	//======================================================================
	// TURUNCU RUH ATAGI
	//======================================================================
	// Bes bolum, her biri ayri bir fiil, sonuncusu ikisini carpistiriyor:
	//
	//   1  zincir barlari   -> dash: tek vurus, sonra sadece hizalanma
	//   2  kutular          -> dash + serit degistirme + blaster
	//   3  ziplama zinciri  -> halkalari tutturma
	//   4  bileklik+ziplama -> bar "zipla" der, bileklik "simdi degil" der
	//   5  kapanis          -> hizli bir zincir kosusu
	//
	// TETIKLER KARE DEGIL YOL. Bolumler once sabit karelere baglanmisti ama
	// dunya dash ile 2.4 katina kadar hizlaniyor: iyi oynayan oyuncu bir
	// bolumu erken bitirip bir sonrakini sabit karesinde bekliyordu, yani
	// iyi oynadikca atak boslasiyordu. Simdi her bolum, dunyanin kat ettigi
	// toplam yol bir esige gelince doguyor. Esikler bir onceki bolumun son
	// parcasi kalbi gectikten hemen sonrasina denk gelecek sekilde secildi,
	// dolayisiyla tempo oyuncunun elinde ve hicbir zaman bosluk acilmiyor.
	//
	// Konuk (mini-boss) bu atakta yok, bir sonrakinde kullanilacak.
	// Calisan hali a02e0eb commitinde; oraya donerken kendi nesnesine
	// tasinacak ki her tur cagirabilsin.
	//======================================================================
	if (_timer == 1)
	{
		audio_play_sound(snd_bell,2,0);
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}

	// Koridor aciliyor: kutu ekran boyu uzuyor, ruh turuncuya donuyor.
	// Other_12'nin 25 karelik kutu animasyonu bunu ezmesin diye once iptal.
	if (_timer == 20)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(320,160,120,120,40);
		Battle_SetSoul(battle_soul_orange_dr);
		DrCorridor(false,4);
		Camera_Shake(3,3,2,2);
	}

	// Ruh kosu pozisyonuna (ekranin alt kismina) kayiyor.
	if (_timer == 60)
	{
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,400-battle_soul.y,50);
	}

	//----------------------------------------------------------------------
	// Dunyanin kat ettigi yol. Her sey bu hizla indigi icin bolum esikleri
	// de buradan okunuyor: oyuncu ne kadar hizlanirsa atak o kadar hizli
	// akiyor, arada bosluk kalmiyor.
	//----------------------------------------------------------------------
	if (instance_exists(battle_dr_corridor))
	{
		yol += battle_dr_corridor.scroll_spd;
	}

	//======================================================================
	// BOLUM 1 -- zincir barlari        ilk bar 440, son bar 800
	// Bes mavi bar 120 px arayla. Tek guc dashi hepsini kiriyor; oyuncunun
	// isi zincir surerken pencerelere hizalanmak. Atagin dilini aciyor.
	//======================================================================
	if (bolum == 0) and (_timer >= 60)
	{
		bolum = 1;
		// Butun esikler bu ana gore. Koridor 20. karede acildigi icin yol
		// buraya gelene kadar 160 px birikmis oluyordu; sifirlanmasaydi
		// asagidaki mesafelerin hepsi o kadar kayardi.
		yol = 0;
		ChainRun(4,120,60);
	}

	//======================================================================
	// BOLUM 2 -- kutular               ilk duvar 1080, son duvar 2120
	// Zincirin bittigi yerden 280 px sonra basliyor. Once 80 px idi -- niyet
	// son zincir barini kiran dashin kutunun alt duvarina da uzanmasiydi ama
	// iki mavi pencere ayni hizada olmadigi icin o baglanti zaten guvenilir
	// calismiyordu, sadece iki bolum ust uste binmis gibi duruyordu.
	// Esik dusuk cunku kutular ekranin cok uzerinde doguyor: ilk duvar
	// dogum noktasindan 590 px sonra kalbe variyor.
	//======================================================================
	if (bolum == 1) and (yol >= 490)
	{
		bolum = 2;
		BoxRun(3,116,120,340,40);
	}

	if (box_on) and (instance_exists(battle_soul))
	{
		var _kmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _kmul = battle_soul_orange_dr.world_mul; }
		// Kutular ve blasterlar barlarla ayni hizda kayiyor (bar spd_y'si 4),
		// boylece duvarlar kutulardan hic ayrilmiyor.
		var _kay = 4*_kmul;
		var _nb = array_length(boxes);
		for (var _i = 0; _i < _nb; _i++) { boxes[_i].y += _kay; }

		// Kalp bir kutunun icindeyse kati yan duvarlar arasinda tutuluyor
		for (var _i = 0; _i < _nb; _i++)
		{
			var _kb = boxes[_i];
			if (battle_soul.y > _kb.y-_kb.h/2) and (battle_soul.y < _kb.y+_kb.h/2)
			{
				var _kcx = battle_board.x+_kb.ox;
				battle_soul.x = clamp(battle_soul.x,_kcx-_kb.w/2+9,_kcx+_kb.w/2-9);
			}
		}

		// Ekranin altina inen kutular listeden dusuyor, hepsi bitince bolum
		// kendini kapatiyor. BoxStop cagirmiyoruz cunku o butun barlari yok
		// eder ve o sirada hala inen bir duvar varsa gozle gorulur sekilde
		// kaybolurdu.
		for (var _i = _nb-1; _i >= 0; _i--)
		{
			if (boxes[_i].y-boxes[_i].h/2 > 520) { array_delete(boxes,_i,1); }
		}
		if (array_length(boxes) == 0) { box_on = false; }
	}

	//----------------------------------------------------------------------
	// Blaster isaretcileri. Kutu bolumune bagli degiller: her bolum
	// BlastMark ile kendi blasterini koyabiliyor.
	//----------------------------------------------------------------------
	if (array_length(blasts) > 0)
	{
		var _bmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _bmul = battle_soul_orange_dr.world_mul; }
		for (var _i = array_length(blasts)-1; _i >= 0; _i--)
		{
			blasts[_i].y += 4*_bmul;
			if (!blasts[_i].dogdu)
			{
				if (blasts[_i].y >= blast_warn)
				{
					blasts[_i].dogdu = true;
					DrBlaster(blasts[_i].side,blasts[_i].y);
				}
			}
			else if (blasts[_i].y > 620)
			{
				array_delete(blasts,_i,1);
			}
		}
	}

	//======================================================================
	// BOLUM 3, 4, 5 -- kosu birimleri
	//======================================================================
	// Atagin ikinci yarisi ayni cumlenin bes tekrari, ama uzunluklari farkli:
	//
	//   U1  2 gercek halka + tuzak      780 px
	//   U2  3 gercek halka + tuzak     1040 px
	//   U3  1 gercek halka + tuzak      520 px
	//   U4  3 gercek halka + tuzak     1040 px
	//   U5  2 gercek halka + tuzak      780 px
	//
	// Her birim: halka - bar - (halka - bar) ... - TUZAK - BILEKLIK, hepsi
	// 130 px arayla. Gercek halkalarin arkasinda beyaz bar var, yani binmek
	// zorunlu. Tuzak son gercek halkayla ayni seritte ve ondan 260 px sonra:
	// zincirin dogal devami. Hicbir sey yapilmazsa zincir ona biniyor ve
	// bileklige girilir. Dogru oynanis seritten cikip yere inmek.
	//
	// Uzunluklar bilerek esit degil. Hep iki halkada bir tuzak gelseydi
	// oyuncu sayarak oynardi; boyle her seferinde bilekligin kendisine
	// bakmak zorunda.
	//
	// Seritler: her birimin ilk halkasi bir oncekinin tuzagindan 100-120 px
	// uzakta. Zincirden kopmaya yetecek kadar cok (halka yakalama toleransi
	// 32 px), yayin icinde alinamayacak kadar az degil (260 px'lik yayda
	// ~140 px gidilebiliyor). Yani tuzaktan kacmakla bir sonraki halkaya
	// hazirlanmak ayni hareket oluyor.
	//
	// Bileklikler: 3200, 4240, 4760, 5800, 6580 -- aralari 1040/520/1040/780.
	//======================================================================
	if (bolum == 2) and (yol >= 1400)
	{
		bolum = 3;
		audio_play_sound(snd_exclamation,0,false);
		BlastMark(930,-1);
		JumpUnit(1150,[0,-70]);				// 2550, tuzak 3070
		JumpUnit(1930,[45,-50,60]);			// 3330, tuzak 4110
	}

	if (bolum == 3) and (yol >= 3400)
	{
		bolum = 4;
		JumpUnit(970,[-45]);				// 4370, tuzak 4630
		JumpUnit(1490,[55,-35,65]);			// 4890, tuzak 5670
	}

	if (bolum == 4) and (yol >= 4900)
	{
		bolum = 5;
		JumpUnit(1030,[-55,50]);			// 5930, tuzak 6450
	}

	//----------------------------------------------------------------------
	// Bileklikler
	//----------------------------------------------------------------------
	// Kalbin USTUNDEN gecen kapali halkalar: yerdeyken zararsizlar, ama
	// ziplayan kalp iceri girip carpiyor. Beyaz barlarin tam tersi.
	//----------------------------------------------------------------------
	if (car_on)
	{
		var _cmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _cmul = battle_soul_orange_dr.world_mul; }
		// Donus gorsel: dunya hizlanmasi buraya yumusatilarak yansiyor.
		car_ang += car_spin*(1+(_cmul-1)*0.4);
		var _cn = array_length(cars);
		for (var _i = 0; _i < _cn; _i++) { cars[_i].y += 4*_cmul; }

		// Ekranin altina inen bileklikler listeden dusuyor. Once bolum
		// gecisinde CarStop cagriliyordu ama son bileklik o esikten sonra
		// geliyordu: kalbin altindan gecerken bir anda yok oluyordu.
		for (var _i = _cn-1; _i >= 0; _i--)
		{
			if (cars[_i].y > 560) { array_delete(cars,_i,1); }
		}
		_cn = array_length(cars);
		if (_cn == 0) { car_on = false; }

		// Sadece havadaki kalp bileklige carpiyor
		var _havada = false;
		if (instance_exists(battle_soul_orange_dr)) { _havada = battle_soul_orange_dr.airborne; }

		if (_havada) and (instance_exists(battle_soul))
		{
			var _sw = battle_soul.sprite_width/2;
			var _sh = battle_soul.sprite_height/2;
			for (var _c = 0; _c < _cn; _c++)
			{
				if (abs(cars[_c].y-battle_soul.y) > 80) { continue; }
				for (var _i = 0; _i < car_n; _i++)
				{
					var _sg = CarSeg(_i,cars[_c].y);
					// Arka yari kutunun arkasindan geciyor, tehdit degil
					if (_sg.on <= 0.15) { continue; }
					var _kal = 5*_sg.sc/2+2;
					if (battle_soul.x+_sw > min(_sg.x1,_sg.x2)) and (battle_soul.x-_sw < max(_sg.x1,_sg.x2))
					and (battle_soul.y+_sh > _sg.y-_kal) and (battle_soul.y-_sh < _sg.y+_kal)
					{
						if (global.kr)
						{
							if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
						}
						else
						{
							// FAZ 2 -- klasik hasar (bkz. scripts/Macro_Battle)
							Battle_HurtNormal(DMG_CAR);
						}
					}
				}
			}
		}
	}

	//----------------------------------------------------------------------
	// Turuncu bolum bitti: sari ruha geciliyor
	//----------------------------------------------------------------------
	if (bolum == 5) and (yol >= atak_yol)
	{
		bolum = 6;
		SariBasla();
	}

	//======================================================================
	// SARI RUH ATAGI
	//======================================================================
	// Ruh kutunun merkezine cakili, sadece 8 yone nisan aliyor. Bolum uc
	// hedef tipi uzerine kurulu ve ucu de ayri bir sey istiyor:
	//
	//   NORMAL  her mermiyle oluyor. Talebi nisan hizi: 8 yonden geliyorlar
	//           ve kucuk merminin 9 karelik bekleme suresi var.
	//   BIG     sadece guc vurusu deliyor. Talebi TAAHHUT: 32 kare sarj
	//           gerekiyor ve sarj sirasinda kucuk mermi atilamiyor, cunku
	//           kucuk mermi Z'ye BASILDIGI anda cikiyor. Yani buyugu
	//           kirmak, normallerin arasinda 32 karelik bir bosluk bulmak
	//           demek.
	//   MIRROR  mermiyi geldigi yone geri yansitiyor ve yansiyan mermi
	//           ruha hasar veriyor. Talebi SABIR: o hatta atis yapilamaz.
	//           Kutuya yaklasinca kendiliginden sonuyor (fade_start 105,
	//           fade_end 58), yani beklemek bir cozum. Kendisi hasar
	//           vermiyor, sadece bir yonu kapatiyor.
	//
	// Zorluk ucunun ust uste binmesinden geliyor: aynalar tam buyuk
	// hedeflerin ONUNE konuyor, yani once aynanin sonmesini bekleyip sonra
	// sarj etmek gerekiyor -- ve o sirada normaller akmaya devam ediyor.
	//
	// Yol sureleri (mesafe 360): NORMAL spd 2.4 -> 150 kare,
	// BIG spd 1.5 -> 240 kare, MIRROR spd 2.0 -> sonene kadar ~151 kare.
	// Asagidaki yorumlardaki sayilar VARIS karesi.
	//======================================================================
	if (sari_on)
	{
		sari_t += 1;

		//--- 1. dalga: ramp. Tek tek, 30 kare arayla, sekiz yonu tanitiyor.
		if (sari_t == 0)   { DrTarget(DR_TARGET.NORMAL,90,2.4); }		// varis 150
		if (sari_t == 30)  { DrTarget(DR_TARGET.NORMAL,180,2.4); }		// 180
		if (sari_t == 60)  { DrTarget(DR_TARGET.NORMAL,0,2.4); }		// 210
		if (sari_t == 90)  { DrTarget(DR_TARGET.NORMAL,270,2.4); }		// 240
		if (sari_t == 120) { DrTarget(DR_TARGET.NORMAL,135,2.4); }		// 270
		if (sari_t == 150) { DrTarget(DR_TARGET.NORMAL,315,2.4); }		// 300

		//--- 2. dalga: ciftler. Iki hedef 12 kare arayla zit yonlerden;
		//--- kucuk merminin beklemesi 9 kare, yani tam sigiyor. Arada ilk
		//--- buyuk hedef var: sarji normallerin arasina sokmak gerekiyor.
		if (sari_t == 190) { DrTarget(DR_TARGET.NORMAL,45,2.4); }		// 340
		if (sari_t == 190) { DrTarget(DR_TARGET.BIG,0,1.5); }			// 430
		if (sari_t == 202) { DrTarget(DR_TARGET.NORMAL,225,2.4); }		// 352
		if (sari_t == 235) { DrTarget(DR_TARGET.NORMAL,90,2.4); }		// 385
		if (sari_t == 247) { DrTarget(DR_TARGET.NORMAL,270,2.4); }		// 397
		if (sari_t == 295) { DrTarget(DR_TARGET.NORMAL,135,2.4); }		// 445
		if (sari_t == 307) { DrTarget(DR_TARGET.NORMAL,315,2.4); }		// 457
		if (sari_t == 340) { DrTarget(DR_TARGET.NORMAL,180,2.4); }		// 490

		//--- 3. dalga: ayna 90 hattini kapatiyor, arkasinda buyuk hedef.
		//--- Ayna once dogdugu ve daha hizli oldugu icin onde: 90'a atis
		//--- yapan mermiyi kendine geri yer. Ayna 530'da soner, buyuk
		//--- 645'te varir -- yani once beklemek, sonra sarj etmek gerekiyor.
		//--- Bu sirada normaller 22 kare arayla akmaya devam ediyor ve
		//--- hicbiri 90'dan gelmiyor, yoksa aynaya carparlardi.
		if (sari_t == 360) { DrTarget(DR_TARGET.NORMAL,0,2.4); }		// 510
		if (sari_t == 379) { DrTarget(DR_TARGET.MIRROR,90,2.0); }		// soner 530
		if (sari_t == 380) { DrTarget(DR_TARGET.NORMAL,225,2.4); }		// 530
		if (sari_t == 402) { DrTarget(DR_TARGET.NORMAL,45,2.4); }		// 552
		if (sari_t == 405) { DrTarget(DR_TARGET.BIG,90,1.5); }			// 645
		if (sari_t == 424) { DrTarget(DR_TARGET.NORMAL,180,2.4); }		// 574
		if (sari_t == 446) { DrTarget(DR_TARGET.NORMAL,315,2.4); }		// 596
		if (sari_t == 468) { DrTarget(DR_TARGET.NORMAL,270,2.4); }		// 618
		if (sari_t == 490) { DrTarget(DR_TARGET.NORMAL,135,2.4); }		// 640

		//--- Final: ucu birden, ciftler halinde. Ikinci ayna 225 hattini
		//--- kapatiyor, arkasindaki buyuk hedef 830'da variyor.
		if (sari_t == 512) { DrTarget(DR_TARGET.NORMAL,90,2.4); }		// 662
		if (sari_t == 524) { DrTarget(DR_TARGET.NORMAL,270,2.4); }		// 674
		if (sari_t == 550) { DrTarget(DR_TARGET.NORMAL,0,2.4); }		// 700
		if (sari_t == 562) { DrTarget(DR_TARGET.NORMAL,180,2.4); }		// 712
		if (sari_t == 574) { DrTarget(DR_TARGET.MIRROR,225,2.0); }		// soner 725
		if (sari_t == 590) { DrTarget(DR_TARGET.BIG,225,1.5); }			// 830
		if (sari_t == 590) { DrTarget(DR_TARGET.NORMAL,135,2.4); }		// 740
		if (sari_t == 602) { DrTarget(DR_TARGET.NORMAL,315,2.4); }		// 752
		if (sari_t == 625) { DrTarget(DR_TARGET.NORMAL,45,2.4); }		// 775
		if (sari_t == 637) { DrTarget(DR_TARGET.NORMAL,0,2.4); }		// 787
		if (sari_t == 658) { DrTarget(DR_TARGET.NORMAL,90,2.4); }		// 808
		if (sari_t == 670) { DrTarget(DR_TARGET.NORMAL,180,2.4); }		// 820

		//--- Bolum bitti: kirmizi ruha geciliyor ---
		if (sari_t == sari_son)
		{
			sari_on = false;
			KirmiziBasla();
		}
	}


	//======================================================================
	// KIRMIZI RUH BOLUMU
	//======================================================================
	// Kisa tutuldu: turuncu ve sari zaten uzun, ucu birden cok olurdu.
	// Iki eleman var.
	//
	//   BLASTER CEMBERI  Kutunun etrafinda bir cember; hepsi ayni anda
	//                    doguyor ama SIRAYLA atesliyorlar. Isinlar merkezden
	//                    gectigi icin her atesle guvenli bolge donuyor ve
	//                    ruhun onunla birlikte donmesi gerekiyor. Kutu KARE
	//                    oldugu icin her acidan 61 px guvenli serit kaliyor;
	//                    dikdortgen kutuda yatay isinlar icin bu 36 idi.
	//
	//   YILDIRIMLAR      AlphysBigBolt: ekranin uzerinde dogup asagi inen
	//                    buyuk bolt, kutuya girdigi anda PATLIYOR ve cevreye
	//                    kavis cizen boltlar saciyor. Dogumdan patlamaya 48
	//                    kare var, uyari o. Cemberin donusu ruhu bir yone
	//                    iterken patlama o bolgeyi kapatiyor.
	//
	// Sonda ikisi ust uste biniyor: cember B atesini surerken yildirimlar
	// da dusuyor.
	//======================================================================
	if (kir_on)
	{
		kir_t += 1;

		//--- Cember A: 8 blaster, 26 kare arayla atesliyorlar ---
		// Dogum 30, ilk ates 77, son ates 259.
		if (kir_t == 30) { BlasterCircle(8,190,0,26); }

		//--- Yildirim dalgasi: yukaridan dusup kutuda patlayan uc bolt ---
		if (kir_t == 250) { Yildirim(-55,6,2.4); }	// patlama 298
		if (kir_t == 285) { Yildirim(45,7,2.6); }	// 333
		if (kir_t == 320) { Yildirim(0,8,2.2); }	// 368

		//--- Cember B: 6 blaster, 24 kare arayla, aci kaydirilmis ---
		// Dogum 400, ilk ates 447, son ates 567.
		if (kir_t == 400) { BlasterCircle(6,190,30,24); }

		//--- Final: cember B atesini surerken yildirimlar da dusuyor ---
		if (kir_t == 440) { Yildirim(-40,6,2.4); }	// patlama 488
		if (kir_t == 480) { Yildirim(55,6,2.6); }	// 528
		if (kir_t == 520) { Yildirim(0,8,2.4); }	// 568

		//--- Bolum bitti: atak kapaniyor ---
		if (kir_t == kir_son)
		{
			kir_on = false;
			bitis_kare = _timer;
			with (battle_gasterblaster) { instance_destroy(); }
			with (battle_gasterblaster_beam) { instance_destroy(); }
			with (o_alphys_bolt) { instance_destroy(); }
			with (o_alphys_bigbolt) { instance_destroy(); }
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			// TAHTA GERI: kirmizi bolum icin merkez 295'e cekilmisti
			// (bkz. Create_0, KirmiziBasla). Bolum biterken 320'ye donuyor.
			Anim_Destroy(battle_board,"y");
			Anim_Create(battle_board,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.OUT,battle_board.y,BATTLE_BOARD.Y-battle_board.y,30);
			Battle_SetBoardSizeCubic(65,65,125,125,30);
			battle_soul.x = battle_board.x;
			battle_soul.y = BATTLE_BOARD.Y;
			with (battle_soul) { moveable = false; }
			Camera_Shake(3,3,2,2);
		}
	}


	//----------------------------------------------------------------------
	// Devir teslim diyalogu
	//----------------------------------------------------------------------
	if (bitis_kare > 0) and (_timer == bitis_kare+70) and (!dialog_started)
	{
		dialog_started = true;
		battle_enemy_engage.p2_head_sprite = spr_p2_head;
		var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
		_dlg.text = phase2_text;
	}

	//----------------------------------------------------------------------
	// Diyalog bitti: Sans ve Papyrus sahneden ayrilir, tur kapanir
	//----------------------------------------------------------------------
	if (dialog_started) and (!instance_exists(battle_dialog_enemy))
	{
		with (battle_enemy_engage)
		{
			p2_state = 3;		// Sans cikiyor
			pap_state = 3;		// Papyrus cikiyor
		}
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Alphys stares you down.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
