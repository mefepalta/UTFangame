var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer = 1)
	{
		Battle_SetBoardSizeCubic(65,65,85,85);
	}
	if (_timer = 10)
	{
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,290,0,false);
	}
	if (_timer = 90)
	{
		Battle_SlamUp();
	}
	if (_timer = 90)
	{
		RegularBone(right_box,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,152,-5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box + 2,152,5,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer = 120)
	{
		RegularBoneWall(DIR.LEFT,135,12,50,left_box,top_box,50,180,0,false);
		RegularBoneWall(DIR.RIGHT,135,12,50,right_box,top_box,50,180,0,false);
	}
	if (_timer = 180)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 195)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 210)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 225)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 240)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 255)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 270)
	{
		RegularBone(left_box + 90,bottom_box,52,0,-3,90,0,0,1,0,0,0,0,true);
	}
	if (_timer = 285)
	{
		RegularBone(right_box - 90,bottom_box,52,0,-3,270,0,0,1,0,0,0,0,true);
	}
	if (_timer = 290)
	{
		RegularBlaster(320,-50,left_box + 93,top_box - 40,270,270,20,20,2,2,50);
	}
	if (_timer = 370)
	{
		Battle_SlamRight();
	}
	if (_timer > 370) and (_timer < 550)
	{
		if (_timer % 5 == 0)
		{
			RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer = 550)
	{
		audio_play_sound(snd_ding,2,false);
		Battle_SetSoul(battle_soul_red);
		RegularBlaster(320,-50,left_box - 30,top_box + 30,0,0,20,1,2,2,50);
		RegularBlaster(320,-50,left_box + 60,top_box - 60,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,right_box + 40,bottom_box + 40,0,135,20,1,2,2,50);
	}
	if (_timer = 600)
	{
		RegularBlaster(320,-50,left_box - 30,top_box + 107,0,0,20,1,2,2,50);
		RegularBlaster(320,-50,left_box + 103,top_box - 60,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,left_box - 20,top_box - 30,0,315,20,1,2,2,50);
	}
	if (_timer = 650)
	{
		RegularBlaster(320,-50,right_box + 40,bottom_box - 70,0,180,20,1,3,3,50);
		RegularBlaster(320,-50,left_box + 50,top_box - 70,0,270,20,1,2,2,50);
		RegularBlaster(320,-50,right_box - 50,bottom_box + 70,0,90,20,1,2,2,50);
	}
	if (_timer = 770)
	{
		Battle_SetMenuDialog("* He stares through you.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer > 545) and (_timer < 1370) { battle_board.angle += don_hiz; }
	if (_timer > 2312) and (_timer < 3360)
	{
		SeaStep(34,78,3,50,70);
		PlatStep();
	}
	if (_timer > 3460) and (_timer < 3944) { FanStep(); }

	// 1) Slam down. Tek grup: iki yandan dortten sekiz kemik ayni karede doguyor.
	//    Hizlar kalbin ziplama yayina gore ayarli -- once en uzun/en hizli, sonra sirayla
	//    daha kisa ve daha yavas olanlar, hepsi tek ziplamayla gecilecek sekilde.
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		Battle_SetSoul(battle_soul_blue);
		Battle_SetBoardSizeCubic(65,65,150,150,30);
	}

	if (_timer == 40)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}

	if (_timer == 120)
	{
		Salvo();
	}

	if (_timer == 290)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
	}

	if (_timer == 340)
	{
		WallMake(true,70,44,30);
	}

	if (_timer == 470)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}


	// 2) Kutu kucuk kareye donup surekli donmeye basliyor. Boltlar kutunun AABB sinirinda
	//    patladigi icin dogus genisligi +-48 pikselle sinirli -- hicbiri kutuyu siyirip kacamiyor.
	//    Arada ince blaster lar dogrudan oyuncunun o anki konumuna kilitleniyor.
	if (_timer == 500)
	{
		Battle_SetBoardSizeCubic(65,65,65,65,40);
	}

	if (_timer == 545)
	{
		audio_play_sound(snd_impact,2,false);
		Camera_Shake(5,5,2,2);
		don_hiz = 1.4;
	}

	if (_timer == 600)
	{
		AlphysBigBolt(battle_board.x+-44,-60,270,6,5,2.4);
	}

	if (_timer == 660)
	{
		AlphysBigBolt(battle_board.x+38,-60,270,6,5,2.4);
	}

	if (_timer == 720)
	{
		AlphysBigBolt(battle_board.x+-12,-60,270,6,7,2.4);
	}

	if (_timer == 780)
	{
		AlphysBigBolt(battle_board.x+46,-60,270,6,5,2.4);
	}

	if (_timer == 840)
	{
		AlphysBigBolt(battle_board.x+-30,-60,270,6,5,2.4);
	}

	if (_timer == 900)
	{
		AlphysBigBolt(battle_board.x+20,-60,270,6,7,2.4);
	}

	if (_timer == 960)
	{
		AlphysBigBolt(battle_board.x+-46,-60,270,6,5,2.4);
	}

	if (_timer == 1020)
	{
		AlphysBigBolt(battle_board.x+32,-60,270,6,5,2.4);
	}

	if (_timer == 1080)
	{
		AlphysBigBolt(battle_board.x+0,-60,270,6,7,2.4);
	}

	if (_timer == 1140)
	{
		AlphysBigBolt(battle_board.x+-22,-60,270,6,5,2.4);
	}

	if (_timer == 1200)
	{
		AlphysBigBolt(battle_board.x+44,-60,270,6,5,2.4);
	}

	if (_timer == 1260)
	{
		AlphysBigBolt(battle_board.x+-36,-60,270,6,7,2.4);
	}

	if (_timer == 660)
	{
		AimBlaster(35,30,12,1);
	}

	if (_timer == 840)
	{
		AimBlaster(160,30,12,1);
	}

	if (_timer == 1020)
	{
		AimBlaster(255,30,12,1);
	}

	if (_timer == 1200)
	{
		AimBlaster(105,30,12,1);
	}

	if (_timer == 1370)
	{
		don_hiz = 0;
		Anim_Create(battle_board,"angle",ANIM_TWEEN.CUBIC,ANIM_EASE.OUT,battle_board.angle,(ceil(battle_board.angle/360)*360)-battle_board.angle,60);
	}


	// 3) Kutu 4x4 = 16 hucre. Uc satir ve uc sutun AYNI karede ates ediyor, geriye
	//    tek bir guvenli hucre kaliyor. Alti blaster ayni karede doguyor ve sayaclari
	//    esitlendigi icin doluslari da atislari da birebir ayni karede.
	if (_timer == 1450)
	{
		battle_board.angle = 0;
		// ALT KENAR SABIT: alt kenar varsayilan yerinde (DOWN = 65) kalsin diye
		// buyume yukari kaydirildi. Toplam yukseklik AYNI (200), yani izgara
		// hala 4 esit serit -- GridBeam artik seritleri gercek kenarlardan
		// olctugu icin kutunun asimetrik olmasi sorun degil.
		Battle_SetBoardSizeCubic(135,65,100,100,44);
	}

	if (_timer == 1540)
	{
		GridBeam(true,0,false);
		GridBeam(true,2,false);
		GridBeam(true,3,true);
		GridBeam(false,0,false);
		GridBeam(false,1,true);
		GridBeam(false,3,true);
	}

	if (_timer == 1690)
	{
		GridBeam(true,0,false);
		GridBeam(true,1,true);
		GridBeam(true,2,false);
		GridBeam(false,1,true);
		GridBeam(false,2,false);
		GridBeam(false,3,true);
	}

	if (_timer == 1840)
	{
		GridBeam(true,1,true);
		GridBeam(true,2,false);
		GridBeam(true,3,true);
		GridBeam(false,0,false);
		GridBeam(false,1,true);
		GridBeam(false,2,false);
	}

	if (_timer == 1990)
	{
		GridBeam(true,0,false);
		GridBeam(true,1,true);
		GridBeam(true,3,true);
		GridBeam(false,0,false);
		GridBeam(false,2,false);
		GridBeam(false,3,true);
	}


	// 4) Mavi ruh, kutu kenarlari arasinda gidip gelen platformun uzerinde.
	//    Kemikler once uyari sesiyle 40 karede yerden yukseliyor. Shocker in yildirimi
	//    dustugu anda o noktadan dalga yayiliyor: yakindaki kemikler cok, uzaktakiler az oynuyor.
	if (_timer == 2180)
	{
		Battle_SetSoul(battle_soul_blue);
		Battle_SetBoardSizeCubic(60,60,150,150,44);
	}

	if (_timer == 2230)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}

	if (_timer == 2270)
	{
		SeaMake(26,34,40);
		plat = makeplatform(battle_board.x-120,battle_board.y+18,64,2.2,0,1,0);
	}

	if (_timer == 2380)
	{
		AlphysShocker(battle_board.x+-110,battle_board.y+58,44);
	}

	if (_timer == 2424)
	{
		RipMake(battle_board.x+-110);
	}

	if (_timer == 2510)
	{
		AlphysShocker(battle_board.x+70,battle_board.y+58,44);
	}

	if (_timer == 2554)
	{
		RipMake(battle_board.x+70);
	}

	if (_timer == 2640)
	{
		AlphysShocker(battle_board.x+-40,battle_board.y+58,44);
	}

	if (_timer == 2684)
	{
		RipMake(battle_board.x+-40);
	}

	if (_timer == 2770)
	{
		AlphysShocker(battle_board.x+120,battle_board.y+58,44);
	}

	if (_timer == 2814)
	{
		RipMake(battle_board.x+120);
	}

	if (_timer == 2900)
	{
		AlphysShocker(battle_board.x+-130,battle_board.y+58,44);
	}

	if (_timer == 2944)
	{
		RipMake(battle_board.x+-130);
	}

	if (_timer == 3030)
	{
		AlphysShocker(battle_board.x+30,battle_board.y+58,44);
	}

	if (_timer == 3074)
	{
		RipMake(battle_board.x+30);
	}

	if (_timer == 3160)
	{
		AlphysShocker(battle_board.x+90,battle_board.y+58,44);
	}

	if (_timer == 3204)
	{
		RipMake(battle_board.x+90);
	}

	if (_timer == 3360)
	{
		SeaClear();
		if (instance_exists(plat)) { instance_destroy(plat); }
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}


	// 5) Normal kucuk kare kutu. Tek dalga: kemikler kutunun disindan, 60 karede
	//    yavasca uzayarak merkeze dogru geliyor ve donuyor; sonda yine kisalarak gidiyorlar.
	//    Kalbin guvenli yeri tam orta nokta.
	if (_timer == 3410)
	{
		Battle_SetBoardSizeCubic(65,65,65,65,44);
	}

	if (_timer == 3460)
	{
		FanSet(6,2.6,110,60);
	}

	if (_timer == 3880)
	{
		FanRetract(60);
	}

	if (_timer == 3944)
	{
		FanClear();
	}


	// 6) Bitis: kutunun disindan, dort kenarin orta noktasindan dort blaster
	//    ayni karede dogup ayni karede ates ediyor.
	if (_timer == 3970)
	{
		var _b0 = RegularBlaster(-120,battle_board.y,battle_board.x-battle_board.left-64,battle_board.y,0,0,40,16,2,2,46);
		var _b1 = RegularBlaster(760,battle_board.y,battle_board.x+battle_board.right+64,battle_board.y,180,180,40,16,2,2,46);
		var _b2 = RegularBlaster(battle_board.x,-120,battle_board.x,battle_board.y-battle_board.up-64,270,270,40,16,2,2,46);
		var _b3 = RegularBlaster(battle_board.x,600,battle_board.x,battle_board.y+battle_board.down+64,90,90,40,16,2,2,46);
		var _hepsi = [_b0,_b1,_b2,_b3];
		for (var _i = 0; _i < 4; _i++)
		{
			_hepsi[_i]._counter = 0;
			_hepsi[_i].BlasterDuration = 46;
			_hepsi[_i]._blast_cooldown = 16;
			_hepsi[_i]._blast_duration = 40;
			_hepsi[_i].image_index = 0;
		}
	}

	if (_timer == 4170)
	{
		battle_board.angle = 0;
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125,40);
		Battle_SetMenuDialog("* His voice softens.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
