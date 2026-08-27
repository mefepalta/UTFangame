//==========================================================================
// FINAL PHASE (P25) -- yardimcilar
//==========================================================================
// "Discord Sans Rewrite" belgesinin Final Phase bolumu. Faz 2'nin son
// atagi bittikten sonra Sans artik bloklamiyor, gercekten hasar aliyor;
// yedi tur suren yavas ve kolay bir dovus, ardindan olum sahnesi.
//
// SAHNE DURUMU: global.p25phase
//   0 = kapali
//   1 = faz 2 bitti, Sans hasar alabilir (hala faz 2 sprite'i sahnede;
//       oyuncunun ilk vurusu bu haldeyken yeniyor)
//   2 = final phase turlari suruyor (yaralanmis p25 Sans'i sahnede)
//   3 = olumcul vurus SAHTE ISKALANDI -- "There's no way I'm letting you-"
//   4 = replik bitti, Sans'in kactigi yerde ikinci bicak darbesi oynuyor
//   5 = darbe indi, olum konusmasi bekliyor
//   6 = olum konusmasi bitti (oyuncu CHECK / MERCY / son FIGHT yapabilir)
//   7 = son vurus yapildi, veda konusmasi bekliyor
//   8 = veda bitti, Sans ekrandan cikiyor
//   9 = cikti, ekran yavasca karariyor -> room_story_final
//
// Gecisleri yapan yerler:
//   0->1  battle_turn_20/Step_0   (kapanis diyalogu bitince)
//   1->2  battle_turn_21/Other_10 (P25Sahneye)
//   2->3  battle_menu_fight_knife/Step_0 (olumcul vurus sahte iskalanir)
//   3->4, 4->5, 5->6, 7->8   P25Sahne (konusma / darbe bitince)
//   6->7                     battle_enemy_engage/Other_15 (son FIGHT)
//   8->9  o_p25_battle/Step_0 (ekrandan cikinca; kararma ve oda gecisi de orada)
//==========================================================================

///Faz 2'nin son atagi bitti: Sans artik gercekten hasar aliyor.
///battle_turn_20 kapanis diyalogunu bitirdigi anda cagriliyor.
///Sahnedeki gorunum HENUZ degismiyor -- oyuncu once faz 2 Sans'ina
///vuruyor, yaralanmis hali ondan sonraki turda geliyor.
function P25Baslat()
{
	if (global.p25phase != 0) { return false; }
	global.p25phase = 1;
	global.p25_dlg = false;
	global.p25_iska = false;		/// sahte iskalama kullanildi mi

	// Belgedeki degerler: "Sans: 18 ATK 5 DEF". Motorda kullanilan taraf DEF.
	Battle_SetEnemyDEF(1,5);

	// Cani: bu bolumde artik gercekten oluyor. Yedi turluk bir dovus olsun
	// diye ayarlandi; oyuncunun tam isabetli vurusu (ATK-DEF)*2.2 kadar
	// hasar veriyor. Sekizinci vurus olumcul olur ve orada sahte iskalama
	// devreye girer.
	if (instance_exists(battle_enemy_engage))
	{
		var _can = max(60,round((Player_GetAtkTotal()-5)*2.2*7));
		battle_enemy_engage._hp = _can;
		battle_enemy_engage._hp_max = _can;
	}

	return true;
}

///Yaralanmis Sans sahneye giriyor. Final phase turlarinin hazirlik
///olayindan cagriliyor; birden fazla cagrilmasi sorun degil.
function P25Sahneye()
{
	if (global.p25phase < 1) { return false; }
	if (global.p25phase == 1)
	{
		global.p25phase = 2;

		// Final phase muzigi tam burada basliyor: Sans'in "Th-... that's
		// right..." repligiyle ayni an. Faz 1'in parcasi audio_play_sound
		// ile, faz 2'ninki BGM slotu 5 ile caliyor; ikisi de susturuluyor.
		audio_stop_sound(snd_chevalier);
		BGM_Stop(5);
		// Onceki denemeden kalan kisilma varsa geri aciliyor.
		audio_sound_gain(snd_surrender,1,0);
		audio_play_sound(snd_surrender,1,true);
	}

	if (!instance_exists(o_p25_battle))
	{
		instance_create_depth(0,0,DEPTH_BATTLE.ENEMY,o_p25_battle);
	}

	// Faz 2'nin blok sprite'i bu fazda hic kullanilmiyor (bkz.
	// o_p25_battle/Step_0'daki aciklama).
	with (o_sans_blockp2) { instance_destroy(); }
	return true;
}

///Olum sahnesinin metinleri. Belgedeki repliklerin aynisi; satirlar
///balonun 197 px'lik metin alanina sigacak sekilde bolundu.
function P25Metin()
{
	switch (global.p25phase)
	{
		case 3:
			// Sahte iskalamanin hemen ardindan
			return "{speaker 0}{font 3}{voice 3}There's no way I'm&letting you-";
		case 5:
			return "{speaker 0}{font 3}{voice 3}...{pause}{clear}...{pause}{clear}Heh...{pause}{clear}Mweh heh heh.{pause}{clear}Well... you got&me...!{pause}{clear}At least now...&I can rest easy...{pause}{clear}...knowing... I tried&to make a difference.";
		default:
			return "{speaker 0}{font 3}{voice 3}...{pause}{clear}...{pause}{clear}Guess that's that.{pause}{clear}Hey... Papyrus...{pause}{clear}Let's go to Muffet's.";
	}
}

///Sahneyi surer. Final phase turlarinin Step_0'indan HER KARE cagriliyor.
///Donus degeri true ise turun kendini bitirmesi gerekiyor.
///
///Sahne neden turun icinde? Motorda diyalog balonu tur nesnesinin omru
///boyunca yasiyor (bkz. battle_turn_20); menu durumunda acilan bir balon
///bir sonraki duruma gecince ortada kaliyordu.
function P25Sahne()
{
	// 8 ve sonrasi = Sans ekrandan cikiyor, ardindan ekran karariyor. Tur
	// bu sure boyunca AYAKTA kaliyor, yoksa menu geri acilir ve oyuncu
	// yuruyup giden Sans'a vurmayi denerdi. Oda degisimiyle birlikte
	// zaten her sey kapaniyor (bkz. o_p25_battle/Step_0).
	if (global.p25phase >= 8) { return false; }

	// 4 = ikinci bicak darbesi. Sirali oynuyor, hepsi ayni anda degil:
	//   0   -> bicak darbesi basliyor (3->4 gecisinde yaratildi)
	//   42  -> darbe bitiyor: govde yarali sprite'a geciyor, hasar sayisi
	//          ve can bari beliriyor, vurus sesi caliyor
	//   117 -> bar okundu, olum konusmasi basliyor
	// 42 = slash sprite'i 7 kare x 10 fps, yani 0.7 sn (oyun 60 fps).
	// Eskiden can bari ve govde degisimi darbeyle AYNI karede geliyordu
	// ve vurus daha inmeden sonucu gorunuyordu.
	if (global.p25phase == 4)
	{
		global.p25_t += 1;

		if (global.p25_t == 42) and (instance_exists(battle_enemy_engage))
		{
			var _hp0 = battle_enemy_engage._hp;
			var _hpm = battle_enemy_engage._hp_max;
			var _bx = battle_enemy_engage.p2_draw_x;

			// Hasar sayisi + can barinin sifira inisi: dumduz bir slash
			// yerine gercek bir bitirici vurus gibi okunuyor.
			var _dmg = instance_create_depth(_bx,battle_enemy_engage.y,0,battle_damage);
			_dmg.damage = _hp0;
			_dmg.bar_hp_max = _hpm;
			_dmg.bar_hp_original = _hp0;
			_dmg.bar_hp_target = 0;
			audio_play_sound(snd_damage,0,false);

			// Darbe indi: govde artik yarali sprite.
			if (instance_exists(o_p25_battle)) { o_p25_battle.govde_yarali = true; }
			Camera_Shake(4,4,2,2);
		}

		if (global.p25_t >= 117)
		{
			global.p25phase = 5;
			// Can burada sifirlaniyor: ilk olumcul vurus sahte iskalandigi
			// icin hasar hic islenmedi. Sifirlanmazsa olum konusmasindan
			// sonraki FIGHT, Other_15'teki "can <= 0" dalini tetiklemez ve
			// veda sahnesi hic acilmazdi.
			if (instance_exists(battle_enemy_engage)) { battle_enemy_engage._hp = 0; }
		}
		return false;
	}

	// Konusma sirasi olan durumlar. Digerlerinde tur atak yapmadan kapaniyor.
	if (global.p25phase != 3) and (global.p25phase != 5) and (global.p25phase != 7)
	{
		return true;
	}

	if (!global.p25_dlg)
	{
		var _d = instance_create_depth(0,0,0,battle_dialog_enemy);
		_d.text = P25Metin();
		global.p25_dlg = true;

		// Yenildikten sonraki ifade: gozler kapali.
		if (global.p25phase >= 5) and (instance_exists(o_p25_battle))
		{
			o_p25_battle.kafa = 5;
		}
		return false;
	}

	// Balon durdukca bekliyoruz.
	if (instance_exists(battle_dialog_enemy)) { return false; }

	global.p25_dlg = false;
	switch (global.p25phase)
	{
		case 3:
			// "There's no way I'm letting you-" bitti: Sans'in KACTIGI
			// yerde ikinci bicak darbesi. Bu darbe oyuncunun bir vurusu
			// degil, sahnenin parcasi -- belgede de oyle: iskaladiktan
			// hemen sonra ikinci vurus geliyor.
			global.p25phase = 4;
			global.p25_t = 0;

			// go_dodge "miss" kalirsa battle_menu_fight_anim_knife Sans'i
			// bir kez daha kaydirirdi; bu darbe artik isabet ediyor.
			global.go_dodge = "damage";
			// SADECE bicak darbesi. Can bari, yarali govde ve konusma
			// darbe BITTIKTEN sonra geliyor (yukaridaki 4. asama).
			if (instance_exists(battle_enemy_engage))
			{
				instance_create_depth(battle_enemy_engage.p2_draw_x,
					battle_enemy_engage.y-100,0,battle_menu_fight_anim_knife);
			}
			return false;

		case 5:
			// Olum konusmasi bitti: oyuncu simdi son vurusu yapabilir,
			// CHECK'leyebilir ya da MERCY deneyebilir.
			global.p25phase = 6;
			Battle_SetMenuDialog("* It's over.");
			break;

		case 7:
			// Veda bitti: Sans ekrandan cikiyor (o_p25_battle/Step_0).
			global.p25phase = 8;
			break;
	}
	return true;
}
