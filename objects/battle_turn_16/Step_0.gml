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
		if (_timer % 45 == 0)
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
	//----------------------------------------------------------------------
	// Turuncu ruh koridoru. Diyalog atagin SONUNDA basliyor.
	// Bolumler asagida "PATTERN" basliklari altinda; atak_son Create_0'da.
	//----------------------------------------------------------------------
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

	// Ruh kosu pozisyonuna (ekranin alt kismina) kayiyor
	if (_timer == 60)
	{
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,400-battle_soul.y,50);
	}

	//======================================================================
	// PATTERN 1 -- kemik bilekligi
	//======================================================================
	// Bileklikler kalbin USTUNDEN gecen halkalar: yerdeyken zararsizlar,
	// ziplayan kalp iceri girip carpiyor. Beyaz barlar tam tersi. Ikisi
	// sirayla geliyor: bar "zipla", bileklik "ziplama".
	//======================================================================
	if (_timer == 150)
	{
		CarRun(3,600);
		// Bileklikler 610 / 1210 / 1810 px sonra kalbe variyor.
		// Halka+bar ciftleri onlarin arasina denk geliyor: yay 760-1020,
		// 1360-1620, 1960-2220 arasi, yani hicbiri bileklikle cakismiyor.
		JumpRing(0,340);
		JumpBar(466);
		JumpRing(-60,940);
		JumpBar(1066);
		JumpRing(55,1540);
		JumpBar(1666);
	}

	if (car_on)
	{
		var _cmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _cmul = battle_soul_orange_dr.world_mul; }
		// Donus gorsel; inis dunya hiziyla, engellerle ayni carpanla.
		car_ang += car_spin*(1+(_cmul-1)*0.4);
		var _cn = array_length(cars);
		for (var _i = 0; _i < _cn; _i++) { cars[_i].y += 4*_cmul; }

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

	if (_timer == 720)
	{
		CarStop();
	}

	//======================================================================
	// PATTERN 2 -- Beklenmedik Konuk
	//======================================================================
	if (_timer == 800)
	{
		GuestStart(gst_max);
	}

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
			// Hazirlik: titriyor ve son ana kadar kalbi takip ediyor
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
			if (gst_t > 55)
			{
				gst_state = 0;
				gst_t = 0;
			}
		}

		// Dash tutturuldu mu. Menzil kontrolu konugun buyuk govdesi icin
		// biraz genisletildi (+22), yoksa sprite'in kenari kalbe degiyor
		// ama merkez menzilin disinda kaliyordu.
		if (gst_state == 1) or (gst_state == 2)
		{
			var _gmes = point_distance(battle_soul.x,battle_soul.y,gst_x,gst_y);
			var _savruldu = false;
			if (instance_exists(battle_soul_orange_dr))
			{
				if (battle_soul_orange_dr.strike_time > 0)
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

	// Konuk erkenden kacarsa kalan bos zamani atla
	if (_timer > 860) and (_timer < 1600) and (!gst_on)
	{
		_timer = 1600;
	}

	//======================================================================
	// PATTERN 3 -- kucuk kutular
	//======================================================================
	if (_timer == 1650)
	{
		BoxRun(5,116,100,260,52);
	}

	if (box_on) and (instance_exists(battle_soul))
	{
		var _kmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _kmul = battle_soul_orange_dr.world_mul; }
		// Kutular ve blasterlar barlarla ayni hizda kayiyor (bar spd_y'si 4),
		// boylece duvarlar kutulardan hic ayrilmiyor.
		var _kay = 4*_kmul;
		var _nb = array_length(boxes);
		var _nl = array_length(blasts);
		for (var _i = 0; _i < _nb; _i++) { boxes[_i].y += _kay; }
		for (var _i = 0; _i < _nl; _i++) { blasts[_i].y += _kay; }

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

		// Isaretci blast_warn e ulasinca gercek blaster doguyor. Sonrasini
		// blaster kendi hallediyor: sarj, ates, kayma, hasar.
		for (var _i = 0; _i < _nl; _i++)
		{
			if (blasts[_i].dogdu) { continue; }
			if (blasts[_i].y < blast_warn) { continue; }
			blasts[_i].dogdu = true;
			DrBlaster(blasts[_i].side,blasts[_i].y);
		}
	}

	if (_timer == 2150)
	{
		BoxStop();
	}

	//======================================================================
	// PATTERN 4 -- asil ziplama bolumu
	// Halkalar 260 px arayla: bu ruhun jump_dist i, yani bir zincirden
	// digerine tam denk geliyor. Aralarindaki beyaz barlar havadaki kalbe
	// degmiyor, dolayisiyla tek hasarsiz yol ziplamayi kacirmamak.
	//======================================================================
	if (_timer == 2200)
	{
		audio_play_sound(snd_exclamation,0,false);
		JumpRing(0,0);
		JumpBar(130);
		JumpRing(-60,260);
		JumpBar(390);
		JumpRing(55,520);
		JumpBar(650);
		JumpRing(-50,780);
		JumpBar(910);
		JumpRing(70,1040);
		JumpBar(1170);
		JumpRing(0,1300);
	}

	//----------------------------------------------------------------------
	// Koridor kapaniyor, sahne diyaloga hazirlaniyor
	//----------------------------------------------------------------------
	if (_timer == atak_son)
	{
		// Hangi pattern yarim kalirsa kalsin sahne temizleniyor
		CarStop();
		GuestStop();
		BoxStop();
		with (battle_regularbone) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
		DrCorridorStop();
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_red);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,125,125,40);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
		with (battle_soul) { moveable = false; }
		Camera_Shake(3,3,2,2);
	}

	//----------------------------------------------------------------------
	// Devir teslim diyalogu
	//----------------------------------------------------------------------
	if (_timer == atak_son+70) and (!dialog_started)
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
