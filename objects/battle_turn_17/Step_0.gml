var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 10)
	{
		RegularBone(left_box,bottom_box,152,2,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,152,-2,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 50)
	{
		RegularBlaster(-50,320,left_box + 70,top_box - 100,0,270,18,20,3,3,50);
	}
	if (_timer == 70)
	{
		Battle_SetBoardSizeCubic(65,65,165,165);
	}
	if (_timer == 140)
	{
		Battle_SlamDown();
		RegularBlaster(-50,320,left_box + 165,top_box - 150,0,270,2700,20,5,5,50);
	}
	if (_timer == 250)
	{
		RegularBone(left_box + 155,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box + 155,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 155,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 155,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 270) and (_timer < 841)
	{
		if (_timer % 50 == 0)
		{
			RegularBone(left_box + 155,bottom_box,24,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 105,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(right_box - 155,bottom_box,24,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 105,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 840)
	{
		Battle_SetBoardSizeCubic(65,65,205,205);
	}
    if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 50 == 0)
		{
			RegularBone(left_box + 155,bottom_box,22,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 155,bottom_box,22,-3,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 100 == 0)
		{
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y - 40,270,270,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x - 40,battle_soul.y,0,0,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y + 40,90,90,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x + 40,battle_soul.y,180,180,10,1,1,1,50);
		}
	}
	if (_timer == 1450)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He can't meet your eyes.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	//======================================================================
	// ALPHYS'IN BUYUK TURU
	//======================================================================
	// Once SARI RUH bolumu, sonra KIRMIZI RUH bolumu (Unitale modundan
	// aktarilan mizrak dalgalari). Ikisi de kendi sayacini kullaniyor:
	// sari bittiginde KirmiziBasla() cagriliyor ve kir_t sifirdan basliyor.
	//======================================================================
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}

	if (_timer == 20) { SariBasla(); }

	//======================================================================
	// SARI RUH BOLUMU
	//======================================================================
	// Tur bu bolumle ACILIYOR: ruh sariya doner ve kutu kucuk bir kareye iner.
	// Bolum bitince KirmiziBasla() ile mizrak dalgalarina gecilir.
	// Turun -- ve simdiye kadar yapilan butun sari bolumlerin -- en zoru:
	// 51 hedef, varislar arasi ortalama 16 kare, ekranda ayni anda 14'e
	// kadar hedef. Karsilastirma icin tur 16'nin sarisi: 35 hedef, ortalama
	// 24 kare, en fazla 12.
	//
	// Atis butcesi TAM SINIRDA. Kucuk mermi 9 karede bir atilabiliyor, buyuk
	// hedef 32 karelik sarj istiyor; bu ikisinin toplam maliyeti bolumun
	// suresine birebir esit. Yani bosa atilan tek bir mermi bile bir hedefin
	// gecmesine yol aciyor, oyuncunun duracak vakti hic yok.
	//
	// Uc hedef turu de bastan sona ic ice:
	//   NORMAL  kucuk mermi, tek atis
	//   BIG     sarjli atis. Sarj sirasinda kucuk mermi atilamadigi icin
	//           akisin arasina sigacak bir bosluk bulmak gerekiyor.
	//   MIRROR  hasar vermiyor ama mermiyi geri yansitiyor, yani durdugu yonu
	//           tamamen kapatiyor. Kutuya yaklasinca soniyor; ancak o zaman
	//           arkasindaki BIG'e atis yapilabiliyor.
	//
	// Yorumlardaki "varis" hedefin ruha ulastigi kare, "soner" ise aynanin
	// yok oldugu kare. Dogus kareleri bunlardan geriye hesaplandi: hedefler
	// 360 px uzakta doguyor, NORMAL 2.8 px/kare, BIG 1.7, MIRROR 2.2 gidiyor
	// (ayna 58 px kala soniyor).
	if (sari_on)
	{
		sari_t += 1;

		//------------------------------------------------- 1. DALGA: ucluler
		// Isinma yok, ilk kareden itibaren uc hedef 10 kare arayla ve hepsi
		// farkli yonden geliyor. Kucuk mermi 9 karede bir atilabildigi icin
		// ucunu de vurmaya tam tamina yetiyor, fazlasi yok.
		if (sari_t == 21)     { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 150
		if (sari_t == 31)     { DrTarget(DR_TARGET.NORMAL,225,2.8); }   // varis 160
		if (sari_t == 41)     { DrTarget(DR_TARGET.NORMAL,315,2.8); }   // varis 170
		if (sari_t == 71)     { DrTarget(DR_TARGET.NORMAL,45,2.8); }    // varis 200
		if (sari_t == 81)     { DrTarget(DR_TARGET.NORMAL,180,2.8); }   // varis 210
		if (sari_t == 91)     { DrTarget(DR_TARGET.NORMAL,270,2.8); }   // varis 220
		if (sari_t == 121)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 250
		if (sari_t == 131)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }   // varis 260
		if (sari_t == 141)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }   // varis 270
		if (sari_t == 171)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 300
		if (sari_t == 181)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }   // varis 310

		//-------------------------------- 2. DALGA: iki BIG, akis kesilmeden
		// Iki buyuk hedef ust uste variyor (380 ve 420). Sarj sirasinda
		// normal akisi durmuyor: sarjlarin arasina normaller sikismis
		// durumda, oyuncunun sarji dogru anda birakmasi gerekiyor.
		if (sari_t == 168)    { DrTarget(DR_TARGET.BIG,0,1.7); }        // varis 380
		if (sari_t == 201)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 330
		if (sari_t == 208)    { DrTarget(DR_TARGET.BIG,180,1.7); }      // varis 420
		if (sari_t == 221)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }   // varis 350
		if (sari_t == 239)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }   // varis 368
		if (sari_t == 271)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }   // varis 400
		if (sari_t == 311)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }    // varis 440
		if (sari_t == 329)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }   // varis 458
		if (sari_t == 361)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 490
		if (sari_t == 379)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }   // varis 508

		//------------------------------ 3. DALGA: aynalarin arkasindaki BIG
		// 90 ve 270 yonlerini birer ayna kapatiyor ve ikisinin de arkasinda
		// bir BIG bekliyor. Ayna sonene kadar o yone atis yapmak mermiyi geri
		// yansitiyor; ayna sondukten sonra BIG'e sarj icin 100 kare kaliyor.
		// Bu sirada diger alti yonden normal akisi hic durmuyor.
		if (sari_t == 401)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 530
		if (sari_t == 419)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }    // varis 548
		if (sari_t == 437)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }   // varis 566
		if (sari_t == 461)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }   // varis 590
		if (sari_t == 463)    { DrTarget(DR_TARGET.MIRROR,90,2.2); }    // soner 600
		if (sari_t == 479)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }   // varis 608
		if (sari_t == 488)    { DrTarget(DR_TARGET.BIG,90,1.7); }       // varis 700
		if (sari_t == 497)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }   // varis 626
		if (sari_t == 503)    { DrTarget(DR_TARGET.MIRROR,270,2.2); }   // soner 640
		if (sari_t == 523)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 652
		if (sari_t == 528)    { DrTarget(DR_TARGET.BIG,270,1.7); }      // varis 740
		if (sari_t == 541)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }    // varis 670
		if (sari_t == 559)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }   // varis 688

		//---------------------------------------- FINAL: uc ayna, iki BIG
		// Bolumun en yogun kismi. Uc ayna (135, 45, 225) sirayla ucer yonu
		// kapatiyor, bunlardan 45 ve 225'in arkasinda birer BIG var. Normal
		// akisi 16 kare araliga iniyor ve sona kadar kesilmiyor.
		if (sari_t == 601)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 730
		if (sari_t == 617)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 746
		if (sari_t == 633)    { DrTarget(DR_TARGET.MIRROR,135,2.2); }   // soner 770
		if (sari_t == 633)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }   // varis 762
		if (sari_t == 649)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }   // varis 778
		if (sari_t == 665)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }   // varis 794
		if (sari_t == 681)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 810
		if (sari_t == 683)    { DrTarget(DR_TARGET.MIRROR,45,2.2); }    // soner 820
		if (sari_t == 688)    { DrTarget(DR_TARGET.BIG,45,1.7); }       // varis 900
		if (sari_t == 701)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 830
		if (sari_t == 713)    { DrTarget(DR_TARGET.MIRROR,225,2.2); }   // soner 850
		if (sari_t == 717)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }   // varis 846
		if (sari_t == 718)    { DrTarget(DR_TARGET.BIG,225,1.7); }      // varis 930
		if (sari_t == 733)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }   // varis 862
		if (sari_t == 749)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }   // varis 878
		if (sari_t == 765)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }     // varis 894
		if (sari_t == 781)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }    // varis 910

		//---------------------------------------------------------- kapanis
		if (sari_t == sari_son)
		{
			sari_on = false;
			with (battle_dr_target) { instance_destroy(); }
			KirmiziBasla();
		}
	}

	//======================================================================
	// KIRMIZI RUH BOLUMU -- MIZRAK DALGALARI
	//======================================================================
	// Bes bolum. Mizrak dalgalarinin alfisi da Unitale modu "Alphys Alpha"nin
	// Lua/Waves klasorunden aktarildi. Mermi davranisi o_alphys_spear'da,
	// sayilar Alphys_Spear scriptinde; oradaki yorumlarda her degerin moddaki
	// hali yaziyor.
	//
	//   spear4  Alttan yukari sancan mizraklar, uc serit. Dar arena.
	//   spear5  Iki yandan ayni anda sancan mizraklar + alt duvardan shocker
	//           breaker'lar. Genis arena.
	//   spear3  Arenanin disinda belirip nisan alan ve HIZLANARAK gelen
	//           mizraklar + yukaridan dusup patlayan buyuk boltlar. Kare arena.
	//   spear1  Kalbin cevresinde 175 px'te belirip donen, sonra duz iceri
	//           gelen yedili halka. Salvo araligi kisaliyor. Buyuk arena.
	//   spear2  Ayni halkanin donerek ice kapanan hali. Kalbe hiz takviyesi
	//           bu dalgada. Buyuk arena.
	//
	//   Son iki bolumde, yani kutu BUYUKKEN, arkalarinda ayrica Alphys'in
	//   cekici sirayla dort koseden vuruyor. Cekic ayri bir bolum degil,
	//   mizraklarla ayni anda calisiyor. Vurus arasi 250 kare, her vurus tek
	//   dalga bolt savuruyor -- arka planda kalmasi, one gecmemesi icin.
	//
	// Modda her dalga 10-12 saniye (encounter'daki wavetimer), o yuzden
	// hepsi ~600 kare calisiyor. Unitale de 60 FPS'te dondugu icin salvo
	// araliklari moddaki haliyle duruyor, DONUSUM YOK: 26, 45, 20, 70.
	//
	// spear0 cikinca son iki dalga 600 kare one alindi; tur 4090 yerine 3430
	// karede bitiyor.
	//
	// spear1'in salvo araligi SABIT DEGIL, her salvoda kisaliyor; o yuzden %
	// ile degil, bir sonraki salvo karesini tutan sayacla suruluyor.
	//
	// MODDAN SAPMALAR:
	//   1) spear0 (750 px disaridan dalan mizrak ciftleri) hic kullanilmadi.
	//      Modda da kullanilmiyor; dengeli bir pattern degil. Fonksiyonu
	//      Alphys_Spear'da duruyor, sadece cagrilmiyor. Yerine 4. bolumde
	//      Alphys'in kose cekicleri var.
	//   2) Mizrak dalgalarina projenin kendi Alphys ataklari karistirildi:
	//      spear5'e shocker breaker, spear3'e yukaridan dusen buyuk bolt.
	//      Modda bunlar yok, ama iki dalga da tek boyutluydu ve bedava
	//      siginaklari vardi.
	//
	//======================================================================
	if (kir_on)
	{
		kir_t += 1;

		if (kir_t == 20)
		{
			instance_create_depth(0,0,0,battle_soul_red_effect);
			SpearArena(4);					// Arena.resize(75,100)
			Battle_SetSoul(battle_soul_red);
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
			with (battle_soul) { moveable = true; }
			Camera_Shake(3,3,2,2);
		}

		//---------------------------------------------------- 1. DALGA: spear4
		if (kir_t >= 80) and (kir_t <= 680)
		{
			if ((kir_t-80) % 26 == 0) { Spear4(); }		// mod 26
		}

		//---------------------------------------------------- 2. DALGA: spear5
		if (kir_t == 700) { SpearArena(5); }			// Arena.resize(300,75)

		if (kir_t >= 760) and (kir_t <= 1360)
		{
			if ((kir_t-760) % 45 == 0) { Spear5(); }	// mod 45
		}

		// Mizraklar iki yandan geliyor, yani dip serit bedava bir siginakti.
		// Shocker breaker'lar alt duvardan vurup orayi da kapatiyor.
		if (kir_t == 800) { AlphysShocker(battle_board.x-120,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 849) { AlphysShocker(battle_board.x+ 70,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 898) { AlphysShocker(battle_board.x- 40,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 947) { AlphysShocker(battle_board.x+130,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 996) { AlphysShocker(battle_board.x- 85,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1045) { AlphysShocker(battle_board.x+ 20,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1094) { AlphysShocker(battle_board.x+105,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1143) { AlphysShocker(battle_board.x-135,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1192) { AlphysShocker(battle_board.x+ 45,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1241) { AlphysShocker(battle_board.x- 20,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 1290) { AlphysShocker(battle_board.x+ 90,battle_board.y+battle_board.down-4,40); }

		//---------------------------------------------------- 3. DALGA: spear3
		if (kir_t == 1380) { SpearArena(3); }			// Arena.resize(150,150)

		if (kir_t >= 1440) and (kir_t <= 2040)
		{
			if ((kir_t-1440) % 20 == 0) { Spear3(); }	// mod 20
		}

		// Homing mizraklar hep kalbin bulundugu yere geliyor, yani surekli
		// hareket gerekiyor. Yukaridan dusup kutunun dibinde patlayan buyuk
		// boltlar kacis yonlerini de daraltiyor.
		if (kir_t == 1480) { AlphysBigBolt(battle_board.x-44,-60,270,6,5,2.4); }
		if (kir_t == 1600) { AlphysBigBolt(battle_board.x+38,-60,270,6,5,2.4); }
		if (kir_t == 1720) { AlphysBigBolt(battle_board.x-12,-60,270,6,7,2.4); }
		if (kir_t == 1840) { AlphysBigBolt(battle_board.x+46,-60,270,6,5,2.4); }
		if (kir_t == 1960) { AlphysBigBolt(battle_board.x-30,-60,270,6,7,2.4); }

		//----------------------------------- 4. DALGA: spear1 + kose cekicleri
		// Buradan sonuna kadar buyuk arena. spear0'in yerini alan cekicler AYRI
		// bir bolum degil: kutu buyukken iki mizrak dalgasinin da arkasinda,
		// sirayla dort koseden vuruyorlar. Her vurus tek dalga bolt savuruyor.
		if (kir_t == 2060)
		{
			SpearArena(2);					// Arena.resize(565,330)
			s1_next = 2120;
			s1_n = 0;
			s1_ang = 0;
		}

		if (kir_t >= 2120) and (kir_t <= 2720)
		{
			if (kir_t >= s1_next)
			{
				Spear1(s1_ang);
				s1_ang += 32;					// mod: add_angle + 32
				s1_next = kir_t+Spear1Gap(s1_n);
				s1_n += 1;
			}
		}

		//----------------------------------- 5. DALGA: spear2 + kose cekicleri
		// Mod bu dalgada kalbi kendi kontrol override'iyle daha hizli hareket
		// ettiriyor; spiral aksi halde kacilamiyor.
		if (kir_t == 2740) { Spear2Speed(true); }

		if (kir_t >= 2740) and (kir_t <= 3340)
		{
			if ((kir_t-2740) % 70 == 0) { Spear2(); }	// mod 70
		}

		//------------------------------------ cekicler: iki dalga boyunca da
		// along isareti UST duvarda TERS calisiyor (bkz. battle_turn_9).
		// Girinti 190: cekicin pivotu carpma noktasinin 144 px yaninda
		// olusuyor, 50 px girintide pivot ekran disina tasiyor ve savurmanin
		// tamami gorunmuyordu -- cekic sadece vurdugu an fark ediliyordu.
		if (kir_t == 2140) { AlphysHammer(1,battle_board.x-battle_board.left+190,battle_board.y-battle_board.up,-1,1,1); }	// ust sol
		if (kir_t == 2390) { AlphysHammer(1,battle_board.x+battle_board.right-190,battle_board.y-battle_board.up,1,1,1); }	// ust sag
		if (kir_t == 2640) { AlphysHammer(0,battle_board.x+battle_board.right-190,battle_board.y+battle_board.down,-1,1,1); }	// alt sag
		if (kir_t == 2890) { AlphysHammer(0,battle_board.x-battle_board.left+190,battle_board.y+battle_board.down,1,1,1); }	// alt sol
		if (kir_t == 3140) { AlphysHammer(1,battle_board.x-battle_board.left+190,battle_board.y-battle_board.up,-1,1,1); }	// ust sol

		//---------------------------------------------------------- kapanis
		if (kir_t == 3430)
		{
			kir_on = false;
			// Hiz takviyesi mutlaka geri alinmali, yoksa sonraki turlara sizar
			Spear2Speed(false);
			with (o_alphys_spear) { instance_destroy(); }
			with (o_alphys_hammer) { instance_destroy(); }
			with (o_alphys_shocker) { instance_destroy(); }
			with (o_alphys_bigbolt) { instance_destroy(); }
			with (o_alphys_bolt) { instance_destroy(); }
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			// Menunun varsayilan kutusu BATTLE_BOARD sabitlerinde (Macro_Battle):
			// UP/DOWN 65, LEFT/RIGHT 283. Daha dar bir olcu verilince tur bitince
			// kutu varsayilana donmuyor, menu diger atak sonlarindan farkli kaliyor.
			Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Alphys cracks her knuckles.")
			if (instance_exists(o_sans_blockp2))
			{
				o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
			}
			Battle_EndTurn();
		}
	}
}
