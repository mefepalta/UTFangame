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
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBlaster(270,-50,270,top_box-100,270,270,100,1,2,2,50);
		RegularBlaster(370,-50,370,top_box-100,270,270,100,1,2,2,50);
	}
	if (_timer == 120)
	{
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 190)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 220)
	{
		Battle_SlamDown();
	}
	if (_timer == 230)
	{
		RegularBone(right_box,top_box,84,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,79,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,top_box,74,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,top_box,69,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,top_box,64,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,top_box,59,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,top_box,54,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,top_box,49,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,top_box,44,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,top_box,39,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,top_box,34,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,top_box,29,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,29,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,bottom_box,34,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,bottom_box,39,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,bottom_box,44,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,bottom_box,49,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,bottom_box,54,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,bottom_box,59,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,bottom_box,69,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,bottom_box,74,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,79,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 290)
	{
		RegularBone(left_box,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-20,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-30,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-40,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-50,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-60,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 320) and (_timer < 720) and (_timer % 40 == 0)
	{
		RegularBone(left_box,bottom_box,20,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,102,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,20,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,102,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-110,bottom_box,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,152,-5,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer = 760)
	{
		RegularBoneWall(DIR.LEFT,135,13,110,left_box,top_box,50,50,0,false);
		RegularBoneWall(DIR.RIGHT,135,13,110,right_box,top_box,50,50,0,false);
	}
	if (_timer = 770)
	{
		RegularBlaster(320,-50,right_box + 60,bottom_box - 20,180,180,20,1,2,2,50);
	}
	if (_timer == 820)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer > 840) and (_timer < 1200) and (_timer % 40 == 0)
	{
		RegularBone(left_box - 110,bottom_box,82,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,82,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 110,bottom_box,82,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1240)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* The weight of it all shows&  on his face.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	//======================================================================
	// PAPYRUS'UN TURUNCU RUH KORIDORU
	//======================================================================
	// Tur 16'daki koridorun daha uzun ve cok daha yogun hali:
	//   tur 16 -> ~45 oge / 6860 px
	//   tur 18 -> 89 oge / 11540 px
	// Yardimci fonksiyonlarin hepsi Create_0'da, tur 16'dakiyle ayni.
	//
	// Bolumlerin sirasi (parantez icindekiler ogenin kalbe VARDIGI yol):
	//   A  zincir barlari      440 - 1040
	//   B  kutular            1295 - 2285
	//   C  ziplama zinciri    2390 - 4080
	//   D  zincir barlari     4190 - 4790
	//   E  ziplama zinciri    4900 - 6590
	//   F  kutular            6700 - 8040
	//   G  zincir barlari     8150 - 8700
	//   H  ziplama zinciri    8810 - 9720
	//   I  zincir barlari     9840 - 10500
	//   J  kutular           10610 - 11540
	//
	// KONUK KORIDORUN ICINDE DEGIL, SONUNDA. Mini-boss oldugu icin baska
	// patternlerle ayni anda calisinca hasar almamak imkansiz oluyordu:
	// guc dash 40 kare basili tutmak istiyor, o sure boyunca oyuncu zaten
	// kemik kirmakla / serit degistirmekle mesgul. Koridor bitince tek
	// basina geliyor (asagida FINAL basligi).
	//
	// Bolum tetikleri kare degil YOL: dunya dash ile 2.4 katina kadar
	// hizlaniyor, sabit kareler iyi oynayan oyuncuya bosluk acardi.
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
	// Dunyanin kat ettigi yol. Butun bolum esikleri buradan okunuyor.
	//----------------------------------------------------------------------
	if (instance_exists(battle_dr_corridor))
	{
		yol += battle_dr_corridor.scroll_spd;
	}

	//======================================================================
	// KIRMIZI / MAVI RUH ATAGI
	//======================================================================
	// Sira (kullanicinin tarifi):
	//   A  soldan 5 ivmeli kemik, ortanin SAGINDA yon degistiriyorlar
	//   B  sagdan 5 ivmeli kemik, ortanin SOLUNDA yon degistiriyorlar
	//   C  iki taraftan ayni anda; kutunun TAM ORTASI guvenli nokta
	//   D  sagdan ve soldan ikiser mavi kemik, SONRA ruh maviye doner
	//   E  sagdan turuncu ivmeli kemikler; sol duvarda donmuyor, yavaslayip
	//      soldan cikiyorlar
	//   F  sagdan uc bosluklu kemik: bosluk sirasiyla ALT, ORTA, UST
	//   G  soldan turuncu kemikler, hemen ardindan slam down + kemik duvari
	//      ve uzerinde sticky platform
	//   H  iki yandan, platformun hemen ustunden, alt duvara paralel 4 hancer
	//   I  kirmizi ruh; yukarida 30 hancer belirip ruha nisan alarak atesleniyor
	//
	// KEMIKLER AYRI AYRI DOGUYOR. Sabit ofsetli grup degil: her kemik kendi
	// karesinde dogdugu icin yelpaze acilimi kendiliginden olusuyor.
	//
	// YON DEGISTIRME NOKTALARI HESAPLANDI, tahmin degil. Motorun _dynamic
	// modu (battle_regularbone/Step_0) hizi her kare -1'e dogru 0.03 ile
	// lerp'liyor; kemik 22. karede duruyor ve geri donuyor. O egri simule
	// edilip her hedefe denk gelen _base_hspeed secildi:
	//   soldan -> x 365'te donus (ortanin sagi)      : +22
	//   sagdan -> x 275'te donus (ortanin solu)      : -22
	//   iki taraf, merkez guvenli: sol +13 (x 280), sag -13 (x 360)
	//   turuncu: -36, omur 20 -> sol duvara hala hareketliyken variyor,
	//            donmeden siliniyor ("yavaslama gibi")
	//
	// Kemiklerin hepsi Papyrus sprite'i (RegularBone'un 10. argumani = 1).
	//======================================================================
	if (kir_on)
	{
		kir_t += 1;

		//------------------------------------------------------- kurulum
		if (kir_t == 60)
		{
			instance_create_depth(0,0,0,battle_soul_red_effect);
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,160,160,20);
			Battle_SetSoul(battle_soul_red);
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}

		//---------------------------------------- A: soldan, sagda donuyor
		if (kir_t >= 90) and (kir_t <= 122)
		{
			if ((kir_t-90) % 8 == 0) { YelpazeKemik(1,10.6,0); }
		}

		//---------------------------------------- B: sagdan, solda donuyor
		if (kir_t >= 200) and (kir_t <= 232)
		{
			if ((kir_t-200) % 8 == 0) { YelpazeKemik(-1,10.6,0); }
		}

		//------------------------ C: iki taraftan, merkez guvenli kaliyor
		if (kir_t >= 310) and (kir_t <= 342)
		{
			if ((kir_t-310) % 8 == 0)
			{
				YelpazeKemik(1,6.3,0);
				YelpazeKemik(-1,6.3,0);
			}
		}

		//------------------ D: ikiser mavi kemik, SONRA ruh maviye doner
		if (kir_t == 430) { MaviKemik(-1); }		// sagdan iki
		if (kir_t == 446) { MaviKemik(1); }			// soldan iki
		if (kir_t == 480)
		{
			instance_create_depth(0,0,0,battle_soul_blue_effect);
			Battle_SetSoul(battle_soul_blue);
		}

		//----------------- E: sagdan turuncu, yavaslayip soldan cikiyorlar
		if (kir_t >= 520) and (kir_t <= 556)
		{
			if ((kir_t-520) % 12 == 0) { TuruncuKemik(-1); }
		}

		//------------------- F: uc bosluklu kemik -- alt, orta, ust bosluk
		// Aralar tek ziplamada gecilecek kadar: -4 px/kare ve 45 kare ara,
		// yani aralarinda 180 px var.
		if (kir_t == 600) { BosluklKemik(0); }		// bosluk ALTTA
		if (kir_t == 645) { BosluklKemik(1); }		// bosluk ORTADA
		if (kir_t == 690) { BosluklKemik(2); }		// bosluk USTTE

		//--------------- G: soldan turuncu, ardindan duvar ve platform
		if (kir_t >= 750) and (kir_t <= 774)
		{
			if ((kir_t-750) % 12 == 0) { TuruncuKemik(1); }
		}

		if (kir_t == 810)
		{
			// GIF olcumu: kutu bu noktada 65,65,160,160'tan 65,65,75,75
			// kareye iniyor (kare 530-570 arasi gecis).
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,75,75,30);
			Battle_SlamDown();
			audio_play_sound(snd_impact,2,false);
			DipDuvar();
			SticikPlatform();
		}

		//---------------------------- PLATFORMU KUTU ICINDE TUT
		// battle_platform1'in bounce_x'i sadece 'block' objelerinden sekiyor
		// (Step_2), bu atakta block yok: platform saga kayip gidiyordu ve
		// oyuncu altindaki kemik duvarina dusuyordu. Kenarlarda yon
		// cevirmek Step_0'da yapiliyor -- platformun kendi hareketi End
		// Step'te oldugu icin ayni karede yeni yonde ilerliyor.
		// x platformun MERKEZI (Draw_0: sprite width/2 olcekle merkeze
		// ciziliyor, uclar x +- width/2).
		if (kir_t > 810) and (instance_exists(battle_platform1))
		{
			with (battle_platform1)
			{
				var _pl = battle_board.x-battle_board.left+width*0.5+4;
				var _pr = battle_board.x+battle_board.right-width*0.5-4;
				if (x <= _pl) and (move_x < 0) { move_x = abs(move_x); }
				if (x >= _pr) and (move_x > 0) { move_x = -abs(move_x); }
				x = clamp(x,_pl,_pr);
			}
		}

		//-------- H: iki yandan, platformun ustunden, alt duvara paralel
		if (kir_t == 880) { HancerYatay(-1); }
		if (kir_t == 900) { HancerYatay(1); }
		if (kir_t == 920) { HancerYatay(-1); }
		if (kir_t == 940) { HancerYatay(1); }

		//------------------ I: kirmizi ruh, 30 hancer ruha nisan aliyor
		if (kir_t == 1000)
		{
			with (battle_platform1) { instance_destroy(); }
			with (battle_regularbonewall) { instance_destroy(); }
			with (battle_regularbone) { instance_destroy(); }
			instance_create_depth(0,0,0,battle_soul_red_effect);
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,160,160,25);
			Battle_SetSoul(battle_soul_red);
		}

		// 30 hancer yukarida beliriyor. Her biri dogus aninda ruhun o anki
		// konumuna kilitleniyor; telegraf boyunca kacmak mumkun.
		if (kir_t >= 1040) and (kir_t <= 1156)
		{
			if ((kir_t-1040) % 4 == 0) { HancerNisan(); }
		}

		//---------------------------------------------------------- kapanis
		//---------------------------------------------------------- kapanis
		if (kir_t == 1260)
		{
			kir_on = false;
			with (battle_platform1) { instance_destroy(); }
			with (battle_regularbone) { instance_destroy(); }
			with (battle_regularbonewall) { instance_destroy(); }
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			// Menunun varsayilan kutusu BATTLE_BOARD sabitlerinde (Macro_Battle)
			Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Papyrus is enjoying himself.")
			if (instance_exists(o_sans_blockp2))
			{
				o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
			}
			Battle_EndTurn();
		}
	}


	//======================================================================
	// BOLUM TETIKLERI
	//======================================================================
	// Her satir bir ogeyi DOGURUYOR; oge yukaridan kayarak yorumdaki yola
	// variyor. Tetikler bilerek ust uste biniyor: bir bolum hala inerken
	// sonrakinin dogmasi gerekiyor, yoksa aralarinda bosluk kaliyor.
	// Ziplama halkalari ~900 px yukarida dogmak zorunda, yoksa ekranin
	// ortasinda birden beliriyorlar.
	//======================================================================
	if (bolum == 0) and (_timer >= 60)
	{
		// Koridor 20. karede acildigi icin buraya gelene kadar yol birikmis
		// oluyor; sifirlanmasaydi butun esikler o kadar kayardi.
		bolum = 1;
		yol = 0;
		ChainRun(6,120,60);					// A: 440-1040
	}

	if (bolum == 1) and (yol >= 700)
	{
		bolum = 2;
		BoxRun(3,110,120,320,45);			// B: 1295-2285
	}

	if (bolum == 2) and (yol >= 1490)
	{
		bolum = 3;
		JumpUnit(900,[0,-70]);				// C: 2390-3040
		JumpUnit(1680,[50,-45,60]);			//    3170-4080
	}

	if (bolum == 3) and (yol >= 3750)
	{
		bolum = 4;
		ChainRun(6,120,60);					// D: 4190-4790
		BlastMark(700,-1);
	}

	if (bolum == 4) and (yol >= 4000)
	{
		bolum = 5;
		JumpUnit(900,[-50]);				// E: 4900-5290
		JumpUnit(1420,[55,-40,65,-30]);		//    5420-6590
	}

	if (bolum == 5) and (yol >= 6105)
	{
		bolum = 6;
		BoxRun(4,104,110,300,40);			// F: 6700-8040
	}

	if (bolum == 6) and (yol >= 7710)
	{
		bolum = 7;
		ChainRun(6,110,60);					// G: 8150-8700
	}

	if (bolum == 7) and (yol >= 7760)
	{
		bolum = 8;
		JumpUnit(1050,[-55,50,-45]);		// H: 8810-9720
	}

	if (bolum == 8) and (yol >= 9400)
	{
		bolum = 9;
		ChainRun(7,110,60);					// I: 9840-10500
	}

	if (bolum == 9) and (yol >= 10015)
	{
		bolum = 10;
		BoxRun(3,104,110,300,40);			// J: 10610-11540
		BlastMark(1100,1);
	}

	//======================================================================
	// FINAL -- BEKLENMEDIK KONUK, TEK BASINA
	//======================================================================
	// Konuk bir mini-boss: baska patternlerle ayni anda calisirsa hasar
	// almamak imkansiz oluyor. Ozellikle guc dash 40 kare basili tutmak
	// istiyor ve o sure boyunca oyuncu zaten kemik kirmak, serit degistirmek
	// veya halkaya binmek zorunda kaliyordu -- ikisi ayni ele sigmiyor.
	//
	// Bu yuzden koridor tamamen bittikten SONRA, tek basina geliyor. Dunya
	// akmaya devam ediyor (kalp kosuyor) ama artik hicbir sey dogmuyor:
	// oyuncunun tek isi sarj edip dogru anda birakmak.
	//
	// Bolum iki sekilde bitiyor:
	//   - Konuk 8 kez savrulunca kendi kendine cekiliyor (gst_max)
	//   - ya da guvenlik siniri: 3600 px. Konuk'un atilisini savurmak yerine
	//     yana kacarak da atlatmak mumkun (kilitlenen hedef sabit), yani
	//     hic puskurtmeyen bir oyuncuda bolum sonsuza kadar surerdi.
	//======================================================================
	if (bolum == 10) and (yol >= atak_yol)
	{
		bolum = 11;
		GuestStart(8);
		konuk_son = yol+3600;
	}

	if (bolum == 11) and ((!gst_on) or (yol >= konuk_son))
	{
		bolum = 12;
		GuestStop();
		bitis_kare = _timer;
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
						else if (global._inv < 1)
						{
							Battle_CallSoulEventHurt();
						}
					}
				}
			}
		}
	}

	//======================================================================
	// BEKLENMEDIK KONUK
	//======================================================================
	// Ayrintili aciklama Create_0'da. Ozet: sadece GUC DASH puskurtuyor ve
	// savrulmadan savrulmaya gecen sure 56 kare, guc dash'in istedigi 40
	// karelik sarj tam oturuyor.
	//======================================================================
	if (gst_on) and (instance_exists(battle_soul))
	{
		gst_t += 1;
		gst_bob += 1;
		if (gst_flash > 0) { gst_flash -= 1; }

		var _gl = battle_board.x-battle_board.left+56;
		var _gr = battle_board.x+battle_board.right-56;

		if (gst_state == 0)
		{
			// Uzakta bekliyor, yavasca saga sola surukleniyor
			gst_y += (gst_home_y-gst_y)*0.08;
			gst_x += gst_vx;
			if (gst_x < _gl) { gst_x = _gl; gst_vx = abs(gst_vx); }
			if (gst_x > _gr) { gst_x = _gr; gst_vx = -abs(gst_vx); }

			if (gst_cycle >= gst_max)
			{
				if (gst_t > 40) { GuestStop(); }
			}
			else if (gst_t > gst_bekle)
			{
				gst_state = 1;
				gst_t = 0;
				audio_play_sound(snd_exclamation,0,false);
			}
		}
		else if (gst_state == 1)
		{
			// Hazirlik: titriyor ve son ana kadar kalbi takip ediyor. Guc
			// dash'i sarj edip birakmak icin acilan pencere burasi.
			gst_tx = battle_soul.x;
			gst_ty = battle_soul.y;
			if (gst_t > gst_hazir)
			{
				gst_state = 2;
				gst_t = 0;
				audio_play_sound(snd_swift,0,false);
				Camera_Shake(3,3,2,2);
			}
		}
		else if (gst_state == 2)
		{
			// Atilis. Dunya da hizlaniyor: dash atmisiz gibi.
			if (instance_exists(battle_soul_orange_dr))
			{
				battle_soul_orange_dr.speed_boost = 1;
			}
			var _gd = point_direction(gst_x,gst_y,gst_tx,gst_ty);
			gst_x += lengthdir_x(gst_spd,_gd);
			gst_y += lengthdir_y(gst_spd,_gd);
			if (gst_y > 520) or (gst_t > 90)
			{
				// Isabet etmeden gecti, geri donuyor
				gst_state = 3;
				gst_t = 0;
				gst_rvx = 0;
				gst_rvy = 0;
			}
		}
		else
		{
			// Savrulma sonrasi yerine donus
			gst_x += gst_rvx;
			gst_y += gst_rvy;
			gst_rvx *= 0.92;
			gst_rvy *= 0.92;
			gst_x += (battle_board.x-gst_x)*0.04;
			gst_y += (gst_home_y-gst_y)*0.06;
			if (gst_t > gst_geri)
			{
				gst_state = 0;
				gst_t = 0;
			}
		}

		// Puskurtme. Menzil kontrolu Konuk'un buyuk govdesi icin biraz
		// genisletildi (+22), yoksa sprite'in kenari kalbe degiyor ama
		// merkez menzilin disinda kaliyordu.
		//
		// strike_pow == 2 SART: sadece guc dash isliyor. Ufak dash, yani
		// Z'ye basar basmaz cikan vurus, Konuk'a gecmiyor.
		if (gst_state == 1) or (gst_state == 2)
		{
			var _gmes = point_distance(battle_soul.x,battle_soul.y,gst_x,gst_y);
			var _savruldu = false;
			if (instance_exists(battle_soul_orange_dr))
			{
				if (battle_soul_orange_dr.strike_time > 0)
				and (battle_soul_orange_dr.strike_pow == 2)
				and (_gmes <= battle_soul_orange_dr.strike_rad+22)
				{
					_savruldu = true;
				}
			}

			if (_savruldu)
			{
				var _sd = point_direction(battle_soul.x,battle_soul.y,gst_x,gst_y);
				gst_rvx = lengthdir_x(16,_sd);
				gst_rvy = lengthdir_y(16,_sd);
				gst_state = 3;
				gst_t = 0;
				gst_cycle += 1;
				gst_flash = 14;
				audio_play_sound(snd_break_0,0,false);
				Camera_Shake(5,5,3,3);
			}
			else if (gst_state == 2) and (_gmes <= 30)
			{
				if (global.kr)
				{
					if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
				}
				else if (global._inv < 1)
				{
					Battle_CallSoulEventHurt();
				}
			}
		}
	}

	//======================================================================
	// PAPYRUS'UN SIGARA SAHNESI
	//======================================================================
	// Koridor da Konuk da bitti: kutu normale doner, ruh kirmizi olur ve
	// Papyrus bir mola verir. Adimlar:
	//   1  kutu/ruh yerine oturdu, ilk replik bekleniyor
	//   2  "MIND IF I TAKE A QUICK SMOKE BREAK?" oynuyor
	//   3  sigara pozu + duman
	//   4  eski sprite'lara donuldu
	//   5  "AH, NOTHING BEATS A CIGAR AM I RIGHT?" oynuyor
	//   6  tur kapandi
	//======================================================================
	if (bolum == 12) and (_timer == bitis_kare+35)
	{
		bolum = 13;
		CarStop();
		BoxStop();
		DrCorridorStop();
		with (battle_regularbone) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
		with (battle_gasterblaster_beam) { instance_destroy(); }
		SigaraBasla();
	}

	//---------------------------------------------------- 1. replik
	if (sahne == 1) and (_timer == sahne_kare+45)
	{
		sahne = 2;
		var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
		_dlg.text = "{speaker 1}{font 4}{voice 4}{pap_head 1}MIND IF I TAKE A&QUICK SMOKE&BREAK?";
	}

	//---------------------------------------------------- sigara pozu
	// spr_papyrus_smoking kafayi VE kolu de iceriyor; ayri cizilen o iki
	// parca gizleniyor, yoksa ust uste binerler. Bacaklar sprite'in disinda
	// kaldigi icin dokunulmuyor.
	if (sahne == 2) and (!instance_exists(battle_dialog_enemy))
	{
		sahne = 3;
		sahne_kare = _timer;
		duman_t = 0;
		with (battle_enemy_engage)
		{
			pap_body_sprite = spr_papyrus_smoking;
			pap_body_image = 0;
			pap_head_alpha = 0;
			pap_arm_alpha = 0;
		}
	}

	//---------------------------------------------------- duman uretimi
	if (sahne == 3)
	{
		duman_t += 1;
		if (duman_t % 11 == 0) and (instance_exists(battle_enemy_engage))
		{
			// Ucun ekran karsiligi Create_0'da hesaplandi
			var _ux = 0;
			var _uy = 0;
			with (battle_enemy_engage)
			{
				_ux = pap_draw_x+pap_shake_x-38;
				_uy = y-178+pap_bob;
			}
			DumanEkle(_ux,_uy);
		}

		if (_timer == sahne_kare+300)
		{
			sahne = 4;
			sahne_kare = _timer;
			with (battle_enemy_engage)
			{
				pap_body_sprite = spr_papyrus_body;
				pap_body_image = 0;
				pap_head_alpha = 1;
				pap_arm_alpha = 1;
			}
		}
	}

	//---------------------------------------------------- 2. replik
	if (sahne == 4) and (_timer == sahne_kare+35)
	{
		sahne = 5;
		var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
		_dlg.text = "{speaker 1}{font 4}{voice 4}{pap_head 4}AH, NOTHING&BEATS A CIGAR&AM I RIGHT?";
	}

	//---------------------------------------------------- tur kapaniyor
	// Sigara bitti: kirmizi/mavi atak basliyor.
	if (sahne == 5) and (!instance_exists(battle_dialog_enemy))
	{
		sahne = 6;
		KirmiziBasla();
	}

	//---------------------------------------------------- duman hareketi
	// Yukselirken yavasliyor (kaldirma kuvveti soner), yatayda yavas bir
	// salinimla suruklenir. Buyume ve solma cizimde.
	if (array_length(duman) > 0)
	{
		for (var _i = array_length(duman)-1; _i >= 0; _i--)
		{
			var _dm = duman[_i];
			_dm.t += 1;
			_dm.vy *= 0.985;
			_dm.vx *= 0.99;
			_dm.x += _dm.vx+dsin(_dm.t*2.6+_dm.tohum)*0.35;
			_dm.y += _dm.vy;
			if (_dm.t >= _dm.omur) { array_delete(duman,_i,1); }
		}
	}
}
