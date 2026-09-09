
if (room != room_battle_1)
{
	if (_timer >= 2) { Battle_EndTurn(); }
	exit;
}

OmurAdim();
if (kesme > 0) { kesme -= 1; }

if (pap_t > 0)
{
	pap_t -= 1;
	if (pap_t == 0) and (instance_exists(battle_enemy_engage))
	{
		battle_enemy_engage.pap_head_image = 1;
	}
}

if (atak == 1)
{
	if (_timer == 1)
	{
		if (audio_is_playing(global.p2_bgm)) { audio_stop_sound(global.p2_bgm); }
		global.p2_bgm = audio_play_sound(snd_rising_star, 10, true);
	}

	if (_timer == 2)
	{
		MaviRuh(DIR.DOWN);
		PapPoz(16,60);
	}

	if (_timer == 80)
	{
		audio_play_sound(snd_stab,2,false);
		var _x = -150;
		for (var _i = 0; _i < 12; _i++)
		{
			Kemik(150,_x,-150, 2,6, 0,-0.15, 0,0, 0, 150);
			_x += 30;
		}
	}

	if (_timer == 150)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150,0,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Kemik(150,0,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}

	if (_timer == 200)
	{
		kol1 = Kol(-9);
		kol2 = Kol(0);
	}
	if (_timer >= 200) and (_timer <= 220) { KolHareket(14); }
	if (_timer == 220) { Carpma(); }
	if (_timer >= 250) and (_timer <= 440) { KolDon(); }

	if (_timer >= 350) and (_timer <= 460)
	{
		if ((_timer-350) % 10 == 0) { Kemik(150,-50,80, 0,-6, 0,0.12, 90,0, 0, 150); }
	}

	if (_timer == 500) { Blaster(320,600,380,380,0,100,50,2.25,2.25,20); }

	if (_timer == 600) { KolSil(); }

	if (_timer == 700)
	{
		audio_play_sound(snd_stab,2,false);
		targ = Duvar(-215,-230,0);
		Kemik(150,100,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Kemik(150,100,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}

	if (_timer >= 700) and (_timer <= 720)
	{
		DuvarHareket(targ,0,14);
		if (instance_exists(battle_soul)) { battle_soul.x = T28Sag(); }
	}
	if (_timer == 720) { Carpma(); }

	if (_timer >= 800) and (_timer <= 946) { DuvarHareket(targ,0.5,0); }

	if (_timer == 946)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		DuvarSil(targ);
		targ = [];
	}
	if (_timer == 966)
	{
		audio_play_sound(snd_noise,2,false);
		if (instance_exists(battle_soul))
		{
			battle_soul.x = battle_board.x;
			battle_soul.y = T28Dip();
		}
	}

	if (_timer == 1000)
	{
		Blaster(320,600,320,380,  0,150,50,2,2.25,20);
		Blaster(-50,100,120,100, 90,  0,50,2,2.25,20);
		Blaster(650,100,520,100,-90,  0,50,2,2.25,20);
	}

	if (_timer == 1050)
	{
		targ1 = Duvar(-275,-230,0);
		targ2 = Duvar( 275,-230,0);
	}
	if (_timer >= 1150) and (_timer <= 1170)
	{
		DuvarHareket(targ1,0,14);
		DuvarHareket(targ2,0,14);
	}
	if (_timer == 1170) { Carpma(); }

	if (_timer == 1260) { Bitir("* Papyrus is enjoying this."); }
}

if (atak == 2)
{
	if (_timer == 20)
	{
		bt1 = Kemik(200,-150, 100, 0,0, 0,0,  30,0, 0, 0);
		bt2 = Kemik(200, 150, 100, 0,0, 0,0, -30,0, 0, 0);
		bt3 = Kemik(200,-110,-170, 0,0, 0,0, -20,0, 0, 0);
		bt4 = Kemik(200, 110,-170, 0,0, 0,0,  20,0, 0, 0);
	}
	if (_timer >= 20) and (_timer <= 40)
	{
		Hareket(bt1, 4.5,-8);
		Hareket(bt2,-4.5,-8);
	}
	if (_timer == 40) { Carpma(); }

	if (_timer >= 100) and (_timer <= 120)
	{
		Hareket(bt3, 5.1,13.5);
		Hareket(bt4,-5.1,13.5);
	}
	if (_timer == 120) { Carpma(); }

	if (_timer == 150) { MaviRuh(DIR.DOWN); PapPoz(16,60); }

	if (_timer == 200)
	{
		Kemik(150,-80,80, 0,-0.75, 0,0, 90,0, 0, 350);
		Kemik(150,-80,90, 0,-0.75, 0,0, 90,0, 0, 350);
		Kemik(150, 80,80, 0,-0.75, 0,0, 90,0, 0, 350);
		Kemik(150, 80,90, 0,-0.75, 0,0, 90,0, 0, 350);
	}

	if (_timer >= 200) and (_timer <= 600)
	{
		if ((_timer-200) % 80 == 0)
		{
			Kemik(150,-80,-130,  2,0, 0,0, 0,0, 0, 150);
			Kemik(150, 80,-130, -2,0, 0,0, 0,0, 0, 150);
			Kemik(150,-80, 50,   2,0, 0,0, 0,0, 0, 220);
			Kemik(150, 80, 50,  -2,0, 0,0, 0,0, 0, 220);
		}
	}

	if (_timer == 600) { Blaster(320,600,320,400,0,90,50,1,2,30); }

	if (_timer == 800)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150, 150,-80, -2,2, 0,0, 90,0, 0, 220);
		Kemik(150, 150,-90, -2,2, 0,0, 90,0, 0, 220);
		Kemik(150,-150,-80,  2,2, 0,0, 90,0, 0, 220);
		Kemik(150,-150,-90,  2,2, 0,0, 90,0, 0, 220);
	}

	if (_timer >= 900) and (_timer <= 1200)
	{
		if ((_timer-900) % 80 == 0)
		{
			Kemik(150,-80,-130,  2,0, 0,0, 0,0, 0, 150);
			Kemik(150,-90,-130,  2,0, 0,0, 0,0, 0, 150);
			Kemik(150, 80,-130, -2,0, 0,0, 0,0, 0, 150);
			Kemik(150, 90,-130, -2,0, 0,0, 0,0, 0, 150);
			Kemik(150,-80, 50,   2,0, 0,0, 0,0, 0, 220);
			Kemik(150,-90, 50,   2,0, 0,0, 0,0, 0, 220);
			Kemik(150, 80, 50,  -2,0, 0,0, 0,0, 0, 220);
			Kemik(150, 90, 50,  -2,0, 0,0, 0,0, 0, 220);
		}
	}

	if (_timer >= 1250) and (_timer <= 1350)
	{
		Dondur(bt1, 1);
		Dondur(bt2,-1);
	}

	if (_timer == 1300)
	{
		Kemik(150,-80,0,  6,0, -0.25,0, 0,0, 0, 150);
		Kemik(150,-90,0,  6,0, -0.25,0, 0,0, 0, 150);
		Kemik(150, 80,0, -6,0,  0.25,0, 0,0, 0, 150);
		Kemik(150, 90,0, -6,0,  0.25,0, 0,0, 0, 150);
	}

	if (_timer == 1400)
	{
		bsdiz = [];
		array_push(bsdiz, Kemik(200,  0,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Kemik(200,-10,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Kemik(200, 10,-180, 0,0, 0,0, 0,0, 0, 0));
	}
	if (_timer >= 1400) and (_timer <= 1420) { DuvarHareket(bsdiz,0,14); }

	if (_timer == 1420)
	{
		Carpma();
		for (var _i = 0; _i < 5; _i++)
		{
			Kemik(40,0,55,
				irandom_range(-5,5), 3+irandom(3),
				0, -(0.2+random(0.2)),
				0, irandom_range(-3,3), 0, 220);
		}
	}

	if (_timer >= 1550) { DuvarHareket(bsdiz,0,-1); }

	if (_timer >= 1700) and (_timer <= 1720)
	{
		Dondur(bt3,-4); Dondur(bt4, 4);
		Hareket(bt3, 3.3,0);
		Hareket(bt4,-3.3,0);
	}
	if (_timer == 1720) { Carpma(); }

	if (_timer >= 1750)
	{
		Dondur(bt1,-1); Dondur(bt2, 1);
		Dondur(bt3, 1); Dondur(bt4,-1);
		Hareket(bt1,-1,0); Hareket(bt2, 1,0);
		Hareket(bt3,-1,0); Hareket(bt4, 1,0);
	}

	if (_timer == 1900) { Bitir("* He hasn't broken a sweat."); }
}

if (atak == 4)
{
	if (array_length(yildiz) > 0) { YildizAdim(); }

	if (_timer == 20)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		YildizKur();
		YildizAdim();
		PapPoz(16,60);
	}
	if (_timer == 40) { audio_play_sound(snd_noise,2,false); }

	if (_timer >= 40) and (_timer <= 1300) { yildiz_aci += 3*ATAK_HIZ; }

	if (_timer == 100)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150, 80,0, -6,0,  0.15,0, 0,0, 1, 200);
		Kemik(150,-80,0,  6,0, -0.15,0, 0,0, 2, 200);
	}

	if (_timer == 150)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150,0,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Kemik(150,0,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}
	if (_timer == 200)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150,0,80, 0,-6, 0,0.2, 90,0, 0, 150);
		Kemik(150,0,90, 0,-6, 0,0.2, 90,0, 0, 150);
	}

	if (_timer == 250)
	{
		sb = [];
		array_push(sb, Kemik(200, 50,180, 0,0, 0,0, 0,0, 0, 0));
		array_push(sb, Kemik(200,-50,180, 0,0, 0,0, 0,0, 0, 0));
		array_push(sb, Kemik(200,  0,180, 0,0, 0,0, 0,0, 0, 0));
	}
	if (_timer >= 250) and (_timer <= 300) { DuvarHareket(sb,0,-3.45); }
	if (_timer >  300) and (_timer <= 320) { DuvarHareket(sb,0,-6);    }
	if (_timer == 320) { Carpma(); }

	if (_timer == 350)
	{
		sb2 = [];
		array_push(sb2, Kemik(200,180, 50, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Kemik(200,180,-50, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Kemik(200,180,  0, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 350) and (_timer <= 400) { DuvarHareket(sb2,-3.45,0); }
	if (_timer >  400) and (_timer <= 420) { DuvarHareket(sb2,-6,0);    }
	if (_timer == 420) { Carpma(); }

	if (_timer >= 450) and (_timer <= 800)
	{
		if ((_timer-450) % 80 == 0)
		{
			var _r1 = irandom_range(1,2);
			var _r2 = irandom_range(1,2);
			var _r3 = irandom_range(1,2);
			var _r4 = irandom_range(1,2);
			Kemik(200,  80,-100, -2,0, 0,0,  0,0, _r1, 200);
			Kemik(200, -80, 100,  2,0, 0,0,  0,0, _r2, 200);
			Kemik(200,-100,  80, 0,-2, 0,0, 90,0, _r3, 200);
			Kemik(200, 100, -80, 0, 2, 0,0, 90,0, _r4, 200);
		}
	}

	if (_timer == 850) { audio_play_sound(snd_ding,2,false); YildizRenk(2); }

	if (_timer >= 900) and (_timer <= 1000) { yildiz_px += (-7-yildiz_px)/60; }

	if (_timer >= 1100) and (_timer <= 1200)
	{
		yildiz_px += (0-yildiz_px)/60;
		yildiz_py += (1-yildiz_py)/60;
	}

	if (_timer == 1300)
	{
		audio_play_sound(snd_ding,2,false);
		YildizRenk(0);
		DiziSolgun(sb);
		DiziSolgun(sb2);
	}
	if (_timer >= 1300) { yildiz_aci += 2*ATAK_HIZ; }

	if (_timer >= 1600)
	{
		yildiz_px += 0.1*ATAK_HIZ;
		yildiz_py += 0.01*ATAK_HIZ;
	}

	if (_timer == 1840) { Bitir("* The room is still spinning."); }
}

if (atak == 7)
{
	if (_timer == 20)
	{
		Kemik(150,-80,100, 0,-3, 0,0, 90,0, 0, 200);
		Kemik(150,-80,110, 0,-3, 0,0, 90,0, 0, 200);
		Kemik(150, 80,100, 0,-3, 0,0, 90,0, 0, 200);
		Kemik(150, 80,110, 0,-3, 0,0, 90,0, 0, 200);
		MaviRuh(DIR.DOWN);
		SlamKur(DIR.DOWN);
		PapPoz(16,60);
	}
	if (_timer >= 20) and (_timer <= 40) { SlamAdim(); }

	if (_timer == 50)
	{
		UyariCizgi(0,-30,false);
		targ = Duvar(0,-230,0);
	}
	if (_timer == 100) { audio_play_sound(snd_stab,2,false); }
	if (_timer >= 100) and (_timer <= 120) { DuvarHareket(targ,0,4.5); }
	if (_timer == 120) { UyariSil(); }

	if (_timer == 150)
	{
		UyariCizgi(0,30,false);
		targ1 = Duvar(0,230,0);
		SlamKur(DIR.UP);
	}
	if (_timer >= 150) and (_timer <= 170) { SlamAdim(); }
	if (_timer == 200) { audio_play_sound(snd_stab,2,false); }
	if (_timer >= 200) and (_timer <= 220) { DuvarHareket(targ1,0,-4.5); }
	if (_timer == 220) { UyariSil(); }

	if (_timer == 250) { SlamKur(DIR.LEFT); }
	if (_timer >= 250) and (_timer <= 270) { SlamAdim(); }
	if (_timer == 260)
	{
		UyariCizgi(-30,0,true);
		targ2 = Duvar(230,0,90);
	}

	if (_timer == 300)
	{
		Kemik(150,-80,0, 6,0, -0.25,0, 0, 0.4, 0, 200);
		Kemik(150,-80,0, 6,0, -0.25,0, 0,-0.4, 0, 200);
	}

	if (_timer == 350)
	{
		Kemik(150,80, 50, -3,0, 0,0, 0, 1, 0, 200);
		Kemik(150,80,-50, -3,0, 0,0, 0,-1, 0, 200);
	}

	if (_timer == 460) { audio_play_sound(snd_stab,2,false); }
	if (_timer >= 460) and (_timer <= 480) { DuvarHareket(targ2,-10,0); }
	if (_timer == 480) { UyariSil(); }

	if (_timer == 510)
	{
		Kemik(150,0, 80, 0,-6, 0, 0.12, 90,0, 1, 200);
		Kemik(150,0,-80, 0, 6, 0,-0.12, 90,0, 2, 200);
	}

	if (_timer == 560)
	{
		sb = [];
		array_push(sb, Kemik(150,-170,  0, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb, Kemik(150,-170, 10, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb, Kemik(150,-170,-10, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 560) and (_timer <= 570) { DuvarHareket(sb,11,0); }
	if (_timer == 570) { Carpma(); }
	if (_timer >= 570) and (_timer <= 590) { DuvarHareket(targ2,10,0); }

	if (_timer == 610)
	{
		KirmiziRuh();
		sb2 = [];
		array_push(sb2, Kemik(150,160, 20, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Kemik(150,160, 30, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Kemik(150,160,-20, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Kemik(150,160,-30, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 610) and (_timer <= 640) { DuvarHareket(sb2,-10,0); }
	if (_timer == 640) { Carpma(); }

	if (_timer == 660)
	{
		audio_play_sound(snd_stab,2,false);
		Kemik(150,70,80, 0,-3, 0,0, 90,0, 0, 200);
		Kemik(150,70,90, 0,-3, 0,0, 90,0, 0, 200);
	}

	if (_timer == 700)
	{
		bsdiz = [];
		array_push(bsdiz, Kemik(200,-25,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Kemik(200,-15,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Kemik(200, -5,-180, 0,0, 0,0, 0,0, 0, 0));
		sp_hiz = 6;
	}
	if (_timer >= 700) and (_timer <= 720) { DuvarHareket(bsdiz,0,8.7); }
	if (_timer == 720) { Carpma(); }

	if (_timer == 750)
	{
		audio_play_sound(snd_ding,2,false);
		DuvarRenk(bsdiz,2);
	}

	if (_timer >= 800) and (ara == 0)
	{
		for (var _i = 0; _i < array_length(bsdiz); _i++)
		{
			sp_hiz -= 0.08*ATAK_HIZ;
			Hareket(bsdiz[_i],sp_hiz,0);
		}
	}

	if (_timer == 960)
	{
		Temizle();
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
		Battle_SetSoul(battle_soul_red);
		ara = 1;
		ara_t = 0;
	}

	if (ara == 1)
	{
		ara_t += 1;

		if (ara_t == 30)
		{
			var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
			_dlg.text =
				 "{speaker 1}{font 4}{voice 4}{pap_head 0}HEY.{pause}{clear}"
				+"{pap_head 11}YOU SEEM A&LITTLE WORN&OUT.{pause}{clear}"
				+"{pap_head 1}MIND IF WE&TAKE A&BREAK?{pause}{clear}"
				+"{pap_head 5}DON'T WORRY.&I WILL PLAY&SOME MUSIC&TO NOT BORE&YOU.{pause}{clear}"
				+"{pap_head 13}MIND IF I&SCREW AROUND&YOUR&COMPUTER FOR&A LITTLE?";
		}

		if (ara_t > 40) and (!instance_exists(battle_dialog_enemy))
		{
			ara = 2;
			ara_t = 0;

			if (audio_is_playing(global.p2_bgm)) { audio_sound_gain(global.p2_bgm,0,900); }

			AraPencere();
			url_open(ARA_VIDEO_URL);
			SigaraBasla();
			AraKilitBasla();
		}
	}

	if (ara == 2)
	{
		ara_t += 1;
		AraKilitAdim();
		DumanAdim();

		duman_t += 1;
		if (duman_t % 11 == 0) and (instance_exists(battle_enemy_engage))
		{
			var _ux = 0;
			var _uy = 0;
			with (battle_enemy_engage)
			{
				_ux = pap_draw_x+pap_shake_x-38;
				_uy = y-178+pap_bob;
			}
			DumanEkle(_ux,_uy);
		}

		if (!tarayici_kondu) and (ara_t < 600) and (ara_t % 30 == 0)
		{
			tarayici_kondu = Win_Split_TarayiciyiSolaAl(ARA_TARAYICI);
		}

		if (ara_t >= ARA_VIDEO_SURE)
		{
			ara = 3;
			ara_t = 0;
			AraBitir();
		}
	}

	if (ara == 3)
	{
		ara_t += 1;
		DumanAdim();
		if (ara_t == 60) { Bitir("* He looks refreshed."); }
	}
}

if (atak == 10)
{
	if (_timer == 1) { global.easy_dmg4 = true; }

	if (_timer == 2) { MaviRuh(DIR.DOWN); PapPoz(16,60); }
	if (_timer == 20) { SlamKur(DIR.DOWN); }
	if (_timer >= 20) and (_timer <= 40) { SlamAdim(); }

	if (_timer == 40)
	{
		Kemik(150,80,-80, -2,0, 0,0, 0,0, 0, 120);
		Kemik(150,90,-80, -2,0, 0,0, 0,0, 0, 120);
	}

	if (_timer == 70)
	{
		UyariCizgi(30,0,true);
		targ = Duvar(-230,0,90);
	}
	if (_timer == 150) { audio_play_sound(snd_stab,2,false); }
	if (_timer >= 150) and (_timer <= 170) { DuvarHareket(targ,10,0); }
	if (_timer == 170)
	{
		UyariSil();
		Kemik(150,-80,  50, 2,0, 0,0, 0,0, 0, 120);
		Kemik(150,-80,-120, 2,0, 0,0, 0,0, 0, 120);
		Kemik(150,-90,  50, 2,0, 0,0, 0,0, 0, 120);
		Kemik(150,-90,-120, 2,0, 0,0, 0,0, 0, 120);
	}

	if (_timer == 200)
	{
		bt1 = Kemik(200,100,80, 0,0, 0,0, 90,0, 0, 0);
		bt2 = Kemik(200,100,90, 0,0, 0,0, 90,0, 0, 0);
		le_hiz = 6;
	}
	if (_timer >= 200) and (_timer <= 310) { DuvarHareket(targ,-2,0); }
	if (_timer >= 280) and (_timer <= 300)
	{
		Hareket(bt1,0,-13.6); Hareket(bt2,0,-13.6);
	}
	if (_timer == 300) { Carpma(); }
	if (_timer >= 350) and (_timer <= 370)
	{
		Hareket(bt1,-6.8,0); Hareket(bt2,-6.8,0);
	}
	if (_timer == 370) { Carpma(); }
	if (_timer >= 450) and (_timer <= 600)
	{
		Hareket(bt1,0,le_hiz); Hareket(bt2,0,le_hiz);
		le_hiz -= 0.2*ATAK_HIZ;
		if (_timer <= 500) { Hareket(bt1,2,0); Hareket(bt2,2,0); }
	}
	if (_timer >= 500) and (_timer <= 520)
	{
		Hareket(bt1,-4.8,0); Hareket(bt2,-4.8,0);
	}
	if (_timer == 520) { Carpma(); }
	if (_timer == 550)
	{
		if (instance_exists(bt1)) { bt1._color = 2; }
		if (instance_exists(bt2)) { bt2._color = 2; }
		audio_play_sound(snd_ding,2,false);
	}

	if (_timer == 600)
	{
		UyariCizgi(0,-11,false);
		targ1 = Duvar(0,-230,0);
		if (instance_exists(bt1)) { instance_destroy(bt1); }
		if (instance_exists(bt2)) { instance_destroy(bt2); }
	}
	if (_timer == 650) { audio_play_sound(snd_stab,2,false); }
	if (_timer >= 650) and (_timer <= 670) { DuvarHareket(targ1,0,6.1); }
	if (_timer == 670) { UyariSil(); }

	if (_timer == 700)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		DuvarSil(targ);  DuvarSil(targ1);
		targ = []; targ1 = [];
		with (battle_regularbone) { instance_destroy(); }
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,325,325,0);
	}

	if (_timer == 720)
	{
		KirmiziRuh();
		audio_play_sound(snd_noise,2,false);
		l_faz = 0;
		SansAlphysGizle();
		if (instance_exists(battle_soul))
		{
			// Kirmizi ruh (serbest hareket) ama SAGA BAKAN mavi ruh gorunumu:
			// mavi ruh yon gostergesini image_angle ile yapiyor, DIR.RIGHT'in
			// karsiligi 90 (bkz battle_soul_blue/Step_0). Bolum C'de ruh
			// yeniden yaratildigi icin aci sizmiyor.
			battle_soul.sprite_index = spr_battle_soul_blue;
			battle_soul.image_angle  = 90;
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}
	}

	if (_timer >= 700) and (_timer <= 2200)
	{
		DusmanKay(-5);
	}

	if (_timer >= 700) and (_timer <= 1000)
	{
		if ((_timer-700) % 100 == 0)
		{
			Kemik(200,400, 75, -5,0, 0,0, -45,0, 0, 220);
			Kemik(200,415, 75, -5,0, 0,0, -45,0, 0, 220);
		}
		if ((_timer-700) % 100 == 50)
		{
			Kemik(200,400,-75, -5,0, 0,0, 45,0, 0, 220);
			Kemik(200,415,-75, -5,0, 0,0, 45,0, 0, 220);
		}
	}

	if (_timer >= 1100) and (_timer <= 1500)
	{
		l_faz += 0.1*ATAK_HIZ;
		var _sn = 60*sin(l_faz);
		if ((_timer-1100) % 80 == 0)
		{
			var _rk = irandom_range(1,2);
			Kemik(150,320,0, -5,0, 0,0, 0,0, _rk, 150);
			Kemik(150,330,0, -5,0, 0,0, 0,0, _rk, 150);
			Kemik(150,340,0, -5,0, 0,0, 0,0, _rk, 150);
		}
		if ((_timer-1100) % 16 == 0)
		{
			Kemik(40,320, _sn, -5,0, 0,0, 90,0, 0, 150);
			Kemik(40,320,-_sn, -5,0, 0,0, 90,0, 0, 150);
		}
	}

	if (_timer == 1600) { x_say = 170; }
	if (_timer >= 1600) and (_timer <= 1700)
	{
		if ((_timer-1600) % 6 == 0)
		{
			x_say -= 3;
			Kemik(200,320,-x_say, -6,0, 0,0, 0,0, 0, 150);
			Kemik(200,320, x_say, -6,0, 0,0, 0,0, 0, 150);
		}
	}

	if (_timer == 1700)
	{
		Blaster(700,170,500,200, -60,300,50,1,2,30);
		Blaster(700,170,500,120,-120,300,50,1,2,30);
		Blaster(700,170,500,200, -90,300,50,1,2,30);
		Blaster(700,170,500,120, -90,300,50,1,2,30);
	}
	if (_timer == 1800)
	{
		Blaster(700,170,500,180,-90,300,50,1,2,30);
		Blaster(700,170,500,140,-90,300,50,1,2,30);
	}

	if (_timer == 1940) { x_say = 120; }
	if (_timer >= 2000) and (_timer <= 2100)
	{
		if ((_timer-2000) % 6 == 0)
		{
			x_say -= 0.5;
			Kemik(200,320,-x_say, -6,0, 0,0, 0,0, 0, 150);
			Kemik(200,320, x_say, -6,0, 0,0, 0,0, 0, 150);
		}
	}

	if (_timer >= 2200) and (_timer <= 2350)
	{
		battle_board.x -= 3*ATAK_HIZ;
		if (instance_exists(battle_soul)) { battle_soul.x += 7.5*ATAK_HIZ; }
	}
	if (_timer == 2350) { Carpma(); MaviRuh(DIR.RIGHT); }

	if (_timer == 2400) { kesme = 20; audio_play_sound(snd_noise,2,false); }
	if (_timer == 2440) { kesme = 20; audio_play_sound(snd_noise,2,false); UyariCizgi(250,0,true); }
	if (_timer == 2480) { kesme = 20; audio_play_sound(snd_noise,2,false); }

	if (_timer == 2500)
	{
		UyariSil();
		targ2 = Duvar(400,0,90);
		audio_play_sound(snd_noise,2,false);
	}

	if (_timer == 2520)
	{
		kesme = 24;
		audio_play_sound(snd_noise,2,false);
		DuvarSil(targ2);
		targ2 = [];
		battle_board.x = BATTLE_BOARD.X;
		DusmanKaySifirla();
	}

	if (_timer == 2540)
	{
		KirmiziRuh();
		Battle_SetBoardSizeCubic(75,75,75,75,0);
		if (instance_exists(battle_soul))
		{
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}
		SansAlphysGoster();
		Carpma();
	}

	if (_timer >= 2600) and (_timer <= 2800)
	{
		if ((_timer-2600) % 100 == 0)
		{
			Kemik(200, 100,80, 0,-3, 0,0, 90,0, 0, 150);
			Kemik(200, 100,90, 0,-3, 0,0, 90,0, 0, 150);
		}
		if ((_timer-2600) % 100 == 50)
		{
			Kemik(200,-100,80, 0,-3, 0,0, 90,0, 0, 150);
			Kemik(200,-100,90, 0,-3, 0,0, 90,0, 0, 150);
		}
	}

	if (_timer >= 2840) and (_timer <= 3040)
	{
		if ((_timer-2840) % 80 == 0)
		{
			Kemik(200, 80, 100, -3,0, 0,0, 0,0, 0, 150);
			Kemik(200,-80,-100,  3,0, 0,0, 0,0, 0, 150);
		}
	}

	if (_timer == 3100) { Carpma(); }
	if (_timer >= 3100) and (_timer <= 3600)
	{
		if ((_timer-3100) % 10 == 0) { SpiralBlaster(); }
	}

	if (_timer == 3700)
	{
		Camera_Shake(12,12,4,4);
		audio_play_sound(snd_impact,2,false);
		PapPoz(16,90);
	}

	if (_timer == 3800) { Bitir("* ..."); }
}
