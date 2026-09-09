// CYF ataklarinin birebir cevirisi. _timer degerleri = kaynak CYF karesi x2.

if (room != room_battle_1)
{
	if (_timer >= 2) { Battle_EndTurn(); }
	exit;
}

Cyf_OmurAdim();
if (kesme > 0) { kesme -= 1; }

// Tepki pozu suresi dolunca Papyrus notr ifadeye doner.
if (pap_t > 0)
{
	pap_t -= 1;
	if (pap_t == 0) and (instance_exists(battle_enemy_engage))
	{
		battle_enemy_engage.pap_head_image = 1;
	}
}

// ===========================================================================
// ATAK 1   (kaynak: txt.lua atkem == 1, satir 24-159)
// ===========================================================================
if (atak == 1)
{
	// "AND THEMES." repligi atak 1 intro'sunun SON kutusu; atak basladiginda
	// (dialog bitmis) yeni muzik giriyor. Eski faz-2 muzigi susuyor.
	if (_timer == 1)
	{
		if (audio_is_playing(global.p2_bgm)) { audio_stop_sound(global.p2_bgm); }
		global.p2_bgm = audio_play_sound(snd_rising_star, 10, true);
	}

	// CYF t1 -- blue.init()
	if (_timer == 2)
	{
		Cyf_MaviRuh(DIR.DOWN);
		PapPoz(16,60);
	}

	// CYF t40 -- 12 kemik, soldan saga 30'ar aralikla, asagidan yay cizerek
	if (_timer == 80)
	{
		audio_play_sound(snd_stab,2,false);
		var _x = -150;
		for (var _i = 0; _i < 12; _i++)
		{
			Cyf_Kemik(150,_x,-150, 2,6, 0,-0.15, 0,0, 0, 150);
			_x += 30;
		}
	}

	// CYF t75 -- ortadan yukselen yatay kemik cifti
	if (_timer == 150)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150,0,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Cyf_Kemik(150,0,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}

	// CYF t100 -- donen kol (b1/b2)
	if (_timer == 200)
	{
		kol1 = Kol(-9);   // Lua: SetPivot(-0.52,-0.1) -> merkezden ~9 px solda
		kol2 = Kol(0);    // Lua: ypivot=-0.1
	}
	if (_timer >= 200) and (_timer <= 220) { KolHareket(14); }   // CYF t100-110
	if (_timer == 220) { Carpma(); }                             // CYF t110
	if (_timer >= 250) and (_timer <= 440) { KolDon(); }         // CYF t125-220

	// CYF t175-230, 5 karede bir -- tepeden dusen yatay kemik
	if (_timer >= 350) and (_timer <= 460)
	{
		if ((_timer-350) % 10 == 0) { Cyf_Kemik(150,-50,80, 0,-6, 0,0.12, 90,0, 0, 150); }
	}

	// CYF t250 -- gb.New(320,600,380,380,0,100,50,2.25,2.25,20,true,true)
	if (_timer == 500) { Cyf_Blaster(320,600,380,380,0,100,50,2.25,2.25,20); }

	// CYF t300 -- kol kaldirilir
	if (_timer == 600) { KolSil(); }

	// CYF t350 -- soldan gelen kemik targi + saga kacan kemik cifti
	if (_timer == 700)
	{
		audio_play_sound(snd_stab,2,false);
		targ = Cyf_Targ(-215,-230,0);
		Cyf_Kemik(150,100,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Cyf_Kemik(150,100,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}

	// CYF t350-360 -- targ yukari cikar ve oyuncuyu saga itekler
	if (_timer >= 700) and (_timer <= 720)
	{
		Cyf_TargHareket(targ,0,14);
		if (instance_exists(battle_soul)) { battle_soul.x = T28Sag(); }
	}
	if (_timer == 720) { Carpma(); }                                    // CYF t360

	// CYF t400-473 -- targ yavasca saga suzulur
	if (_timer >= 800) and (_timer <= 946) { Cyf_TargHareket(targ,0.5,0); }

	// CYF t473/t483 -- kaynakta kamera 10000 px kaydirilip geri getiriliyor;
	// amaci oyuncunun yeniden konumlandirilmasini gizleyen ani bir kesme.
	// Kamerayi oynatmak yerine ayni sureyle ekran karartiliyor (bkz Draw_0).
	if (_timer == 946)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		Cyf_TargSil(targ);
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

	// CYF t500 -- uc blaster: tepeden, soldan, sagdan
	if (_timer == 1000)
	{
		Cyf_Blaster(320,600,320,380,  0,150,50,2,2.25,20);
		Cyf_Blaster(-50,100,120,100, 90,  0,50,2,2.25,20);
		Cyf_Blaster(650,100,520,100,-90,  0,50,2,2.25,20);
	}

	// CYF t525 -- iki yandan gelen targlar, ortada dar bir koridor birakiyor
	if (_timer == 1050)
	{
		targ1 = Cyf_Targ(-275,-230,0);
		targ2 = Cyf_Targ( 275,-230,0);
	}
	if (_timer >= 1150) and (_timer <= 1170)
	{
		Cyf_TargHareket(targ1,0,14);
		Cyf_TargHareket(targ2,0,14);
	}
	if (_timer == 1170) { Carpma(); }                                   // CYF t585

	// CYF t630 -- EndWave()
	if (_timer == 1260) { Bitir("* Papyrus is enjoying this."); }
}

// ===========================================================================
// ATAK 2   (kaynak: txt.lua atkem == 2, satir 160-434)
// ===========================================================================
if (atak == 2)
{
	// CYF t10 -- kutunun koselerinden giren dort egik uzun kemik
	if (_timer == 20)
	{
		bt1 = Cyf_Kemik(200,-150, 100, 0,0, 0,0,  30,0, 0, 0);
		bt2 = Cyf_Kemik(200, 150, 100, 0,0, 0,0, -30,0, 0, 0);
		bt3 = Cyf_Kemik(200,-110,-170, 0,0, 0,0, -20,0, 0, 0);
		bt4 = Cyf_Kemik(200, 110,-170, 0,0, 0,0,  20,0, 0, 0);
	}
	if (_timer >= 20) and (_timer <= 40)                          // CYF t10-20
	{
		Cyf_Hareket(bt1, 4.5,-8);
		Cyf_Hareket(bt2,-4.5,-8);
	}
	if (_timer == 40) { Carpma(); }                               // CYF t20

	if (_timer >= 100) and (_timer <= 120)                        // CYF t50-60
	{
		Cyf_Hareket(bt3, 5.1,13.5);
		Cyf_Hareket(bt4,-5.1,13.5);
	}
	if (_timer == 120) { Carpma(); }                              // CYF t60

	// CYF t75 -- blue.xinit()
	if (_timer == 150) { Cyf_MaviRuh(DIR.DOWN); PapPoz(16,60); }

	// CYF t100 -- iki yanda yavasca inen yatay kemik ciftleri
	if (_timer == 200)
	{
		Cyf_Kemik(150,-80,80, 0,-0.75, 0,0, 90,0, 0, 350);
		Cyf_Kemik(150,-80,90, 0,-0.75, 0,0, 90,0, 0, 350);
		Cyf_Kemik(150, 80,80, 0,-0.75, 0,0, 90,0, 0, 350);
		Cyf_Kemik(150, 80,90, 0,-0.75, 0,0, 90,0, 0, 350);
	}

	// CYF t100-300, 40 karede bir -- iki yandan iceri giren dikey kemikler
	if (_timer >= 200) and (_timer <= 600)
	{
		if ((_timer-200) % 80 == 0)
		{
			Cyf_Kemik(150,-80,-130,  2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150, 80,-130, -2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150,-80, 50,   2,0, 0,0, 0,0, 0, 220);
			Cyf_Kemik(150, 80, 50,  -2,0, 0,0, 0,0, 0, 220);
		}
	}

	// CYF t300 -- tepeden blaster
	if (_timer == 600) { Cyf_Blaster(320,600,320,400,0,90,50,1,2,30); }

	// CYF t400 -- iki yandan capraz giren yatay kemikler
	if (_timer == 800)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150, 150,-80, -2,2, 0,0, 90,0, 0, 220);
		Cyf_Kemik(150, 150,-90, -2,2, 0,0, 90,0, 0, 220);
		Cyf_Kemik(150,-150,-80,  2,2, 0,0, 90,0, 0, 220);
		Cyf_Kemik(150,-150,-90,  2,2, 0,0, 90,0, 0, 220);
	}

	// CYF t450-600, 40 karede bir -- ayni desen, bu sefer ciftli
	if (_timer >= 900) and (_timer <= 1200)
	{
		if ((_timer-900) % 80 == 0)
		{
			Cyf_Kemik(150,-80,-130,  2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150,-90,-130,  2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150, 80,-130, -2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150, 90,-130, -2,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(150,-80, 50,   2,0, 0,0, 0,0, 0, 220);
			Cyf_Kemik(150,-90, 50,   2,0, 0,0, 0,0, 0, 220);
			Cyf_Kemik(150, 80, 50,  -2,0, 0,0, 0,0, 0, 220);
			Cyf_Kemik(150, 90, 50,  -2,0, 0,0, 0,0, 0, 220);
		}
	}

	// CYF t625-675 -- kosedeki iki kemik yavasca doner
	if (_timer >= 1250) and (_timer <= 1350)
	{
		Cyf_Don(bt1, 1);
		Cyf_Don(bt2,-1);
	}

	// CYF t650 -- ortaya dogru yavaslayarak giren dort dikey kemik
	if (_timer == 1300)
	{
		Cyf_Kemik(150,-80,0,  6,0, -0.25,0, 0,0, 0, 150);
		Cyf_Kemik(150,-90,0,  6,0, -0.25,0, 0,0, 0, 150);
		Cyf_Kemik(150, 80,0, -6,0,  0.25,0, 0,0, 0, 150);
		Cyf_Kemik(150, 90,0, -6,0,  0.25,0, 0,0, 0, 150);
	}

	// CYF t700 -- asagidan yukselen uclu kemik grubu
	if (_timer == 1400)
	{
		bsdiz = [];
		array_push(bsdiz, Cyf_Kemik(200,  0,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Cyf_Kemik(200,-10,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Cyf_Kemik(200, 10,-180, 0,0, 0,0, 0,0, 0, 0));
	}
	if (_timer >= 1400) and (_timer <= 1420) { Cyf_TargHareket(bsdiz,0,14); }

	// CYF t710 -- carpma + ortadan sacilan bes kisa kemik
	if (_timer == 1420)
	{
		Carpma();
		for (var _i = 0; _i < 5; _i++)
		{
			Cyf_Kemik(40,0,55,
				irandom_range(-5,5), 3+irandom(3),
				0, -(0.2+random(0.2)),
				0, irandom_range(-3,3), 0, 220);
		}
	}

	// CYF t775+ -- uclu grup yavasca geri iner
	if (_timer >= 1550) { Cyf_TargHareket(bsdiz,0,-1); }

	// CYF t850-860 -- alttaki iki kemik donerek ortaya kayar
	if (_timer >= 1700) and (_timer <= 1720)
	{
		Cyf_Don(bt3,-4); Cyf_Don(bt4, 4);
		Cyf_Hareket(bt3, 3.3,0);
		Cyf_Hareket(bt4,-3.3,0);
	}
	if (_timer == 1720) { Carpma(); }                             // CYF t860

	// CYF t875+ -- dordu birden yavasca donup iceri kapaniyor
	if (_timer >= 1750)
	{
		Cyf_Don(bt1,-1); Cyf_Don(bt2, 1);
		Cyf_Don(bt3, 1); Cyf_Don(bt4,-1);
		Cyf_Hareket(bt1,-1,0); Cyf_Hareket(bt2, 1,0);
		Cyf_Hareket(bt3,-1,0); Cyf_Hareket(bt4, 1,0);
	}

	// CYF t950 -- EndWave()
	if (_timer == 1900) { Bitir("* He hasn't broken a sweat."); }
}

// ===========================================================================
// ATAK 4   (kaynak: txt.lua atkem == 4, satir 582-821)
// ===========================================================================
if (atak == 4)
{
	// Yildiz her karede pivot + aciya gore yeniden konumlaniyor.
	if (array_length(yildiz) > 0) { YildizAdim(); }

	// CYF t10 -- ekran bir an kararir, karanlikta 8 kemiklik yildiz kurulur
	if (_timer == 20)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		YildizKur();
		YildizAdim();
		PapPoz(16,60);
	}
	if (_timer == 40) { audio_play_sound(snd_noise,2,false); }   // CYF t20

	// CYF t20-650 -- yildiz doner (kare basina 3 derece)
	if (_timer >= 40) and (_timer <= 1300) { yildiz_aci += 3*CYF_HIZ; }

	// CYF t50 -- iki yandan mavi/turuncu kemik cifti
	if (_timer == 100)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150, 80,0, -6,0,  0.15,0, 0,0, 1, 200);
		Cyf_Kemik(150,-80,0,  6,0, -0.15,0, 0,0, 2, 200);
	}

	// CYF t75 / t100 -- asagidan ve yukaridan yatay kemik ciftleri
	if (_timer == 150)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150,0,-80, 0,6, 0,-0.2, 90,0, 0, 150);
		Cyf_Kemik(150,0,-90, 0,6, 0,-0.2, 90,0, 0, 150);
	}
	if (_timer == 200)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150,0,80, 0,-6, 0,0.2, 90,0, 0, 150);
		Cyf_Kemik(150,0,90, 0,-6, 0,0.2, 90,0, 0, 150);
	}

	// CYF t125 -- tepeden inen uclu dikey grup
	if (_timer == 250)
	{
		sb = [];
		array_push(sb, Cyf_Kemik(200, 50,180, 0,0, 0,0, 0,0, 0, 0));
		array_push(sb, Cyf_Kemik(200,-50,180, 0,0, 0,0, 0,0, 0, 0));
		array_push(sb, Cyf_Kemik(200,  0,180, 0,0, 0,0, 0,0, 0, 0));
	}
	if (_timer >= 250) and (_timer <= 300) { Cyf_TargHareket(sb,0,-3.45); }
	if (_timer >  300) and (_timer <= 320) { Cyf_TargHareket(sb,0,-6);    }
	if (_timer == 320) { Carpma(); }                              // CYF t160

	// CYF t175 -- sagdan gelen uclu yatay grup
	if (_timer == 350)
	{
		sb2 = [];
		array_push(sb2, Cyf_Kemik(200,180, 50, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Cyf_Kemik(200,180,-50, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Cyf_Kemik(200,180,  0, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 350) and (_timer <= 400) { Cyf_TargHareket(sb2,-3.45,0); }
	if (_timer >  400) and (_timer <= 420) { Cyf_TargHareket(sb2,-6,0);    }
	if (_timer == 420) { Carpma(); }                              // CYF t210

	// CYF t225-400, 40 karede bir -- dort yonden rastgele renkli kemikler
	if (_timer >= 450) and (_timer <= 800)
	{
		if ((_timer-450) % 80 == 0)
		{
			var _r1 = irandom_range(1,2);
			var _r2 = irandom_range(1,2);
			var _r3 = irandom_range(1,2);
			var _r4 = irandom_range(1,2);
			Cyf_Kemik(200,  80,-100, -2,0, 0,0,  0,0, _r1, 200);
			Cyf_Kemik(200, -80, 100,  2,0, 0,0,  0,0, _r2, 200);
			Cyf_Kemik(200,-100,  80, 0,-2, 0,0, 90,0, _r3, 200);
			Cyf_Kemik(200, 100, -80, 0, 2, 0,0, 90,0, _r4, 200);
		}
	}

	// CYF t425 -- yildiz turuncuya doner (hareket etmeden gecilemez)
	if (_timer == 850) { audio_play_sound(snd_ding,2,false); YildizRenk(2); }

	// CYF t450-500 -- yildiz disari acilir (xpivot 6 -> -7)
	if (_timer >= 900) and (_timer <= 1000) { yildiz_px += (-7-yildiz_px)/60; }

	// CYF t550-600 -- yildiz merkeze toplanip uzunlamasina kayar
	if (_timer >= 1100) and (_timer <= 1200)
	{
		yildiz_px += (0-yildiz_px)/60;
		yildiz_py += (1-yildiz_py)/60;
	}

	// CYF t650 -- yildiz beyaza doner, onceki gruplar zararsizlasir
	if (_timer == 1300)
	{
		audio_play_sound(snd_ding,2,false);
		YildizRenk(0);
		DiziSolgun(sb);
		DiziSolgun(sb2);
	}
	if (_timer >= 1300) { yildiz_aci += 2*CYF_HIZ; }              // CYF t650+

	// CYF t800+ -- yildiz yavasca genisleyerek dagilir
	if (_timer >= 1600)
	{
		yildiz_px += 0.1*CYF_HIZ;
		yildiz_py += 0.01*CYF_HIZ;
	}

	// CYF t920 -- EndWave()
	if (_timer == 1840) { Bitir("* The room is still spinning."); }
}

// ===========================================================================
// ATAK 7   (kaynak: txt.lua atkem == 7, satir 1216-1468)
//
// Yercekimi asagi -> yukari -> sola doner; her donusun ardindan o kenardan
// bir kemik targi iceri suzulur. Kaynakta donusleri Sans'in slam animasyonu
// yapiyor; burada Papyrus tepki veriyor.
// ===========================================================================
if (atak == 7)
{
	// CYF t10 -- iki yandan yukselen yatay kemikler + mavi ruh + ilk slam
	if (_timer == 20)
	{
		Cyf_Kemik(150,-80,100, 0,-3, 0,0, 90,0, 0, 200);
		Cyf_Kemik(150,-80,110, 0,-3, 0,0, 90,0, 0, 200);
		Cyf_Kemik(150, 80,100, 0,-3, 0,0, 90,0, 0, 200);
		Cyf_Kemik(150, 80,110, 0,-3, 0,0, 90,0, 0, 200);
		Cyf_MaviRuh(DIR.DOWN);
		SlamKur(DIR.DOWN);
		PapPoz(16,60);
	}
	if (_timer >= 20) and (_timer <= 40) { SlamAdim(); }          // CYF t10-20

	// CYF t25 -- asagidan gelen targ, duracagi yer once cizgiyle isaretleniyor
	if (_timer == 50)
	{
		UyariCizgi(0,-30,false);
		targ = Cyf_Targ(0,-230,0);
	}
	if (_timer == 100) { audio_play_sound(snd_stab,2,false); }    // CYF t50
	if (_timer >= 100) and (_timer <= 120) { Cyf_TargHareket(targ,0,4.5); }
	if (_timer == 120) { UyariSil(); }                            // CYF t60

	// CYF t75 -- yercekimi yukari, tepeden targ
	if (_timer == 150)
	{
		UyariCizgi(0,30,false);
		targ1 = Cyf_Targ(0,230,0);
		SlamKur(DIR.UP);
	}
	if (_timer >= 150) and (_timer <= 170) { SlamAdim(); }        // CYF t75-85
	if (_timer == 200) { audio_play_sound(snd_stab,2,false); }    // CYF t100
	if (_timer >= 200) and (_timer <= 220) { Cyf_TargHareket(targ1,0,-4.5); }
	if (_timer == 220) { UyariSil(); }                            // CYF t110

	// CYF t125/t130 -- yercekimi sola, sagdan targ
	if (_timer == 250) { SlamKur(DIR.LEFT); }
	if (_timer >= 250) and (_timer <= 270) { SlamAdim(); }        // CYF t125-135
	if (_timer == 260)
	{
		UyariCizgi(-30,0,true);
		targ2 = Cyf_Targ(230,0,90);
	}

	// CYF t150 -- ortaya dogru yavaslayarak giren, donen kemik cifti
	if (_timer == 300)
	{
		Cyf_Kemik(150,-80,0, 6,0, -0.25,0, 0, 0.4, 0, 200);
		Cyf_Kemik(150,-80,0, 6,0, -0.25,0, 0,-0.4, 0, 200);
	}

	// CYF t175 -- sagdan donerek gelen iki kemik
	if (_timer == 350)
	{
		Cyf_Kemik(150,80, 50, -3,0, 0,0, 0, 1, 0, 200);
		Cyf_Kemik(150,80,-50, -3,0, 0,0, 0,-1, 0, 200);
	}

	if (_timer == 460) { audio_play_sound(snd_stab,2,false); }    // CYF t230
	if (_timer >= 460) and (_timer <= 480) { Cyf_TargHareket(targ2,-10,0); }
	if (_timer == 480) { UyariSil(); }                            // CYF t240

	// CYF t255 -- mavi ve turuncu kemik cifti
	if (_timer == 510)
	{
		Cyf_Kemik(150,0, 80, 0,-6, 0, 0.12, 90,0, 1, 200);
		Cyf_Kemik(150,0,-80, 0, 6, 0,-0.12, 90,0, 2, 200);
	}

	// CYF t280 -- soldan hizla giren uclu grup
	if (_timer == 560)
	{
		sb = [];
		array_push(sb, Cyf_Kemik(150,-170,  0, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb, Cyf_Kemik(150,-170, 10, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb, Cyf_Kemik(150,-170,-10, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 560) and (_timer <= 570) { Cyf_TargHareket(sb,11,0); }
	if (_timer == 570) { Carpma(); }                              // CYF t285
	if (_timer >= 570) and (_timer <= 590) { Cyf_TargHareket(targ2,10,0); }

	// CYF t305 -- kirmizi ruha donus + sagdan dortlu grup
	if (_timer == 610)
	{
		Cyf_KirmiziRuh();
		sb2 = [];
		array_push(sb2, Cyf_Kemik(150,160, 20, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Cyf_Kemik(150,160, 30, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Cyf_Kemik(150,160,-20, 0,0, 0,0, 90,0, 0, 0));
		array_push(sb2, Cyf_Kemik(150,160,-30, 0,0, 0,0, 90,0, 0, 0));
	}
	if (_timer >= 610) and (_timer <= 640) { Cyf_TargHareket(sb2,-10,0); }
	if (_timer == 640) { Carpma(); }                              // CYF t320

	// CYF t330 -- sagdan yukselen kemik cifti
	if (_timer == 660)
	{
		audio_play_sound(snd_stab,2,false);
		Cyf_Kemik(150,70,80, 0,-3, 0,0, 90,0, 0, 200);
		Cyf_Kemik(150,70,90, 0,-3, 0,0, 90,0, 0, 200);
	}

	// CYF t350 -- asagidan yukselen uclu dikey grup
	if (_timer == 700)
	{
		bsdiz = [];
		array_push(bsdiz, Cyf_Kemik(200,-25,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Cyf_Kemik(200,-15,-180, 0,0, 0,0, 0,0, 0, 0));
		array_push(bsdiz, Cyf_Kemik(200, -5,-180, 0,0, 0,0, 0,0, 0, 0));
		sp_hiz = 6;
	}
	if (_timer >= 700) and (_timer <= 720) { Cyf_TargHareket(bsdiz,0,8.7); }
	if (_timer == 720) { Carpma(); }                              // CYF t360

	// CYF t375 -- grup turuncuya doner
	if (_timer == 750)
	{
		audio_play_sound(snd_ding,2,false);
		Cyf_TargRenk(bsdiz,2);
	}

	// CYF t400+ -- grup saga suzulup yavasliyor.
	// Kaynakta sp dongunun ICINDE azaliyor, yani her kemik farkli hizda
	// gidiyor ve uclu grup yelpaze gibi aciliyor. Bilerek aynen korundu.
	if (_timer >= 800) and (ara == 0)
	{
		for (var _i = 0; _i < array_length(bsdiz); _i++)
		{
			sp_hiz -= 0.08*CYF_HIZ;
			Cyf_Hareket(bsdiz[_i],sp_hiz,0);
		}
	}

	// CYF t480 -- kaynakta burada EndWave() var. EASY'de atak bitince
	// dogrudan tur kapanmiyor: once Papyrus'un "mola" ara sahnesi oynuyor.
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

	// ------------------------------------------------------------ ARA SAHNE
	if (ara == 1)
	{
		ara_t += 1;

		// diyalog kutusu (tek string, kutular {pause}{clear} ile ayrili)
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

		// diyalog bitince mola basliyor
		if (ara_t > 40) and (!instance_exists(battle_dialog_enemy))
		{
			ara = 2;
			ara_t = 0;

			// oyunun muzigi susuyor: "muzigi" artik Papyrus caliyor
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

		// duman parcaciklari (battle_turn_18 ile ayni ritim)
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

		// Tarayici penceresi ancak sayfa yuklenip basligi olusunca bulunabiliyor,
		// o yuzden ilk 10 saniye boyunca yarim saniyede bir tekrar deneniyor.
		if (!tarayici_kondu) and (ara_t < 600) and (ara_t % 30 == 0)
		{
			tarayici_kondu = Win_Split_TarayiciyiSolaAl(ARA_TARAYICI);
		}

		// Sahne ATLANAMAZ: cikis yok, sure dolmadan bitmiyor.
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

// ===========================================================================
// ATAK 10 -- FINAL   (kaynak: txt.lua atkem == 10, satir 1890-2400)
//
// Uc bolum:
//   A (2-670)     150x150 kutu, mavi ruh, slam + kemik targlari
//   B (700-2350)  kutu 650x130'a acilir, oyuncu sol kenara kilitlenir ve
//                 sagdan gelen kemikleri dikey hareketle geciyor (yan kaydirma)
//   C (2400-3800) kutu geri kapanir, dusmanin etrafinda kemik halkasi doner,
//                 donen spiral blasterlarla biter
// ===========================================================================
if (atak == 10)
{
	// Final: "...if I just stopped being easy?" -- artik ataklar 4 vuruyor.
	if (_timer == 1) { global.easy_dmg4 = true; }

	// ---------------------------------------------------------------- BOLUM A
	if (_timer == 2) { Cyf_MaviRuh(DIR.DOWN); PapPoz(16,60); }     // CYF t1
	if (_timer == 20) { SlamKur(DIR.DOWN); }                       // CYF t10
	if (_timer >= 20) and (_timer <= 40) { SlamAdim(); }

	if (_timer == 40)                                              // CYF t20
	{
		Cyf_Kemik(150,80,-80, -2,0, 0,0, 0,0, 0, 120);
		Cyf_Kemik(150,90,-80, -2,0, 0,0, 0,0, 0, 120);
	}

	// CYF t35 -- soldan gelen dikey targ
	if (_timer == 70)
	{
		UyariCizgi(30,0,true);
		targ = Cyf_Targ(-230,0,90);
	}
	if (_timer == 150) { audio_play_sound(snd_stab,2,false); }     // CYF t75
	if (_timer >= 150) and (_timer <= 170) { Cyf_TargHareket(targ,10,0); }
	if (_timer == 170)                                             // CYF t85
	{
		UyariSil();
		Cyf_Kemik(150,-80,  50, 2,0, 0,0, 0,0, 0, 120);
		Cyf_Kemik(150,-80,-120, 2,0, 0,0, 0,0, 0, 120);
		Cyf_Kemik(150,-90,  50, 2,0, 0,0, 0,0, 0, 120);
		Cyf_Kemik(150,-90,-120, 2,0, 0,0, 0,0, 0, 120);
	}

	// CYF t100 -- kutuyu dolasan iki uzun kemik
	if (_timer == 200)
	{
		bt1 = Cyf_Kemik(200,100,80, 0,0, 0,0, 90,0, 0, 0);
		bt2 = Cyf_Kemik(200,100,90, 0,0, 0,0, 90,0, 0, 0);
		le_hiz = 6;
	}
	if (_timer >= 200) and (_timer <= 310) { Cyf_TargHareket(targ,-2,0); }
	if (_timer >= 280) and (_timer <= 300)                         // CYF t140-150
	{
		Cyf_Hareket(bt1,0,-13.6); Cyf_Hareket(bt2,0,-13.6);
	}
	if (_timer == 300) { Carpma(); }                               // CYF t150
	if (_timer >= 350) and (_timer <= 370)                         // CYF t175-185
	{
		Cyf_Hareket(bt1,-6.8,0); Cyf_Hareket(bt2,-6.8,0);
	}
	if (_timer == 370) { Carpma(); }                               // CYF t185
	if (_timer >= 450) and (_timer <= 600)                         // CYF t225-300
	{
		Cyf_Hareket(bt1,0,le_hiz); Cyf_Hareket(bt2,0,le_hiz);
		le_hiz -= 0.2*CYF_HIZ;
		if (_timer <= 500) { Cyf_Hareket(bt1,2,0); Cyf_Hareket(bt2,2,0); }
	}
	if (_timer >= 500) and (_timer <= 520)                         // CYF t250-260
	{
		Cyf_Hareket(bt1,-4.8,0); Cyf_Hareket(bt2,-4.8,0);
	}
	if (_timer == 520) { Carpma(); }                               // CYF t260
	if (_timer == 550)                                             // CYF t275
	{
		if (instance_exists(bt1)) { bt1._color = 2; }
		if (instance_exists(bt2)) { bt2._color = 2; }
		audio_play_sound(snd_ding,2,false);
	}

	// CYF t300 -- asagidan yukselen targ
	if (_timer == 600)
	{
		UyariCizgi(0,-11,false);
		targ1 = Cyf_Targ(0,-230,0);
		if (instance_exists(bt1)) { instance_destroy(bt1); }
		if (instance_exists(bt2)) { instance_destroy(bt2); }
	}
	if (_timer == 650) { audio_play_sound(snd_stab,2,false); }     // CYF t325
	if (_timer >= 650) and (_timer <= 670) { Cyf_TargHareket(targ1,0,6.1); }
	if (_timer == 670) { UyariSil(); }                             // CYF t335

	// ---------------------------------------------------------------- BOLUM B
	// CYF t350 -- ekran kararir, kutu 650x130'a acilir
	if (_timer == 700)
	{
		kesme = 20;
		audio_play_sound(snd_noise,2,false);
		Cyf_TargSil(targ);  Cyf_TargSil(targ1);
		targ = []; targ1 = [];
		with (battle_regularbone) { instance_destroy(); }
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,325,325,0);
	}

	// CYF t360 -- KIRMIZI ruh (serbest hareket) ama MAVI sprite ile: mavi ruh
	// yercekimi olmadigi icin sag duvara yapismiyor, oyuncu genis kutuda
	// serbest dolasip sagdan gelenleri geciyor. Faz 2 t20'de de ayni numara var.
	// Sans ve Alphys bu bolumde gizli; sadece Papyrus sola kayiyor.
	if (_timer == 720)
	{
		Cyf_KirmiziRuh();
		audio_play_sound(snd_noise,2,false);
		l_faz = 0;
		SansAlphysGizle();
		if (instance_exists(battle_soul))
		{
			battle_soul.sprite_index = spr_battle_soul_blue;
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}
	}

	// CYF t350-1100 -- dusman (Papyrus) surekli sola kayiyor. Ruhun x'i artik
	// kilitli DEGIL: mavi gravite onu sag duvarda tutuyor, oyuncu ziplayabiliyor.
	if (_timer >= 700) and (_timer <= 2200)
	{
		DusmanKay(-5);
	}

	// CYF t350-500 -- sagdan capraz gelen kemik ciftleri
	if (_timer >= 700) and (_timer <= 1000)
	{
		if ((_timer-700) % 100 == 0)
		{
			Cyf_Kemik(200,400, 75, -5,0, 0,0, -45,0, 0, 220);
			Cyf_Kemik(200,415, 75, -5,0, 0,0, -45,0, 0, 220);
		}
		if ((_timer-700) % 100 == 50)
		{
			Cyf_Kemik(200,400,-75, -5,0, 0,0, 45,0, 0, 220);
			Cyf_Kemik(200,415,-75, -5,0, 0,0, 45,0, 0, 220);
		}
	}

	// CYF t550-750 -- ortada renkli blok, ustunde/altinda sinus cizen kemikler
	if (_timer >= 1100) and (_timer <= 1500)
	{
		l_faz += 0.1*CYF_HIZ;
		var _sn = 60*sin(l_faz);
		if ((_timer-1100) % 80 == 0)
		{
			var _rk = irandom_range(1,2);
			Cyf_Kemik(150,320,0, -5,0, 0,0, 0,0, _rk, 150);
			Cyf_Kemik(150,330,0, -5,0, 0,0, 0,0, _rk, 150);
			Cyf_Kemik(150,340,0, -5,0, 0,0, 0,0, _rk, 150);
		}
		if ((_timer-1100) % 16 == 0)
		{
			Cyf_Kemik(40,320, _sn, -5,0, 0,0, 90,0, 0, 150);
			Cyf_Kemik(40,320,-_sn, -5,0, 0,0, 90,0, 0, 150);
		}
	}

	// CYF t800-850 -- hizla daralan koridor
	if (_timer == 1600) { x_say = 170; }
	if (_timer >= 1600) and (_timer <= 1700)
	{
		if ((_timer-1600) % 6 == 0)
		{
			x_say -= 3;
			Cyf_Kemik(200,320,-x_say, -6,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(200,320, x_say, -6,0, 0,0, 0,0, 0, 150);
		}
	}

	// CYF t850 / t900 -- sagdan ates eden blasterlar
	if (_timer == 1700)
	{
		Cyf_Blaster(700,170,500,200, -60,300,50,1,2,30);
		Cyf_Blaster(700,170,500,120,-120,300,50,1,2,30);
		Cyf_Blaster(700,170,500,200, -90,300,50,1,2,30);
		Cyf_Blaster(700,170,500,120, -90,300,50,1,2,30);
	}
	if (_timer == 1800)
	{
		Cyf_Blaster(700,170,500,180,-90,300,50,1,2,30);
		Cyf_Blaster(700,170,500,140,-90,300,50,1,2,30);
	}

	// CYF t970-1050 -- ikinci, daha dar koridor
	if (_timer == 1940) { x_say = 120; }
	if (_timer >= 2000) and (_timer <= 2100)
	{
		if ((_timer-2000) % 6 == 0)
		{
			x_say -= 0.5;
			Cyf_Kemik(200,320,-x_say, -6,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(200,320, x_say, -6,0, 0,0, 0,0, 0, 150);
		}
	}

	// CYF t1100-1175 -- kutu sola kayarken oyuncu saga suruklenir
	if (_timer >= 2200) and (_timer <= 2350)
	{
		battle_board.x -= 3*CYF_HIZ;
		if (instance_exists(battle_soul)) { battle_soul.x += 7.5*CYF_HIZ; }
	}
	if (_timer == 2350) { Carpma(); Cyf_MaviRuh(DIR.RIGHT); }      // CYF t1175

	// ---------------------------------------------------------------- BOLUM C
	// CYF t1200-1240 -- ekran birkac kez kararip aciliyor
	if (_timer == 2400) { kesme = 20; audio_play_sound(snd_noise,2,false); }
	if (_timer == 2440) { kesme = 20; audio_play_sound(snd_noise,2,false); UyariCizgi(250,0,true); }
	if (_timer == 2480) { kesme = 20; audio_play_sound(snd_noise,2,false); }

	// CYF t1250 -- sagdan son targ
	if (_timer == 2500)
	{
		UyariSil();
		targ2 = Cyf_Targ(400,0,90);
		audio_play_sound(snd_noise,2,false);
	}

	// CYF t1260 -- kutu merkeze doner
	if (_timer == 2520)
	{
		kesme = 24;
		audio_play_sound(snd_noise,2,false);
		Cyf_TargSil(targ2);
		targ2 = [];
		battle_board.x = BATTLE_BOARD.X;
		DusmanKaySifirla();
	}

	// CYF t1270 -- kutu 150x150, kirmizi ruh, Sans/Alphys geri geliyor.
	// (Eskiden Papyrus'un etrafinda kemik halkasi vardi; kaldirildi.)
	if (_timer == 2540)
	{
		Cyf_KirmiziRuh();
		Battle_SetBoardSizeCubic(75,75,75,75,0);
		if (instance_exists(battle_soul))
		{
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}
		SansAlphysGoster();
		Carpma();
	}

	// CYF t1300-1400 -- iki yandan yukselen yatay kemik ciftleri
	if (_timer >= 2600) and (_timer <= 2800)
	{
		if ((_timer-2600) % 100 == 0)
		{
			Cyf_Kemik(200, 100,80, 0,-3, 0,0, 90,0, 0, 150);
			Cyf_Kemik(200, 100,90, 0,-3, 0,0, 90,0, 0, 150);
		}
		if ((_timer-2600) % 100 == 50)
		{
			Cyf_Kemik(200,-100,80, 0,-3, 0,0, 90,0, 0, 150);
			Cyf_Kemik(200,-100,90, 0,-3, 0,0, 90,0, 0, 150);
		}
	}

	// CYF t1420-1520 -- capraz gecen dikey kemikler
	if (_timer >= 2840) and (_timer <= 3040)
	{
		if ((_timer-2840) % 80 == 0)
		{
			Cyf_Kemik(200, 80, 100, -3,0, 0,0, 0,0, 0, 150);
			Cyf_Kemik(200,-80,-100,  3,0, 0,0, 0,0, 0, 150);
		}
	}

	// CYF t1550-1800 -- donen spiral blasterlar (95 derecelik adimlarla)
	if (_timer == 3100) { Carpma(); }
	if (_timer >= 3100) and (_timer <= 3600)
	{
		if ((_timer-3100) % 10 == 0) { SpiralBlaster(); }
	}

	// CYF t1850 -- bitis sarsintisi
	if (_timer == 3700)
	{
		Camera_Shake(12,12,4,4);
		audio_play_sound(snd_impact,2,false);
		PapPoz(16,90);
	}

	// CYF t1900 -- fazin sonu
	if (_timer == 3800) { Bitir("* ..."); }
}
