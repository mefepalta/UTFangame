bob += 0.02;

// Faz 2 Sans'i (ve toz olmus Papyrus/Alphys) kapali kalsin. Her turun
// standart "Turn Preparation Start" girisi butun p2 alfalarini 1'e
// cekiyor; burada her kare geri kapatmazsak iki Sans birden gorunurdu.
if (instance_exists(battle_enemy_engage))
{
	with (battle_enemy_engage)
	{
		p2_head_alpha = 0;
		p2_body_alpha = 0;
		p2_legs_alpha = 0;
		p2_legs_alpha1 = 0;
		p2_cape_alpha = 0;
		p2_armleft_alpha = 0;
		p2_armright_alpha = 0;
		p2_thingy_alpha = 0;
		pap_alpha = 0;
		alp_alpha = 0;
	}
}

// FAZ 2'NIN BLOK SPRITE'I. o_sans_blockp2 "p2_head_alpha == 0" gorunce
// Sans'in bloklamaya gectigini varsayip kendini gosteriyor
// (o_sans_blockp2/Step_0). Biz p2 Sans'ini kalici olarak gizledigimiz
// icin blok sprite'i final phase boyunca ekranda, üstelik yeni
// sprite'larin ONUNDE kaliyordu. Bu fazda hic isi olmadigi icin
// dogrudan siliniyor.
with (o_sans_blockp2) { instance_destroy(); }

//--------------------------------------------------------- olum sahnesi
// 8 = veda bitti, Sans ekrandan cikiyor. Yavas baslayip hizlanan bir
// yuruyus; tamamen disari cikinca dusman slotu bosaliyor ve motor
// savasi bitiriyor (battle/Step_0: dusman sayisi 0 -> RESULT -> Battle_End).
if (global.p25phase == 8)
{
	yuru_hiz = min(2.6,yuru_hiz+0.035);
	yuru_x -= yuru_hiz;

	if (instance_exists(battle_enemy_engage))
	{
		var _ax = battle_enemy_engage.x+battle_enemy_engage.p2_off_x+yuru_x;
		if (_ax < -140)
		{
			// Sans ekrandan cikti. Motorun kendi zafer akisini (dusman
			// slotunu bosaltmak -> "YOU WON" ekrani -> onceki odaya donus)
			// KULLANMIYORUZ; bunun yerine ekran yavasca kararip hikayenin
			// devamina geciliyor. Bu yuzden Battle_RemoveEnemy cagrilmiyor.
			global.p25phase = 9;
			alfa = 0;
			fader.color = c_black;
			Fader_Fade(0,1,180);		// 3 saniyede tam siyah
		}
	}
}

// 9 = ekran kararıyor. Tamamen siyah olunca hikayenin son odasina geciliyor.
if (global.p25phase == 9)
{
	if (fader.alpha >= 1)
	{
		global.p25phase = 10;		// bir daha girmesin
		audio_stop_sound(snd_surrender);
		room_goto(room_story_final);
	}
}
