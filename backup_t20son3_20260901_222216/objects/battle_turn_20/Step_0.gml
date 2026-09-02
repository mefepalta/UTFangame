var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	// Teslim yolunun kapanisi: perde indikten sonra overworld'e geciliyor.
	if (teslim_cikis) and (_timer >= teslim_kare+T20_TESLIM_KARARMA+T20_TESLIM_BEKLE)
	{
		global.surrender_turn = false;
		// Overworld'de hangi konusmanin oynayacagini bu belirliyor:
		// teslim yolu mu, yoksa Sans'i bagislama yolu mu.
		global.surrender_son = true;
		audio_stop_all();
		room_goto(room_area_aftersans);
		// trigger_warp ile ayni duzen: fader kalici oldugu icin perde yeni
		// odada geri aciliyor, yoksa ekran siyah kalirdi.
		Fader_Fade(-1,0,T20_TESLIM_ACILMA);
		exit;
	}

	with (o_p1final_gbsans)
	{
		if (sprite_index == s_p1final_sans_slash)
		{
			other.spriteready = true;
		}
		else
		{
			other.spriteready = false;
		}
		if (floor(image_index) == 6)
		{
			other.frameready = true;
		}
		else
		{
			other.frameready = false;
		}
	}
	if (_timer == 10)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}
	if (_timer == 50)
	{
		RegularBone(left_box,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,48,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(right_box,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,48,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 200)
	{
		RegularBone(left_box,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,48,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 230) and (_timer < 310) and (_timer % 20 == 0)
	{
		RegularBone(left_box,top_box,124,2.5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,28,-2.5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 350)
	{
		RegularBone(left_box,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 370)
	{
		RegularBone(left_box - 30,top_box,88,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,88,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 410)
	{
		RegularBone(right_box + 10,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 430)
	{
		RegularBone(right_box + 20,top_box,88,-2.5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,48,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 470) and (_timer < 520) and (_timer % 10 == 0)
	{
		RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 540)
	{
		RegularBone(left_box,bottom_box,152,4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer > 550) and (_timer < 734) and (_timer % 35 == 0)
	{
		RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,100,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,100,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 770)
	{
		RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,64,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 805)
	{
		RegularBone(left_box,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 830)
	{
		RegularBone(right_box,bottom_box,48,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 850)
	{
		RegularBone(right_box,top_box,108,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 900)
	{
		RegularBone(left_box,bottom_box,48,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 920)
	{
		RegularBone(left_box,top_box,108,3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 950) and (_timer < 1321) and (_timer % 120 == 0)
	{
		RegularBlaster(-50,-50,battle_soul.x,top_box - 50,270,270,20,20,2,2,40);
	}
	if (_timer > 950) and (_timer < 1300) and (_timer % 80 == 0)
	{
		RegularBone(left_box,bottom_box,24,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,120,-3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 1320)
	{
		Battle_SetBoardSize(50,65,65,65);
	}
	if (_timer > 1350) and (_timer < 1850) and (_timer % 40 == 0)
	{
		RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,90,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,90,-3,0,180,0,0,1,0,0,0,0,true);
	}
	// YENI ACILIS -- Sans'in ziplayip inmesi yerine AYAK VURUSLARI.
	// o_p1final_fall gizli calisiyor: sahnenin devami (gb sahnesi) onun
	// sayacina bagli oldugu icin nesne isliyor ama cizilmiyor.
	if (_timer == T20_YV_BAS)
	{
		// Sahnenin uc parcasi (tekmeler / dusus / blaster) birbirine
		// girmesin diye gb nesnelerinin KENDI zamanlamasi burada kapatiliyor.
		// Eskiden o_p1final_fall bu karede baslatiliyordu ve sayaci
		// (p1finalattackval) blasteri 250. karede, yani tam tekmelerin
		// ortasinda yukari kaldiriyordu. Artik dusus de blaster de kendi
		// karelerinde, buradan tetikleniyor.
		with (o_p1final_sansgbfront) { manuel = true; }
		with (o_p1final_gbtop)       { manuel = true; }
		with (o_smaaash)
		{
			hiz = 0;			// kareleri turun kendisi suruyor (bkz. YvAdim)
			prev_frame = -1;
			image_index = 0;
			_ready = true;
		}
		// Kirilmanin merkezi: Sans'in ayaginin bastigi nokta (o_smaaash odada
		// 329'da duruyor), kutunun dikey ortasi.
		catlak_ox = clamp(329-battle_board.x,-battle_board.left+14,battle_board.right-14);
		catlak_oy = (battle_board.down-battle_board.up)/2;
		yv_on = true;
		yv_no = 0;
		yv_asama = 0;
		yv_t = 0;
	}
	YvAdim();
	CatlakAdim();

	// Vuruslar bitti: vurus sprite'i kalkiyor ve faz 1 Sans'i gizli kaliyor
	// (o_smaaash kapanirken saydamliklari geri yukluyor, her adim tekrar
	// sifirliyoruz). Bosluk bolumunde Sans'i o_p1final_fall temsil ediyor.
	if (_timer > T20_YV_BAS) and (_timer < T20_VOID_SON) and (!yv_on)
	{
		if (o_smaaash._ready) { with (o_smaaash) { _ready = false; hiz = 1; } }
		with (battle_enemy_engage)
		{
			_head_alpha = 0;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_legs_alpha = 0;
		}
	}

	//----------------------------------------------------------------------
	// 2. KISIM -- kutu kiriliyor ve siyah bosluga dusuyoruz
	//----------------------------------------------------------------------
	if (_timer == T20_VOID_BAS) { VoidKir(); }
	// Beyaz perde aciliyor: altinda kutu kirilmis, bosluk kurulmus oluyor.
	if (_timer == T20_BEYAZ_ACIL) { Fader_Fade(1,0,T20_BEYAZ_CIKIS); }
	VoidAdim();

	// Sans yukaridan dusup sahneye giriyor.
	if (_timer == T20_SANS_DUSUS)
	{
		with (o_p1final_fall)
		{
			gizli = false;
			image_index = 0;
			// Sprite 800x800 ve Sans karenin ICINDE x 282..493, y 252..501
			// araliginda duruyor. Odadaki eski yeri (-64,-256) onu ekranin
			// ortasina koyuyordu, yani "dusme" yerine oldugu yerde beliriyordu.
			// -512'de Sans tam ekranin ustunde kaliyor; oradan asagi suzuluyor.
			x = -68;			// 320 - (282+493)/2 : yatayda ortali
			y = -512;
			target_x = -68;
			target_y = 372;		// hedefi hemen veriyoruz ki beklemeden dussun
			// 0.05 cok hizliydi: Sans ekrani ~35 karede gecip kayboluyordu.
			// 0.02 ile gecis ~90 kare (1.5 sn) suruyor.
			move_speedy = 0.02;
			p1finalattack = true;
		}
	}

	// s_p1final_sansfall artik TEK kare oldugu icin nesnenin kendi
	// "image_index == 21'de kaybol" kurali hic calismiyor; dusus bittiginde
	// gizlemeyi tur ustleniyor.
	if (_timer == T20_SANS_DUSUS+T20_DUSUS_SURE)
	{
		with (o_p1final_fall)
		{
			p1finalattack = false;
			image_alpha = 0;
		}
	}

	// Sans asagidan blastere binmis halde yukseliyor.
	if (_timer == T20_GB_GELIS) { GbGelis(); }
	if (_timer == T20_GB_GOZ)   { GbGoz(); }

	// Blasterden yayilan cemberler: T20_CEM_ARA kare arayla, her biri bir
	// oncekinin TERSI yonde donerek.
	if (_timer >= T20_CEM_BAS) and (cem_no < T20_CEM_ADET)
	and (((_timer-T20_CEM_BAS) mod T20_CEM_ARA) == 0)
	{
		CemberEkle((cem_no mod 2 == 0) ? 1 : -1);
		cem_no += 1;
	}
	CemberAdim();

	// NOT: pattern'ler arasi goz parlamasi, butun pattern'ler bittikten
	// sonra tek seferde gelecek; simdilik burada yok.

	// 2. pattern: Sans saga kayar, sola bakan blaster gelir.
	if (_timer == T20_P2_BAS) { Gb2Basla(); }
	Gb2Adim();
	// Pattern bitti: kapanis sahnesi basliyor (Sans guluyor -> sinematik
	// kesikler -> blaster catliyor -> hepsi asagi dusuyor).
	if (_timer == T20_P2_SON) { Gb2Bitir(); SonBasla(); }
	SonAdim();

	if (_timer == T20_VOID_SON) { VoidBitir(); }
	// NOT: faz 1'in FINALI (kutunun geri acilmasi, Sans'in toparlanmasi,
	// yenilgi konusmasi) toplam 2100 kare ileri alindi -- 3290 yerine
	// 5390'da basliyor. Aradaki bosluk blaster pattern'leri ve kapanis
	// sahnesi icin.
	//
	// NOT: 2085-2950 arasindaki eski "blaster'a binmis Sans" sahnesi
	// (o_p1final_gbtop / gbsans / slash zinciri) bu bolum yeniden
	// yazildigi icin devre disi. Sans'in asagidan blastera binerek gelmesi
	// ve kalan atak patternleri sonraki adimda buraya gelecek.
	if (false) and (_timer == 2085)
	{
	    Battle_SetBoardSize(270,65,300,-210);
	}
	if (false) and (_timer == 2125)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		battle_soul.x = 70;
	}
	if (false) and (_timer > 2150) and (_timer < 2950) and (_timer % 100 == 0)
	{
		for (var i = 195; i > 165; i -= 5)
		{
			var bone = RegularBone(o_p1final_gbtop.x,o_p1final_gbtop.y, 40,0, 0, i+90,0,1,1,0,0,0,0,true);
			bone.direction = i;
			bone.speed = 10;
		}
		audio_play_sound(snd_stab,2,false);
		with (o_p1final_gbtop)
		{
			target_x = random_range(348,548);
			target_y = random_range(94,224);
		}
		with (o_p1final_gbsans)
		{
			sprite_index = s_p1final_sans_slash;
			image_speed = 1;
		}
	}
	if (false) and (_timer > 2150) and (_timer < 2950) and (_timer % 60 == 0)
	{
		RegularBone(left_box + 5,top_box,53,0,4,270,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 5,bottom_box,53,0,-4,90,0,0,1,0,0,0,0,true);
	}
	if (false) and (_timer > 2170) and (_timer < 2950) and (spriteready == true) and (frameready == true)
	{
	    if (!attack_done)
		{
			var slash = instance_create_depth(o_p1final_gbsans.x - 102, o_p1final_gbsans.y + 56, -99999, o_p1final_sansslash);
        
	        // Calculate direction towards player
			var dir = point_direction(o_p1final_gbsans.x, o_p1final_gbsans.y, battle_soul.x, battle_soul.y);
	        slash.direction = dir;
	        slash.speed = 7;
	        slash.image_angle = dir + 180;

	        attack_done = true; // Prevents multiple slashes per frame
	    }
	}
	else
	{
	    attack_done = false; // Reset when not on frame 3
	}
	if (false) and (_timer == 2950)
	{
		with (o_p1final_gbsans)
		{
			sprite_index = s_p1final_sans_laugh;
		}
		audio_play_sound(snd_sans_laugh,2,false);
	}
	if (false) and (_timer == 3030)
	{
		with (o_p1final_gbsans)
		{
			sprite_index = s_p1final_sans_serious;
		}
		audio_play_sound(snd_slice,2,false);
		instance_create_depth(x,y,-99999999,o_fakeslash);
	}
	if (false) and (_timer == 3100)
	{
		audio_play_sound(snd_bighit,2,false);
		Camera_Shake(5,5,1,1,5,5,0.3,0.3);
	}
	if (false) and (_timer > 3170) and (_timer < 3270) and (_timer % 30 == 0)
	{
		instance_create_depth(o_p1final_gbtop.x + random_range(-200,70),o_p1final_gbtop.y + random_range(-100,100),-999999999,o_p1final_explosion);
		instance_create_depth(o_p1final_gbtop.x + random_range(-200,70),o_p1final_gbtop.y + random_range(-100,100),-999999999,o_p1final_explosion_1);
	}
	if (_timer > 5270) and (_timer < 5420)
	{
		with (o_p1_shine)
		{
			target_alpha = target_alpha + 0.01;
		}
	}
	if (_timer > 5420) and (_timer < 5520)
	{
		with (o_p1_shine)
		{
			target_alpha = target_alpha - 0.1;
		}
	}
	if (false) and (_timer == 3220)
	{
		with (o_p1final_gbtop)
		{
			move_speedx = move_speedx * 0.15;
			move_speedy = move_speedy * 0.15;
			target_x = 60;
			target_y = 904;
		}
	}
	// NOT: kutu artik burada tek karede zipmiyor -- VoidBitir (T20_VOID_SON)
	// onu 54 karede bu olcuye getiriyor, boylece boslugun kapanmasiyla
	// finalin kutusu tek bir hareket oluyor.
	if (_timer == 5420)
	{
		battle_soul.x = right_box - 120;
		battle_soul.y = top_box + 40;
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
		with (o_p1final_gbtop)
		{
			instance_destroy();
		}
		with (o_p1final_gbbottom)
		{
			instance_destroy();
		}
		with (o_p1final_gbsans)
		{
			instance_destroy();
		}
		with (o_p1final_gbsans_expressions)
		{
			instance_destroy();
		}
		with (o_p1final_fall)
		{
			instance_destroy();
		}
	}
	// SANS'IN INISI
	// Eskiden lerp ile iniyordu: basta hizli, sonra giderek yavaslayan bir
	// hareket -- dusmenin TERSI. Ustelik 75 karede kesiliyordu, yani 22
	// karelik animasyonun ancak ucte biri oynuyordu ve savas sprite'i
	// birden yerine geciyordu.
	// Simdi final faz'daki inisler gibi: mesafe t^2 ile artiyor (hizlanan
	// dusus) ve animasyon tam olarak inis boyunca bir kez oynuyor.
	if (_timer == T20_FIN_DUS_BAS)
	{
		with (o_p1final_fall_1)
		{
			// Kendi lerp'i devre disi: hareketi tur suruyor.
			move_speedy = 0;
			target_y = y;
			image_speed = 0;
			image_index = 21;
			image_alpha = 1;
			other.fin_dus_y0 = y;
		}
		fin_dus = true;
		fin_dus_t = 0;
		with (o_p1_shine)
		{
			image_alpha = 0;
		}
		battle_enemy_engage._wiggle = false;
		battle_enemy_engage.arm_speed = 0;
	}
	FinDusAdim();
	if (_timer == 5625)
	{
		with (battle_enemy_engage)
		{
			_head_sprite = spr_sans_head_1;
			_head_alpha = 1;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_armleft_alpha1 = 1;
			_armright_alpha1 = 1;
			_legs_alpha1 = 1;
			mask_index = leg_sprite1;
			_body_x = 1;
		}
		// Inis sprite'i tek karede kaybolmuyor: savas Sans'i belirirken
		// uzerinde soluyor, boylece gecis gorunmuyor.
		with (o_p1final_fall_1)
		{
			Anim_Create(id,"image_alpha",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,image_alpha,-image_alpha,FIN_DUS_CIK);
		}
	}
	if (_timer == 5625+FIN_DUS_CIK) { with (o_p1final_fall_1) { instance_destroy(); } }

	if (_timer > 5450) and (_timer < 5625) and (_timer % 40 == 0)
	{
		RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,100,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,100,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 5650)
	{
		Battle_SetBoardSize(65,65,65,65);
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		// Halka yavasladi: donme hizi 5 -> 3.2 derece/kare. Blasterler arasi
		// ACI ayni kalsin diye siklik da 5 -> 8 kare oldu (5*5 = 3.2*8 = 25.6
		// derece), yani ayni desen daha yavas geliyor. Sure 400 -> 500:
		// yavaslayinca ayni tur sayisi daha uzun suruyor.
		RegularBlasterCircle(battle_board.x,battle_board.y,3.2,175,8,45,8,20,1,500);
	}
	if (_timer == 5750)
	{
		audio_stop_sound(snd_chevalier);
	}
	if (_timer == 6220)
	{
		with (battle_enemy_engage)
		{
			_head_sprite = spr_sans_head;
		}
		anotherTest = instance_create_depth(0,0,0,battle_dialog_enemy);
		// SURRENDER: 12. tur repligi atagin SONUNDA oynuyor -- turun basinda
		// degil (bkz. scripts/Surrender). Normal FIGHT yolunda asagidaki
		// yenilgi konusmasi oynuyor.
		if (Surrender_Aktif())
		{
			anotherTest.text = Surrender_Text();
		}
		else
		{
			anotherTest.text = "{font 3}{voice 3}{squish 1.2}{head 28}Heh...{pause}{clear}{head 27}Heheheh...{pause}{clear}{head 28}Man...{pause}{clear}{head 27}Would you believe me&if I said I put&everything I had into&that last attack?{pause}{clear}{head 22}Heh...{pause}{clear}{head 19}You really are&something, huh?{pause}{clear}{head 20}All these years I've&been obsessed with&being the best...{pause}{clear}{head 21}Failure wasn't even&close to being an&option for me.{pause}{clear}{head 23}I beat everyone I&encountered through&sheer skill alone.{pause}{clear}{head 27}And to think...{pause}{clear}...it took the might&of a human... to&finally best me in&combat...!{pause}{clear}{head 22}Alphys... Toriel...{pause}{clear}{head 21}It's been an honor...{pause}{clear}{head 22}I'm done.";
		}
	}
	if (_timer > 6220)
	{
		if !(instance_exists(anotherTest))
		{
			if (Surrender_Aktif())
			{
				// TESLIM YOLUNUN SONU. Dovus burada bitiyor: tur kapatilmiyor,
				// menuye donulmuyor, faz 1'in son duzlugu (finalstretch)
				// baslatilmiyor. Ekran kararip overworld'e geciliyor --
				// Sans'in kalan replikleri orada (PDF: Overworld).
				if (!teslim_cikis)
				{
					teslim_cikis = true;
					teslim_kare = _timer;
					Fader_Fade(0,1,T20_TESLIM_KARARMA);
				}
			}
			else
			{
				audio_play_sound(snd_chance,1,true);
				Battle_SetMenuDialog("* ...")
				if (instance_exists(o_sans_blockp2))
				{
					o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
				}
				Battle_EndTurn();
				global.finalstretch = 1;
				global.go_dodge="damage"
			}
		}
	}
}

if (room == room_battle_1)
{
	// TEST: H tusu cani 92'ye cekiyor. Faz 2 test edilirken gerekli,
	// yayina cikmadan once bu blok silinecek.
	if (keyboard_check_pressed(ord("H"))) { Player_SetHp(92); }

	// Faz 2'nin acilis kurulumu. ATLAMA BLOGUNUN USTUNDE olmali: test
	// modunda _timer 1. karede 8700'e cekiliyor ve altta kalirsa hic
	// calismiyor.
	//
	// _wiggle: bacak ve govde salinimini suruyor (battle_enemy_engage).
	// Faz 1'in sonunda false yapiliyor ve nesne odalar arasinda yasadigi
	// icin faz 2'ye de kapali giriyordu -- Sans donup kaliyordu.
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		battle_enemy_engage._wiggle = true;
	}

	// TEST: onceki kisimlari atla (bkz. Create_0'daki iki anahtar).
	// _timer'i 8700'e atiyoruz: 1-6. kisimlarin butun "_timer == N"
	// kontrolleri (en buyugu 8620) bir daha eslesmiyor. bolum 12 =
	// koridor ve Konuk bitmis sayiliyor.
	//   test_sonatak : 9. kisim (parkur) da atlanir, son atak baslar
	//   test_labirent: parkurdan baslar
	if ((test_labirent) or (test_sonatak)) and (_timer == 1)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");

		if (test_sonatak)
		{
			// Kutuyu son atak kendisi kuruyor (F2SfBasla, TIME = 0).
			// Buradaki normal olcu sadece aradaki 30 kare icin.
			Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT,0);
		}
		else
		{
			Battle_SetBoardSizeCubic(320,160,320,320,1);
		}

		Battle_SetSoul(battle_soul_red);
		if (instance_exists(battle_soul))
		{
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}
		_timer = 8700;
		bolum = 12;

		if (test_sonatak)
		{
			// son_bitis -1 kaliyor: F2MaviKay hic cagrilmiyor, yani
			// parkur baslamiyor. Son atak 30 kare sonra devreye giriyor.
			son_bitis = -1;
			sf_bekle = 30;
		}
		else
		{
			// son_bitis 8700 -> parkur 60 kare sonra, 8760'ta basliyor.
			son_bitis = 8700;
		}
	}

	//======================================================================
	// FAZIN SON ATAGI -- 1. KISIM (kirmizi / mavi)
	//======================================================================
	// Yapi kullanicinin tarifinden, hizlar atakfinal_1.gif'ten olculdu
	// (kayit 640x480 = oyun cozunurlugu, 30 fps -> oyun karesi 2 x GIF).
	// Kutu olculdu: 68,68,80,80 (x 239-398, y 251-387), atak boyunca sabit.
	//
	//   1  sag alttan + sol ustten, ortada capraz kesisiyorlar
	//   2  onlar cikarken sag ustten + sol alttan ayni sey
	//   3  SLAM UP, sag ustten uzunlugu artan 5 kemik
	//   4  onlar cikarken soldan 4 adet UST bosluklu kemik
	//   5  iki ust koseden de uzunlugu artan 5'er kemik
	//   6  SLAM DOWN, ust ortadan inen yatay kemik + altta yukari bakan
	//      iki blaster
	//   7  ust koselerde asagi bakan blasterlar + iki yandan ALT bosluklu
	//   8  iki yandan ORTA bosluklu kemikler, kisim biter
	//
	// KEMIKLER SANS SPRITE'I: RegularBone'un 10. argumani 0.
	//======================================================================
	if (_timer == 20)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(68,68,80,80,18);
		Battle_SetSoul(battle_soul_red);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
	}

	//------------------------------------ 1: sag alt + sol ust, capraz
	// Olcum: ikisi de 4 px/kare, ortada (x 318) kesisiyorlar.
	if (_timer == 38)
	{
		F2Ust(4,84);			// sol ustten saga
		F2Alt(-4,84);			// sag alttan sola
	}

	//------------------------- 2: onlar cikarken karsi koselerden aynisi
	// Olcum: ikinci cift kare 72'de giriyor (ilk cift tam kutuyu gecmisken).
	if (_timer == 72)
	{
		F2Ust(-4,84);			// sag ustten sola
		F2Alt(4,84);			// sol alttan saga
	}

	//--------------------- 3: SLAM UP + sag ustten uzunlugu artan 5 kemik
	if (_timer == 112) { Battle_SlamUp(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 124) { F2Ust(-5,24); }
	if (_timer == 132) { F2Ust(-5,42); }
	if (_timer == 140) { F2Ust(-5,60); }
	if (_timer == 148) { F2Ust(-5,78); }
	if (_timer == 156) { F2Ust(-5,96); }

	//----------------- 4: onlar cikarken soldan 4 UST bosluklu kemik
	if (_timer == 196) { F2Bosluk(5,0); }
	if (_timer == 214) { F2Bosluk(5,0); }
	if (_timer == 232) { F2Bosluk(5,0); }
	if (_timer == 250) { F2Bosluk(5,0); }

	//------------- 5: iki ust koseden de uzunlugu artan 5'er kemik
	if (_timer == 290) { F2Ust(-5,24); F2Ust(5,24); }
	if (_timer == 298) { F2Ust(-5,42); F2Ust(5,42); }
	if (_timer == 306) { F2Ust(-5,60); F2Ust(5,60); }
	if (_timer == 314) { F2Ust(-5,78); F2Ust(5,78); }
	if (_timer == 322) { F2Ust(-5,96); F2Ust(5,96); }

	//------ 6: SLAM DOWN + ust ortadan inen yatay kemik + alttan blaster
	if (_timer == 370) { Battle_SlamDown(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 384)
	{
		F2InenYatay(2);			// alt/ust kenara paralel, asagi iniyor
		F2AltBlaster(-46);		// kutunun altinda, yukari bakiyor
		F2AltBlaster(46);
	}

	//------ 7: ust koselerde asagi bakan blaster + iki yandan ALT bosluklu
	if (_timer == 460)
	{
		F2UstBlaster(-56);
		F2UstBlaster(56);
	}
	if (_timer == 470) { F2Bosluk(5,2);  }
	if (_timer == 470) { F2Bosluk(-5,2); }
	if (_timer == 510) { F2Bosluk(5,2);  }
	if (_timer == 510) { F2Bosluk(-5,2); }

	//------------------------ 8: iki yandan ORTA bosluklu, kisim biter
	if (_timer == 570) { F2Bosluk(5,1);  }
	if (_timer == 570) { F2Bosluk(-5,1); }
	if (_timer == 610) { F2Bosluk(5,1);  }
	if (_timer == 610) { F2Bosluk(-5,1); }

	//======================================================================
	// 2. KISIM
	//======================================================================
	// Kutu: karenin azicik genis hali. Kare 68,68,68,68 olurdu; genisletilmis
	// hali 68,68,85,85 (170 x 136).
	//
	//   1  SLAM DOWN
	//   2  ustten kutudan genis MAVI kemik (Sans sprite) yelpaze yapiyor:
	//      asagi inip yon degistirip yukari cikiyor
	//   3  mavi kemik inerken kemik duvari (Papyrus sprite)
	//   4  duvardan ziplanan an SLAM RIGHT + soldan kemik geciti
	//      (bosluklar sinuse gore kayiyor)
	//   5  kutu X'te daraliyor (karenin 1/3'u), SLAM LEFT; sag ust ve sag
	//      altta SOLA bakan blasterlar -- sol orta guvenli nokta
	//   6  ardindan sag ortadan merkezi nisan alan blaster
	//   7  kutu ilk haline doner, DORT yonden kemik duvari, merkez guvenli
	//   8  duvarlar cikar cikmaz KIRMIZI ruha donus
	//======================================================================
	if (_timer == 660)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(68,68,85,85,20);
	}

	//---------------------------------------------------------- 1: slam down
	if (_timer == 690) { Battle_SlamDown(); audio_play_sound(snd_impact,2,false); }

	//------------------------------- 2: buyuk MAVI kemik, yelpaze hareketi
	// _dynamic modu hizi -1'e dogru lerp'liyor: kemik yavaslar, durur ve
	// geri doner. Oran 0.012 -> donus 57. karede, yani genis bir yay.
	if (_timer == 710) { F2MaviYelpaze(); }

	//----------------------- 3: mavi kemik inerken kemik duvari (Papyrus)
	if (_timer == 790) { F2Duvar(DIR.DOWN,52,45,120); }

	//------------- 4: duvardan ziplanan an SLAM RIGHT + soldan kemik geciti
	if (_timer == 880)
	{
		Battle_SlamRight();
		audio_play_sound(snd_impact,2,false);
	}

	// Kemik geciti: bosluklar sinuse gore kayiyor, dalga cizerek geliyorlar.
	if (_timer >= 910) and (_timer <= 1090)
	{
		if ((_timer-910) % 18 == 0) { F2Gecit(5,(_timer-910)/18,54); }
	}

	//------------------ 5: kutu X'te daraliyor + SLAM LEFT + sola blasterlar
	// Kare yari genisligi 68; 1/3'u ~23.
	if (_timer == 1130)
	{
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(68,68,23,23,24);
	}

	if (_timer == 1160) { Battle_SlamLeft(); audio_play_sound(snd_impact,2,false); }

	// Sag ust ve sag altta sola bakan blasterlar: ortadaki serit acik kaliyor,
	// yani kutunun SOL ORTASI guvenli nokta.
	if (_timer == 1190)
	{
		F2SolaBlaster(-46);
		F2SolaBlaster(46);
	}

	//------------------------- 6: sag ortadan merkezi nisan alan blaster
	if (_timer == 1270) { F2SolaBlaster(0); }

	//--------------- 7: kutu ilk haline doner, DORT yonden duvar, merkez acik
	if (_timer == 1350)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(68,68,85,85,26);
	}

	// Kutu 170 x 136. Yanlardan 58 boy -> ortada 54 px acik kaliyor,
	// alt/usten 44 boy -> ortada 48 px acik. Merkez guvenli nokta.
	if (_timer == 1400)
	{
		// Sure 60: uyari 50 + 60 = kare 1510'da bitiyorlar, kutu 1520'de
		// sekil degistirdigi icin tam ondan once sahneden cikmis oluyorlar.
		F2Duvar(DIR.LEFT,58,50,60);
		F2Duvar(DIR.RIGHT,58,50,60);
		F2Duvar(DIR.UP,44,50,60);
		F2Duvar(DIR.DOWN,44,50,60);
	}

	//------------------------- 8: duvarlar cikinca KIRMIZI ruha donus
	if (_timer == 1460)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_red);
	}


	//======================================================================
	// 3. KISIM -- ALPHYS: dalga kemikleri, platform, shocker breaker
	//======================================================================
	// battle_turn_14'teki bolumun aynisi. Kutunun dibine sirali kemikler
	// diziliyor; shocker breaker CARPTIGI anda o noktadan bir dalga
	// yayiliyor ve kemik boylari dalgayla degisiyor. Oyuncu bu sirada
	// gidip gelen platformun uzerinde duruyor (mavi ruh).
	//
	// Shocker uyari suresi 44, dalga da tam 44 kare sonra basliyor: yani
	// yildirim indigi anda deniz kabariyor.
	//======================================================================
	if (_timer == 1520)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,120,120,24);
	}

	if (_timer == 1560)
	{
		instance_create_depth(0,0,0,battle_soul_blue_effect);
		Battle_SetSoul(battle_soul_blue);
		F2DenizKur(26,34,40);
		f2_plat = makeplatform(battle_board.x-120,battle_board.y+18,64,2.2,0,1,0);
	}

	// Dalga ve platform her kare guncelleniyor.
	if (_timer > 1560) and (_timer < 2520)
	{
		F2DenizAdim(34,120,3,50,70);
		F2PlatformAdim();
	}

	//-------------------- shocker breaker + 44 kare sonra dalga
	if (_timer == 1640) { AlphysShocker(battle_board.x-110,battle_board.y+58,44); }
	if (_timer == 1684) { F2Dalga(battle_board.x-110); }

	if (_timer == 1770) { AlphysShocker(battle_board.x+70,battle_board.y+58,44); }
	if (_timer == 1814) { F2Dalga(battle_board.x+70); }

	if (_timer == 1900) { AlphysShocker(battle_board.x-40,battle_board.y+58,44); }
	if (_timer == 1944) { F2Dalga(battle_board.x-40); }

	if (_timer == 2030) { AlphysShocker(battle_board.x+120,battle_board.y+58,44); }
	if (_timer == 2074) { F2Dalga(battle_board.x+120); }

	if (_timer == 2160) { AlphysShocker(battle_board.x-130,battle_board.y+58,44); }
	if (_timer == 2204) { F2Dalga(battle_board.x-130); }

	if (_timer == 2290) { AlphysShocker(battle_board.x+30,battle_board.y+58,44); }
	if (_timer == 2334) { F2Dalga(battle_board.x+30); }

	if (_timer == 2420) { AlphysShocker(battle_board.x+90,battle_board.y+58,44); }
	if (_timer == 2464) { F2Dalga(battle_board.x+90); }

	//---------------------------------------------------------- kisim biter
	if (_timer == 2520)
	{
		F2DenizTemizle();
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}


	//======================================================================
	// 4. KISIM -- MIZRAKLAR + KOSE CEKICLERI + FIRLATILAN DONEN KEMIK
	//======================================================================
	// Mizrak dalgalari battle_turn_17'deki sirayla; her dalganin kendi
	// arenasi var (SpearArena), yani kutu mizrak patternine gore genisliyor.
	// Buyuk arenada koselerden sirayla Alphys'in cekici vuruyor.
	//
	// Bu sure boyunca Sans'in SOL kolu firlatma pozunda (battle_turn_8 ayni
	// isi sag kolla yapiyor) ve elinden DONEN kemikler cikiyor: tek parca,
	// duz yol, kendi ekseninde donerek. Kisim bitince kol eski haline doner.
	//======================================================================

	// Sol kol: sure dolunca kendiliginden eski sprite'ina doner.
	if (f2_kol_geri > 0) and (_timer == f2_kol_geri) { F2KolGeri(); }

	//------------------------------------------------- 1. dalga: spear4
	if (_timer == 2560)
	{
		SpearArena(4);
		Battle_SetSoul(battle_soul_red);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
	}

	if (_timer >= 2620) and (_timer <= 3120)
	{
		if ((_timer-2620) % 26 == 0) { Spear4(); }
	}

	//------------------------------------------------- 2. dalga: spear5
	if (_timer == 3160) { SpearArena(5); }

	if (_timer >= 3220) and (_timer <= 3720)
	{
		if ((_timer-3220) % 45 == 0) { Spear5(); }
	}

	// Shocker breakerlar: mizraklar iki yandan gelirken alt kenarda patliyorlar.
	// battle_turn_17'deki dizilim; arena ayni oldugu icin x ofsetleri de ayni.
	if (_timer == 3260) { AlphysShocker(battle_board.x-120,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3309) { AlphysShocker(battle_board.x+ 70,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3358) { AlphysShocker(battle_board.x- 40,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3407) { AlphysShocker(battle_board.x+130,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3456) { AlphysShocker(battle_board.x- 85,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3505) { AlphysShocker(battle_board.x+ 20,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3554) { AlphysShocker(battle_board.x+105,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3603) { AlphysShocker(battle_board.x-135,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3652) { AlphysShocker(battle_board.x+ 45,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3701) { AlphysShocker(battle_board.x- 20,battle_board.y+battle_board.down-4,40); }

	//------------------------------------------------- 3. dalga: spear3
	if (_timer == 3760) { SpearArena(3); }

	if (_timer >= 3820) and (_timer <= 4260)
	{
		if ((_timer-3820) % 20 == 0) { Spear3(); }
	}

	// Homing mizraklar gelirken yukaridan dusup patlayan yildirim boltlari.
	// battle_turn_17 ile ayni dizilim ve ayni arena (SpearArena 3).
	if (_timer == 3860) { AlphysBigBolt(battle_board.x-44,-60,270,6,5,2.4); }
	if (_timer == 3980) { AlphysBigBolt(battle_board.x+38,-60,270,6,5,2.4); }
	if (_timer == 4100) { AlphysBigBolt(battle_board.x-12,-60,270,6,7,2.4); }
	if (_timer == 4220) { AlphysBigBolt(battle_board.x+46,-60,270,6,5,2.4); }

	//---------------------------------- 4. dalga: spear1, BUYUK arena
	if (_timer == 4300)
	{
		SpearArena(2);
		// Kol pozu ve elindeki kemik sadece BUYUK kutulu bolumde: spear1 ve
		// spear2 dalgalari boyunca ates ediyor, 5400'de kol iniyor.
		F2KolFirlat(5400);
		f2_s1_next = 4360;
		f2_s1_n = 0;
		f2_s1_ang = 0;
	}

	if (_timer >= 4360) and (_timer <= 4860)
	{
		if (_timer >= f2_s1_next)
		{
			Spear1(f2_s1_ang);
			f2_s1_ang += 32;
			f2_s1_next = _timer+Spear1Gap(f2_s1_n);
			f2_s1_n += 1;
		}
	}

	//---------------------------------- 5. dalga: spear2, hiz takviyesi
	if (_timer == 4900) { Spear2Speed(true); }

	if (_timer >= 4900) and (_timer <= 5400)
	{
		if ((_timer-4900) % 70 == 0) { Spear2(); }
	}

	//------------------ kose cekicleri: buyuk arena boyunca sirayla
	// Sira cember cizecek sekilde: ust sol -> ust sag -> alt sag -> alt sol.
	if (_timer == 4400) { F2Cekic(0); }
	if (_timer == 4550) { F2Cekic(1); }
	if (_timer == 4700) { F2Cekic(2); }
	if (_timer == 4850) { F2Cekic(3); }
	if (_timer == 5000) { F2Cekic(0); }
	if (_timer == 5150) { F2Cekic(1); }
	if (_timer == 5300) { F2Cekic(2); }

	//------------------ Sans'in elinden firlayan donen kemikler
	// Elindeki kemik her kare kola sabitleniyor: kutu ya da Sans yer
	// degistirse de kemik kolun ucunda kaliyor.
	if (f2_kol_geri > 0) and (instance_exists(o_fakebone))
	{
		var _el = F2El();
		o_fakebone.x = _el.ex;
		o_fakebone.y = _el.ey;
	}

	// Ates: sadece buyuk kutulu spear1/spear2 boyunca, 180 karede bir.
	if (_timer >= 4400) and (_timer <= 5380)
	{
		if ((_timer-4400) % 180 == 0) { F2DonenKemik(7,9); }
	}

	//---------------------------------------------------------- kisim biter
	if (_timer == 5440)
	{
		Spear2Speed(false);
		with (o_alphys_spear) { instance_destroy(); }
		with (o_alphys_hammer) { instance_destroy(); }
		with (o_alphys_shocker) { instance_destroy(); }
		with (o_alphys_bolt) { instance_destroy(); }
		F2KolGeri();
	}


	//======================================================================
	// 5. KISIM -- SON KIRMIZI/MAVI
	//======================================================================
	// Kutu dikdortgen halini aliyor (65,65,283,283 -> 566x130).
	// Soldan alttan 6'li kemik gruplari geciyor; boylari 105 oldugu icin
	// ustte 25 px bosluk var. Her ucuncu grup 152'ye uzayip ust duvara
	// carpiyor ve o bosluk kapaniyor.
	// Uzerine kalbe nisan alan ince blasterlar ve homing mizraklar biniyor;
	// ucu birden calisinca kismin sonuna dogru yogunluk artiyor.
	//======================================================================

	if (_timer == 5500)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,120,120,30);
	}

	//------------------------------------------- alttan gecen kemik gruplari
	// 60 karede bir yeni grup, hiz 3. Kutu 240 px, grup 70 px ve gruplar
	// arasi 180 px oldugu icin ekranda surekli iki grup bulunuyor -- senkron
	// vurusun anlamli olmasi bunu gerektiriyor.
	if (_timer >= 5560) and (_timer <= 6760)
	{
		if ((_timer-5560) % 60 == 0) { F2AltGrup(2.5); }
	}

	// Senkron vurus: ekrandaki gruplarin hepsi ayni anda yukari vuruyor.
	// 120 karede bir: 60 kare uzun, 60 kare kisa (bkz. F2GrupVur).
	if (_timer >= 5620) and (_timer <= 6800)
	{
		if ((_timer-5620) % 120 == 0) { F2GrupVur(); }
	}

	//--------------------------------------------- kalbe nisan alan blasterlar
	// Kemik gruplari basladiktan bir sure sonra giriyorlar.
	if (_timer == 5900) { F2NisanBlaster(true); }
	if (_timer == 6100) { F2NisanBlaster(false); }
	if (_timer == 6300) { F2NisanBlaster(true); }
	if (_timer == 6500) { F2NisanBlaster(false); }
	if (_timer == 6700) { F2NisanBlaster(true); }

	//------------------------------------------------------ homing mizraklar
	// En son onlar giriyor, kismin sonuna dogru ucu birden calisiyor.
	if (_timer >= 6200) and (_timer <= 6800)
	{
		if ((_timer-6200) % 60 == 0) { Spear3(); }
	}

	//---------------------------------------------------------- kisim biter
	if (_timer == 6900)
	{
		with (o_alphys_spear) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
	}


	//======================================================================
	// 6. KISIM -- SARI RUH
	//======================================================================
	// 109 hedef, 22 saniye. Sekiz yonun hepsi dengeli kullaniliyor
	// (en az 12, en cok 15 hedef). Dalgalar:
	//   1  acilis turu      -- sekiz yon saat yonunde iki tur
	//   2  karsit ciftler   -- 180 derece donmeye zorluyor, en sikisik yer
	//   3  capraz buyukler  -- altinda sekiz yonlu akis surerken
	//   4  dikey aynalar    -- 90/270 kapali, arkalarinda buyukler
	//   5  capraz aynalar   -- dort capraz kapali, akis kardinallerde
	//   kopru             -- kardinal aynalar: atis istemiyorlar, oyuncu
	//                        bu sirada finalin sarjlarini biriktiriyor
	//   final             -- DELME HATLARI: dort caprazdan dorder hedef.
	//                        16 hedef 90 karede geliyor, kucuk atisla
	//                        144 kare gerekirdi; tek cozum hat basina bir
	//                        guc vurusu (buyuk mermi delip geciyor).
	//======================================================================

	if (_timer == 6960) { F2SariBasla(); }

	if (sari_on)
	{
		sari_t += 1;

		if (sari_t == 43) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 150
		if (sari_t == 54) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 161
		if (sari_t == 65) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 172
		if (sari_t == 76) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 183
		if (sari_t == 87) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 194
		if (sari_t == 98) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 205
		if (sari_t == 109) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 216
		if (sari_t == 120) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 227
		if (sari_t == 131) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 238
		if (sari_t == 142) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 249
		if (sari_t == 153) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 260
		if (sari_t == 164) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 271
		if (sari_t == 175) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 282
		if (sari_t == 186) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 293
		if (sari_t == 197) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 304
		if (sari_t == 208) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 315
		if (sari_t == 233) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 340
		if (sari_t == 243) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 350
		if (sari_t == 255) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 362
		if (sari_t == 265) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 372
		if (sari_t == 277) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 384
		if (sari_t == 287) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 394
		if (sari_t == 299) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 406
		if (sari_t == 309) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 416
		if (sari_t == 321) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 428
		if (sari_t == 331) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 438
		if (sari_t == 343) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 450
		if (sari_t == 353) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 460
		if (sari_t == 365) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 472
		if (sari_t == 375) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 482
		if (sari_t == 387) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 494
		if (sari_t == 397) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 504
		if (sari_t == 423) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 530
		if (sari_t == 439) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 546
		if (sari_t == 455) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 562
		if (sari_t == 464) { DrTarget(DR_TARGET.BIG,45,1.9); }                                                            // varis 640
		if (sari_t == 471) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 578
		if (sari_t == 487) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 594
		if (sari_t == 503) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 610
		if (sari_t == 519) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 626
		if (sari_t == 524) { DrTarget(DR_TARGET.BIG,225,1.9); }                                                            // varis 700
		if (sari_t == 535) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 642
		if (sari_t == 551) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 658
		if (sari_t == 567) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 674
		if (sari_t == 583) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 690
		if (sari_t == 584) { DrTarget(DR_TARGET.BIG,135,1.9); }                                                            // varis 760
		if (sari_t == 599) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 706
		if (sari_t == 615) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 722
		if (sari_t == 631) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 738
		if (sari_t == 647) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 754
		if (sari_t == 663) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 770
		if (sari_t == 693) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 800
		if (sari_t == 704) { DrTarget(DR_TARGET.MIRROR,90,2.4); }                                                            // soner 830
		if (sari_t == 709) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 816
		if (sari_t == 725) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 832
		if (sari_t == 739) { DrTarget(DR_TARGET.MIRROR,270,2.4); }                                                            // soner 865
		if (sari_t == 741) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 848
		if (sari_t == 757) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 864
		if (sari_t == 764) { DrTarget(DR_TARGET.BIG,90,1.9); }                                                            // varis 940
		if (sari_t == 773) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 880
		if (sari_t == 789) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 896
		if (sari_t == 805) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 912
		if (sari_t == 821) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 928
		if (sari_t == 829) { DrTarget(DR_TARGET.BIG,270,1.9); }                                                            // varis 1005
		if (sari_t == 837) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 944
		if (sari_t == 853) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 960
		if (sari_t == 869) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 976
		if (sari_t == 893) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 1000
		if (sari_t == 894) { DrTarget(DR_TARGET.MIRROR,45,2.4); }                                                            // soner 1020
		if (sari_t == 908) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 1015
		if (sari_t == 923) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 1030
		if (sari_t == 924) { DrTarget(DR_TARGET.MIRROR,135,2.4); }                                                            // soner 1050
		if (sari_t == 938) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 1045
		if (sari_t == 953) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 1060
		if (sari_t == 954) { DrTarget(DR_TARGET.MIRROR,225,2.4); }                                                            // soner 1080
		if (sari_t == 964) { DrTarget(DR_TARGET.BIG,45,1.9); }                                                            // varis 1140
		if (sari_t == 968) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 1075
		if (sari_t == 983) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 1090
		if (sari_t == 984) { DrTarget(DR_TARGET.MIRROR,315,2.4); }                                                            // soner 1110
		if (sari_t == 998) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 1105
		if (sari_t == 1013) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 1120
		if (sari_t == 1028) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 1135
		if (sari_t == 1039) { DrTarget(DR_TARGET.BIG,225,1.9); }                                                            // varis 1215
		if (sari_t == 1043) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 1150
		if (sari_t == 1058) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 1165
		if (sari_t == 1073) { DrTarget(DR_TARGET.NORMAL,0,3.2); }                                                            // varis 1180
		if (sari_t == 1088) { DrTarget(DR_TARGET.NORMAL,90,3.2); }                                                            // varis 1195
		if (sari_t == 1103) { DrTarget(DR_TARGET.NORMAL,180,3.2); }                                                            // varis 1210
		if (sari_t == 1118) { DrTarget(DR_TARGET.NORMAL,270,3.2); }                                                            // varis 1225
		if (sari_t == 1124) { DrTarget(DR_TARGET.MIRROR,0,2.4); }                                                            // soner 1250
		if (sari_t == 1164) { DrTarget(DR_TARGET.MIRROR,180,2.4); }                                                            // soner 1290
		if (sari_t == 1223) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 1330 (hat0)
		if (sari_t == 1233) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 1340 (hat0)
		if (sari_t == 1243) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 1350 (hat0)
		if (sari_t == 1243) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 1350 (hat1)
		if (sari_t == 1253) { DrTarget(DR_TARGET.NORMAL,45,3.2); }                                                            // varis 1360 (hat0)
		if (sari_t == 1253) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 1360 (hat1)
		if (sari_t == 1263) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 1370 (hat1)
		if (sari_t == 1263) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 1370 (hat2)
		if (sari_t == 1273) { DrTarget(DR_TARGET.NORMAL,135,3.2); }                                                            // varis 1380 (hat1)
		if (sari_t == 1273) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 1380 (hat2)
		if (sari_t == 1279) { DrTarget(DR_TARGET.BIG,0,1.9); }                                                            // varis 1455
		if (sari_t == 1283) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 1390 (hat2)
		if (sari_t == 1283) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 1390 (hat3)
		if (sari_t == 1293) { DrTarget(DR_TARGET.NORMAL,225,3.2); }                                                            // varis 1400 (hat2)
		if (sari_t == 1293) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 1400 (hat3)
		if (sari_t == 1303) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 1410 (hat3)
		if (sari_t == 1313) { DrTarget(DR_TARGET.NORMAL,315,3.2); }                                                            // varis 1420 (hat3)
		if (sari_t == 1319) { DrTarget(DR_TARGET.BIG,180,1.9); }                                                            // varis 1495

		if (sari_t == sari_son) { F2SariBitir(); }
	}


	//======================================================================
	// SERITLER -- asagidan yukariya suzulup gidis yonunu gosteriyorlar
	//======================================================================
	if (serit_on)
	{
		// Son bolumde turuncu ruh yok, yani carpan 1: seritler sabit hizda
		// akiyor. Kontrol yine de duruyor cunku ileride koridorda da
		// kullanilirsa dash ile hizlanmalari gerekir.
		var _sm = 1;
		if (instance_exists(battle_soul_orange_dr)) { _sm = battle_soul_orange_dr.world_mul; }
		var _sn = array_length(seritler);
		for (var _i = 0; _i < _sn; _i++)
		{
			var _sr = seritler[_i];
			_sr.y -= _sr.hiz*_sm;
			// Ustten cikan serit altta yeniden doguyor: sayilari sabit kaliyor.
			if (_sr.y+_sr.boy < 0) { seritler[_i] = F2SeritYap(true); }
		}
	}

	//======================================================================
	// KORIDORUN HER KARE CALISAN BOLUMLERI
	//======================================================================
	// Kutular, blaster isaretcileri, karusel ve Konuk. Hepsi kendi
	// bayragiyla kapali duruyor (box_on / car_on / gst_on), yani koridor
	// acilana kadar hicbiri calismiyor -- turun onceki kisimlarina
	// dokunmuyorlar.
	//======================================================================

	//======================================================================
	// 7. KISIM -- TURUNCU RUH KORIDORU
	//======================================================================
	// Sari bolum bitiyor, ekran karariyor, karanlikta kalp turuncuya
	// donuyor ve koridor aciliyor.
	//
	// TUR 18'DEN FARKLAR (hepsi zorluk yonunde):
	//   zincir bar sayisi 6-7 -> 9-10   zincirin kopmadan surmesi gereken
	//                                   mesafe uzadi
	//   mavi pencere      60  -> 52/48  hizalanma payi daraldi
	//   zincir sapmasi    +-20 -> +-30    kalp 50 px gidebiliyor, gereken 34
	//   ziplama zinciri   4   -> 6 ve 8 sekizlide dunya 1.97 kata cikiyor
	//   kutu sayisi       4   -> 5      son kutu bolumunde
	//   karusel: JumpUnit her ziplama zincirinin sonuna kendisi bir
	//   bileklik koyuyor (tur 18 de boyle). Serbest CarMark kullanilmiyor:
	//   kutu/zincir bolumlerinin uzerine binip pattern ic ice geciyordu.
	//   Konuk             8   -> 12     savurma sayisi
	//
	// TABAN HIZ 4'TE KALIYOR. 5 denendi ve uc pattern de oynanamaz oldu:
	// sarj 40 kare sabit, dunya %25 hizlaninca zincir barlarinda kalp 35 px
	// gidebilirken 64 px gerekiyordu, kutularda 60 kare varken 70 gerekiyordu.
	// Butun bar araliklari / kutu bosluklari / serit sapmalari bu hiza gore
	// hesaplandi; taban degistirilirse hepsi yeniden hesaplanmali.
	//
	// Bolum tetikleri kare degil YOL: dunya dash ile hizlandigi icin sabit
	// kareler iyi oynayan oyuncuya bosluk acardi.
	//
	// Bolumlerin KALBE VARDIGI yollar. Tur 18 gibi hicbiri ic ice degil:
	// her bolum bir oncekinden 110 px sonra basliyor. Patternler ust uste
	// binerse hasar almamak imkansiz oluyor.
	//   A  zincir barlari       440 -  1280
	//   B  kutular + blaster   1390 -  2760
	//   C  ziplama (3 halka)   2870 -  3780
	//   D  zincir + blaster    3890 -  4730
	//   E  ziplama (6 halka)   4840 -  6530
	//   F  kutular + blaster   6640 -  8010
	//   G  zincir barlari      8120 -  9040
	//   H  ziplama (8 halka)   9150 - 11360
	//   I  kutular + blaster  11470 - 13260
	//   J  final zinciri      13370 - 14290
	//   KONUK -- tek basina, koridor tamamen bittikten sonra (14450)
	//
	// Tek kasitli ust uste binme: zincir barlarinin arasindaki blaster.
	// Tur 18de de oyle.
	//======================================================================

	// Sari bittikten sonra ekran karariyor
	if (_timer == 8560) { Fader_Fade(0,1,30); }

	// Karanlikta degisim: kutu koridor bicimini aliyor, kalp turuncu
	if (_timer == 8600) { F2TuruncuBasla(); }

	// Ekran geri aciliyor, kalp artik turuncu
	if (_timer == 8620) { Fader_Fade(1,0,30); }

	//---------------------------------------------------------- koridor yolu
	if (instance_exists(battle_dr_corridor))
	{
		yol += battle_dr_corridor.scroll_spd;
	}

	//------------------------------------------------------- bolum tetikleri
	if (bolum == 0) and (_timer >= 8680)
	{
		bolum = 1;
		yol = 0;
		ChainRunX(8,120,56,[-22,22,-22,22,-22,22,-22,22]);	// A
	}

	if (bolum == 1) and (yol >= 795)
	{
		bolum = 2;
		BoxRun(4,104,110,310,40);							// B
		BlastMark(700,-1);
	}

	if (bolum == 2) and (yol >= 1730)
	{
		bolum = 3;
		JumpUnit(1100,[0,-55,50]);
	}

	if (bolum == 3) and (yol >= 3450)
	{
		bolum = 4;
		ChainRunX(8,120,56,[22,-22,22,-22,22,-22,22,-22]);	// D
		BlastMark(700,1);
	}

	if (bolum == 4) and (yol >= 3900)
	{
		bolum = 5;
		JumpUnit(900,[40,-40,45,-35,40,-40]);				// E: alti halka
	}

	if (bolum == 5) and (yol >= 6045)
	{
		bolum = 6;
		BoxRun(4,100,110,310,40);
		BlastMark(1200,-1);
	}

	if (bolum == 6) and (yol >= 7680)
	{
		bolum = 7;
		ChainRunX(9,115,56,[-22,22,-22,22,-22,22,-22,22,-22]);	// G
	}

	if (bolum == 7) and (yol >= 7960)
	{
		bolum = 8;
		JumpUnit(1150,[-35,35,-35,30,-35,35,-30,35]);
	}

	if (bolum == 8) and (yol >= 10875)
	{
		bolum = 9;
		BoxRun(5,100,110,310,40);							// I
		BlastMark(1100,1);
		BlastMark(1700,-1);
	}

	if (bolum == 9) and (yol >= 12930)
	{
		bolum = 10;
		ChainRunX(9,115,56,[22,-22,22,-22,22,-22,22,-22,22]);	// J: en dar pencere
	}

	//------------------------------------------------ FINAL: BEKLENMEDIK KONUK
	// Konuk bir mini-boss; baska patternlerle ayni anda calisirsa hasar
	// almamak imkansiz (guc dash 40 kare basili tutmak istiyor, o sure
	// boyunca oyuncu zaten kemik kirmakla mesgul). Koridor tamamen bittikten
	// SONRA, tek basina geliyor. Dunya akmaya devam ediyor ama artik hicbir
	// sey dogmuyor: tek is sarj edip dogru anda birakmak.
	// Guvenlik siniri: Konuk'un atilisi yana kacarak da atlatilabildigi icin
	// hic puskurtmeyen oyuncuda bolum sonsuza kadar surerdi.
	if (bolum == 10) and (yol >= atak_yol)
	{
		bolum = 11;
		GuestStart(12);
		konuk_son = yol+4200;
	}

	if (bolum == 11) and ((!gst_on) or (yol >= konuk_son))
	{
		bolum = 12;
		GuestStop();
		CarStop();
		DrCorridorStop();
		bitis_kare = _timer;
	}



	if (box_on) and (instance_exists(battle_soul))
	{
		var _kmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _kmul = battle_soul_orange_dr.world_mul; }
		// Kutular ve blasterlar barlarla ayni hizda kayiyor (bar spd_y'si 4),
		// boylece duvarlar kutulardan hic ayrilmiyor.
		// Koridorun taban hizindan okunuyor. Once sabit 4 yaziliydi (tur
		// 18'in taban hizi); taban degistirilince kutu kenarlari barlarla
		// desenkron kayiyordu.
		var _kay = battle_dr_corridor.scroll_base*_kmul;
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
			blasts[_i].y += battle_dr_corridor.scroll_base*_bmul;
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
		for (var _i = 0; _i < _cn; _i++) { cars[_i].y += battle_dr_corridor.scroll_base*_cmul; }

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
	// 8. KISIM -- SIYAH BOSLUK, UC KARAKTER BIRDEN
	//======================================================================
	// Konuk yenildi. Turuncu ruh yukari kayip ekrandan cikiyor, ekran
	// BEYAZA patliyor (RGB kaymasiyla), beyazin icinde kalp kirmiziya
	// donuyor ve kutu ekranin tamami oluyor. Geriye siyah bir bosluk
	// kaliyor; artik kacacak kenar yok.
	//
	// Ucu birden saldiriyor:
	//   Sans    devasa dairesel kemikler -- ice kapanan halkalar, tek kapi
	//   Alphys  yildirim boltlari -- carpacak yuzey olmadigi icin rastgele
	//           yuksekliklerde patliyorlar (o_alphys_bigbolt.serbest_y)
	//   Papyrus hancerler -- dort kenardan kalbe nisan aliyorlar
	//
	// Halkalarin kapisi her seferinde donuyor, yani oyuncu once kapiyi
	// bulup oraya gitmek zorunda; bunu yaparken boltlar ve hancerler
	// nereye gidebilecegini kisitliyor.
	//======================================================================

	if (bolum == 12) and (_timer == bitis_kare+30) { F2SonKayma(); }
	if (bolum == 12) and (_timer == bitis_kare+80) { F2SonBeyaz(); }
	if (bolum == 12) and (_timer == bitis_kare+100)
	{
		DrCorridorStop();
		F2SonAc();
	}
	if (bolum == 12) and (_timer == bitis_kare+130) { F2SonKapat(); }
	if (bolum == 12) and (_timer == bitis_kare+175) { F2FaderSiyah(); }

	if (son_on)
	{
		son_t += 1;

		//------------------------------------------- SANS: dairesel kemikler
		// 190 karede bir yeni halka. Yaricap 240, hiz 1.6 -> halka 150
		// karede merkeze variyor. Kemikler yaricap dogrultusunda durdugu
		// icin aralarinda bosluk var ve oyuncu oralardan geciyor; halka
		// kuculdukce bosluklar da daraliyor. Baslangic acisi her halkada
		// 55 derece donuyor ki bosluklar hep ayni yerde olmasin.
		if (son_t >= 60) and (son_t <= 1440)
		{
			if ((son_t-60) % 190 == 0)
			{
				var _k = (son_t-60) div 190;
				F2Cember(240,18,1.6,_k*55);
			}
		}

		//--------------------------------------------- ALPHYS: yildirimlar
		// 95 karede bir, rastgele sutunda ve rastgele yukseklikte.
		if (son_t >= 130) and (son_t <= 1460)
		{
			if ((son_t-130) % 95 == 0) { F2SerbestBolt(); }
		}

		//--------------------------------------------- PAPYRUS: hancerler
		// 80 karede bir, kenarlar sirayla donuyor.
		if (son_t >= 200) and (son_t <= 1480)
		{
			if ((son_t-200) % 80 == 0) { F2HancerNisan(((son_t-200) div 80) % 4); }
		}

		//------------------------------------------------------ kisim biter
		if (son_t == 1560)
		{
			son_on = false;
			son_bitis = _timer;
			F2SeritDur();
			with (o_alphys_bigbolt) { instance_destroy(); }
			with (o_alphys_bolt) { instance_destroy(); }
		}
	}


	//======================================================================
	// 9. KISIM -- MAVI RUH: YUKSELEN PLATFORM PARKURU
	//======================================================================
	// Basamaklar asagidan cikip yukari gidiyor; kalp ustlerinde durdugu
	// surece onlarla yukseliyor. Beklemek olum demek: hayatta kalmak icin
	// surekli bir alt basamaga atlamak gerekiyor.
	//
	// Basamaklar dar (90-150 px) ve saga sola kaydirilmis, bazilarinin
	// ucunda platforma BAGLI kemik var (platformla birlikte yukseliyor).
	// Yani her inis bir ziplama: ya kemigin ustunden atlayacaksin ya da
	// basamagin bos ucundan gececeksin.
	//
	// IKI ANI OLUM: ekranin altina dusmek (y > 500) ve tavana degmek
	// (y < 14). Kutunun tabani y=720'de, yani ekranin cok altinda:
	// boylece dusen kalp bir zemine konmuyor, gercekten dusuyor.
	//
	// Ustune yandan gelen dinamik kemikler, Alphys'in nisan alan
	// mizraklari ve Papyrus'un hancerleri biniyor. Ucu de kademeli
	// giriyor, ilk basamaklarda sadece parkur var.
	//======================================================================

	if (son_bitis > 0) and (_timer == son_bitis+60) { F2MaviKay(); }

	// Kayma bitti: mavi ruha geciliyor.
	if (mavi_gecis > 0)
	{
		mavi_gecis -= 1;
		if (mavi_gecis == 0) { F2MaviBasla(); }
	}

	//---------------------------------------------------- can gostergesi
	// Kalbin ustundeki "can / max can" yazisi. Onceki bolumlerde kutu
	// ekrani kapladigi ve alttaki UI gorunmedigi icin gerekiyordu.
	// SON ATAKTA KAPALI: orada kutu kucuk, alttaki can bari zaten
	// gorunuyor ve kalbin ustundeki yazi fazlalik kaliyordu.
	var _can = Player_GetHp();
	if (can_onceki < 0) { can_onceki = _can; }
	if (_can < can_onceki) and (!sf_on)
	{
		can_alpha = 1;
		can_bekle = can_bekle_max;
	}
	can_onceki = _can;
	if (can_bekle > 0) { can_bekle -= 1; }
	else if (can_alpha > 0) { can_alpha = max(0,can_alpha-can_sonme); }

	if (mavi_on)
	{
		mavi_t += 1;

		//--------------------------------------------------- basamaklar
		// 78 karede bir yeni basamak: 109 px / 1.4 px-kare.
		// Aralik 99'dan 109'a cikti ki guclendirilen ziplama (90 px)
		// bir ust basamaga yetismesin.
		// Dizi bitince uretim DURUYOR: onceden % ile basa sariyordu, yani
		// "son platform" diye bir sey olmuyordu. Son basamak ayrica
		// kaydediliyor, final onun uzerine konulunca basliyor.
		if ((mavi_t % 78) == 0) and (!mavi_final) and (mavi_adim < array_length(mavi_parkur))
		{
			var _sp = F2Basamak(mavi_parkur[mavi_adim]);
			if (mavi_adim == array_length(mavi_parkur)-1) { mavi_son = _sp; }
			mavi_adim += 1;
		}

		//--------------------------------------------- iki ani olum kosulu
		// Finalde kapali: kalp bilerek ortaya kayip hizla asagi iniyor,
		// acik kalsa alt cizgide olurdu.
		if (instance_exists(battle_soul)) and (!mavi_final)
		{
			// Esikler sinir kemik duvarlarinin IC KENARIYLA ayni:
			// duvara degmekle olmek ayni an oluyor, yoksa once kemikten
			// hasar alip sonra oluyordun.
			if (battle_soul.y > 460) { F2MaviOlum(); }		// alt duvara dedi
			if (battle_soul.y < 20)  { F2MaviOlum(); }		// ust duvara dedi
		}

		//------------------------------------------------- Alphys mizraklari
		// Spear3 kutu boyutundan bagimsiz: arenayi degistirmeden calisiyor.
		if (mavi_t >= 500) and (mavi_t <= 1980)
		{
			if ((mavi_t-500) % 170 == 0) { Spear3(); }
		}

		//---------------------------------------------- Papyrus hancerleri
		if (mavi_t >= 720) and (mavi_t <= 2020)
		{
			if ((mavi_t-720) % 260 == 0) { F2HancerNisan(((mavi_t-720) div 260) % 4); }
		}

		//------------------------------------------------ yatay blasterler
		// Ikinci yaridan itibaren: kalbin o andaki yuksekligine nisan alip
		// ekrani boydan boya kesiyorlar. Hazirlik ~45 kare, yani "hemen
		// yukseklik degistir" uyarisi. Buyuk ziplamalarla ayni bolgede
		// olduklari icin sadece kacmak degil, nereye kacacagini secmek
		// gerekiyor.
		if (mavi_t >= 1100) and (mavi_t <= 2020)
		{
			if ((mavi_t-1100) % 130 == 0)
			{
				// Kenar once degiskene aliniyor: uclu operatoru dogrudan
				// arguman icinde kullanmak GML'de guvenilir degil, blaster
				// her seferinde ayni yandan geliyordu.
				var _kn = ((mavi_t-1100) div 130) % 4;
				F2LabBlaster(_kn);
			}
		}

		//------------------------------------------------------ FINAL
		// Tetik SABIT KARE DEGIL: kalp son platformun uzerine konunca
		// basliyor. Onceden 2130'da basliyordu ve oyuncu o an hala
		// birkac basamak yukarida oluyordu.
		// battle_platform1 kalbin bindigi platformu battle_soul.inst_plat
		// icinde tutuyor.
		if (!mavi_final) and (instance_exists(mavi_son)) and (instance_exists(battle_soul))
		{
			if (battle_soul.inst_plat == mavi_son) { F2MaviFinal(); }
		}

		// Guvenlik: kalp son platforma hic konmazsa (yanindan gecip
		// ustteki bir basamakta kalabilir) final yine de baslasin.
		if (!mavi_final) and (mavi_t >= 2500) { F2MaviFinal(); }

		// Final zinciri kendi sayacinda: tetik degisken oldugu icin
		// sabit karelere baglanamaz.
		// Beyaz perde her kare hedefine dogru gidiyor. Anim sistemine
		// bagli degil: hedefi degistiren tek sey F2FinalBeyaz/F2FinalAcil.
		if (final_beyaz < final_beyaz_hedef)
		{
			final_beyaz = min(final_beyaz_hedef,final_beyaz+final_beyaz_ac);
		}
		else if (final_beyaz > final_beyaz_hedef)
		{
			final_beyaz = max(final_beyaz_hedef,final_beyaz-final_beyaz_kapa);
		}

		// Kalbin ekranin ortasina kaymasi: sabit adimlarla, elle.
		if (final_kay > 0) and (instance_exists(battle_soul))
		{
			battle_soul.x += final_kay_x;
			battle_soul.y += final_kay_y;
			final_kay -= 1;
			if (final_kay == 0)
			{
				battle_soul.x = 320;
				battle_soul.y = 240;
			}
		}

		// Inisler elle suruluyor: hizlanarak dusme, Anim_Create'e bagli
		// degil. Ilki ekranin altina, ikincisi kutunun dibine.
		if (final_dus1) and (instance_exists(battle_soul))
		{
			final_hiz += final_ivme;
			battle_soul.y += final_hiz;
			if (battle_soul.y >= 740) { final_dus1 = false; }
		}
		// Kutu ve gercek ruh her kare yerine sabitleniyor. Iptal
		// edilemeyen bir kutu animasyonu kalsa bile bu, onun uzerine
		// yaziyor -- savas ekrani kesin olarak yerinde duruyor.
		if (final_kutu)
		{
			battle_board.up = BATTLE_BOARD.UP;
			battle_board.down = BATTLE_BOARD.DOWN;
			battle_board.left = BATTLE_BOARD.LEFT;
			battle_board.right = BATTLE_BOARD.RIGHT;
			if (instance_exists(battle_soul)) and (battle_soul.moveable == 0)
			{
				battle_soul.x = battle_board.x;
				battle_soul.y = final_dip;
			}
		}

		// Sahte kalbin inisi: sadece bir sayi, cizimi Draw_0 yapiyor.
		// Kutuya "vardiginda" gercek ruh zaten dipte bekliyor, sahte
		// kalp kayboluyor ve perde kalkiyor.
		if (sahte_on)
		{
			sahte_hiz += final_ivme;
			sahte_y += sahte_hiz;
			if (sahte_y >= final_dip)
			{
				sahte_y = final_dip;
				F2FinalAcil();
			}
		}

		if (mavi_final)
		{
			final_t += 1;
			if (final_t == 50)  { F2FinalKirmizi(); }	// kirmizi + ortaya kayma (45 kare)
			if (final_t == 100) { F2FinalBeyaz(); }		// beyaz + RGB
			// Temizlik once: perde 116da tam opak oluyor, platformlar 118de
			// gorunmeden kalkiyor ve ANCAK ONDAN SONRA kalp asagi iniyor.
			// Onceden inis 115te basliyordu ve kalp daha duran
			// platformlarin arasindan geciyordu.
			if (final_t == 118) { F2FinalTemizle(); }
			if (final_t == 122) { F2FinalIn(); }		// mavi + hizli inis (40 kare)
			// Ilk inis 122de basliyor ve 82 kare suruyor (t=204).
			// 205: perde tam opakken gercek savas ekrani kuruluyor VE
			// sahte kalp ayni karede dusmeye basliyor.
			if (final_t == 205) { F2FinalSahne(); }
		}

		// Inis animasyonla suruldugu icin suresi kesin: 165 + 75 = 240.
		// Onceden battle_soul.jump_state beklenordu ama kalp kutunun
		// disinda basladigi icin o kontrol hic tetiklenmiyordu.

		// Perde soldukten sonra bolum kapaniyor.
		if (final_bitis > 0)
		{
			final_bitis -= 1;
			if (final_bitis == 0) { F2MaviBitir(); }
		}
	}





	//----------------------------------------------------- kapanis diyalogu
	// Balonlar sirayla: bir onceki kapaninca sonraki aciliyor. Sira
	// bitince tur kapaniyor ve motor faz gecisini devraliyor.
	// Diyalog bitti, toz soluyor: sayac dolunca tur kapaniyor.
	if (sf_dlg_bekle > 0)
	{
		sf_dlg_bekle -= 1;
		if (sf_dlg_bekle == 0)
		{
			sf_dlg = -1;
			sf_dlg_bekle = -1;

			// FINAL PHASE burada aciliyor: Sans artik bloklamiyor,
			// gercekten hasar aliyor ve muzik surrender'a geciyor.
			// Gorunum henuz degismiyor -- oyuncunun bu ilk vurusunu faz 2
			// Sans'i yiyor, yaralanmis hali sonraki turda geliyor
			// (bkz. scripts/P25).
			P25Baslat();

			Battle_EndTurn();
		}
	}

	// Kule donenlerin solmasi. Parcacik efekti aninda basliyor, sprite
	// da bu sure boyunca saydamlasiyor.
	// Dagilma sayaclari: karakterin alfasini artik burasi surmuyor
	// (F2SfToz aninda 0 yapiyor ve cizimi Draw_0 devraliyor), bunlar
	// sadece diyalogun efekt bitene kadar beklemesini sagliyor.
	if (sf_toz_pap > 0) { sf_toz_pap -= 1; }
	if (sf_toz_alp > 0) { sf_toz_alp -= 1; }

	// Dagilan karakterlerin sayaclari. Suresi dolan listeden dusuyor.
	for (var _dgi = array_length(sf_dag)-1; _dgi >= 0; _dgi--)
	{
		sf_dag[_dgi].t += 1;
		if (sf_dag[_dgi].t > SF_DAG_SUPUR+SF_DAG_OMUR)
		{
			array_delete(sf_dag,_dgi,1);
		}
	}

	if (sf_dlg >= 0) and (!instance_exists(battle_dialog_enemy))
	{
		if (sf_dlg < array_length(sf_dlg_metin))
		{
			var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
			_dlg.text = sf_dlg_metin[sf_dlg];
			// Diyalogdaki toz anlari: 4. balon Papyrus'un son sozu,
			// 7. balon Alphys'in. Balon kapanirken degil, balon ACILIRKEN
			// degil -- BIR SONRAKI balona gecerken tetikleniyor, yani
			// replik bitmis oluyor.
			if (sf_dlg == 4) { F2SfToz(true); }
			sf_dlg += 1;
		}
		else
		{
			// Son balon bitti: Alphys kule donuyor. Tur, solma bitene
			// kadar bekliyor (sf_dlg_bekle), yoksa efekt gorunmeden
			// menuye donuluyordu.
			if (sf_toz_alp < 0) and (sf_dlg_bekle < 0)
			{
				F2SfToz(false);
				sf_dlg_bekle = sf_toz_sure+20;
			}
		}
	}

	//======================================================================
	// SON ATAK -- atak20.gif'in birebir karsiligi
	//======================================================================
	// Kare numaralari GIF'ten dogrudan alindi: GIF 1740 kare / 29 sn = 60 fps
	// ve oyun da 60 fps, yani GIF kare numarasi = sf_t. Asagidaki her sabit
	// (kare no, px derinlik, hiz, aci) GIF karelerinin piksel taramasindan
	// cikti; ayrintili dokum icin bkz. Create_0'daki zaman cizelgesi.
	if (sf_bekle > 0)
	{
		sf_bekle -= 1;
		if (sf_bekle == 0) { F2SfBasla(); }
	}

	// Arka plan gradienti her kare hedefe dogru soluyor. Sifira inince
	// ekran GIF'teki gibi siyah kaliyor.
	if (sf_grad != sf_grad_hedef)
	{
		if (sf_grad > sf_grad_hedef) { sf_grad = max(sf_grad_hedef,sf_grad-0.02); }
		else                         { sf_grad = min(sf_grad_hedef,sf_grad+0.02); }
		with (o_bg_gradient) { image_alpha = other.sf_grad; }
	}

	//----------------------------------------------------- kutu kenarlari
	// Dort kenar BAGIMSIZ: GIF'te 333'te sadece sag kenar kayiyor, 353'te
	// sol/sag 16-21 karede giderken dikey kenarlar ayni anda 80 karelik
	// cok daha yavas bir gecis yapiyor. Tek bir kutu gecisi bunu veremiyor.
	if (instance_exists(battle_board))
	{
		for (var _ki = 0; _ki < 4; _ki++)
		{
			var _kk = sf_ken[_ki];
			if (!_kk.on) { continue; }
			_kk.t += 1;
			var _kp = min(1,_kk.t/_kk.sure);
			var _kv = lerp(_kk.v0,_kk.v1,_kp);
			switch (_ki)
			{
				case 0: battle_board.up    = _kv; break;
				case 1: battle_board.down  = _kv; break;
				case 2: battle_board.left  = _kv; break;
				case 3: battle_board.right = _kv; break;
			}
			if (_kp >= 1) { _kk.on = false; }
		}
	}

	//------------------------------------------------------ uyari seritleri
	for (var _ui = array_length(sf_uy)-1; _ui >= 0; _ui--)
	{
		sf_uy[_ui].kalan -= 1;
		if (sf_uy[_ui].kalan <= 0) { array_delete(sf_uy,_ui,1); }
	}

	//------------------------------------------------------------ taraklar
	// Kemiklerin BOYU her kare guncelleniyor: tarak iceri kayarak giriyor,
	// bir sure duruyor, sonra geri cekiliyor. Profil GIF'ten olculdu.
	for (var _ti = array_length(sf_tk)-1; _ti >= 0; _ti--)
	{
		var _tk = sf_tk[_ti];
		_tk.t += 1;
		var _oran = 0;
		if (_tk.t <= _tk.gir)
		{
			_oran = _tk.t/_tk.gir;
		}
		else if (_tk.t <= _tk.gir+_tk.tut)
		{
			_oran = 1;
		}
		else if (_tk.cik > 0)
		{
			_oran = 1-((_tk.t-_tk.gir-_tk.tut)/_tk.cik);
		}
		if (_oran <= 0)
		{
			F2SfSil(_tk.kemik);
			array_delete(sf_tk,_ti,1);
			continue;
		}
		var _tboy = max(1,_tk.derin*_oran*sf_cz);
		for (var _tj = 0; _tj < array_length(_tk.kemik); _tj++)
		{
			var _tb = _tk.kemik[_tj];
			if (instance_exists(_tb)) { _tb._length = _tboy; }
		}
	}

	//------------------------------------------------ koridorda sahne kaymasi
	// Kadro sola kayiyor; hepsi ekranin solundan cikinca kisa bir bekleme
	// olup sagdan tekrar giriyorlar. Kalp yerinde durdugu icin hareket
	// eden tek sey bu -- "saga dogru kosuyoruz" hissini o veriyor.
	if (sf_kay_on) and (instance_exists(battle_enemy_engage))
	{
		if (sf_kay_bekle > 0)
		{
			sf_kay_bekle -= 1;
			// Bekleme bitti: sahnenin sagina isinlanip yeniden basliyorlar.
			if (sf_kay_bekle == 0) { battle_enemy_engage.kay_x = sf_kay_uc; }
		}
		else
		{
			battle_enemy_engage.kay_x -= sf_kay_hiz;
			if (battle_enemy_engage.kay_x <= -sf_kay_uc) { sf_kay_bekle = 45; }
		}
	}

	// Koridorun mavi gorunumlu kalbi: gercekte SERBEST (kirmizi) ruh,
	// sadece sprite'i mavi. GIF'te koridorda yercekimi yok -- kalp iki
	// eksende de serbest hareket ediyor ama mavi gorunuyor.
	if (sf_mavi_gorunum) and (instance_exists(battle_soul))
	{
		battle_soul.sprite_index = spr_battle_soul_blue;
		battle_soul.image_angle = 90;
	}

	if (sf_on)
	{
		sf_t += 1;

		//------------------------------------------------ blaster halkasi
		// GIF: halka 2.7 derece/kare doniyor ve 2 karede bir yeni blaster
		// geliyor (olculen dis aci ilerlemesi ve kemer yogunlugu).
		if (sf_bl_on)
		{
			sf_bl_aci += SF_BL_DON;
			if (sf_t % 2 == 0) { F2SfBlaster(); }
		}

		//--------------------------------------------------------- ASAMA 1
		// GIF 24-178: mavi ruh, kutunun bir kenarina slam, once KIRMIZI
		// UYARI SERIDI (duvarin ayak izi), sonra o kenardan kemik taragi.
		// Uyari ~22 kare gorunuyor, tarak ~10 karede girip cekiliyor,
		// derinlik 24-27 px (serit 40-45 px).
		//
		// GIF'te bu uc slam sag/asagi/sol; bizde YONLER RASTGELE
		// (F2SfBasla dort kenardan ucunu kariyor). Zamanlama, derinlik ve
		// serit kalinligi GIF'ten aynen kaliyor -- degisen tek sey hangi
		// duvarin hedef oldugu. Ilk slam'in iki tarak turu var, digerlerinin
		// birer tane: bu da GIF'teki dagilim.
		if (sf_t == 24)
		{
			Battle_SetSoul(battle_soul_blue);
			sf_mavi_gorunum = false;
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
			battle_soul.moveable = 1;
			F2SfSlam(sf_slam[0]);
		}
		if (sf_t == 34)  { F2SfUyari(sf_slam[0],F2SfUyKal(sf_slam[0]),22); }
		if (sf_t == 58)  { F2SfTarak(sf_slam[0],25,4,2,3); }
		if (sf_t == 70)  { F2SfUyari(sf_slam[0],F2SfUyKal(sf_slam[0]),21); }
		if (sf_t == 94)  { F2SfTarak(sf_slam[0],27,4,2,3); }
		if (sf_t == 96)  { F2SfSlam(sf_slam[1]); }
		if (sf_t == 108) { F2SfUyari(sf_slam[1],F2SfUyKal(sf_slam[1]),21); }
		if (sf_t == 132) { F2SfTarak(sf_slam[1],27,4,3,3); }
		if (sf_t == 136) { F2SfSlam(sf_slam[2]); }
		if (sf_t == 146) { F2SfUyari(sf_slam[2],F2SfUyKal(sf_slam[2]),21); }
		if (sf_t == 169) { F2SfTarak(sf_slam[2],24,4,3,3); }

		//--------------------------------------------------------- ASAMA 2
		// GIF 151-345: ekrani DIKEY gecen 198 px'lik uzun yatay kemikler.
		// Iki serit: sol (merkez x 229) yukaridan asagi, sag (merkez 430)
		// asagidan yukari; her serit 40 karede bir, ucer kemik, 5.56 px/kare.
		if (sf_t == 151) or (sf_t == 191) or (sf_t == 231) { F2SfSuzul(229,true); }
		if (sf_t == 176) or (sf_t == 216) or (sf_t == 256) { F2SfSuzul(430,false); }

		// GIF 173: ruh kirmiziya doner, kare kutuda serbest.
		if (sf_t == 173)
		{
			Battle_SetSoul(battle_soul_red);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
		}

		//--------------------------------------------------------- ASAMA 3
		// GIF 305: kalp mavi GORUNUR ama serbest kalir.
		// GIF 333: once SADECE sag kenar aciliyor (7.65 px/kare).
		// GIF 353: sol kenar 15.1 px/kare ile kaciyor, sag kenar yavaslayip
		//          5.25 px/kare devam ediyor, dikey kenarlar ayni anda ama
		//          80 karelik cok daha yavas bir gecisle koridora iniyor.
		if (sf_t == 305)
		{
			Battle_SetSoul(battle_soul_red);
			battle_soul.moveable = 1;
			sf_mavi_gorunum = true;
		}
		// Kadro kaymasi kutu acilmaya baslarken devreye giriyor: kalp daha
		// sag duvara varmadan arka plan hareket etmeye basliyor.
		if (sf_t == 333) { sf_kay_on = true; }

		if (sf_t == 333) { F2SfKen(3,230,20); }
		if (sf_t == 353)
		{
			F2SfKen(2,SF_KOR_L,17);
			F2SfKen(3,SF_KOR_R,21);
			F2SfKen(0,SF_KOR_U,80);
			F2SfKen(1,SF_KOR_D,80);
		}

		//--------------------------------------------------------- ASAMA 4
		// GIF 432-607: koridorda 4 karede bir tavan/taban kemik cifti.
		// Aradaki bosluk hep 36 px; boslugun yeri 13 kemiklik sinus cizip
		// 275 ile 324 arasinda gidip geliyor (44 cift).
		if (sf_t >= 432) and (sf_t <= 608) and ((sf_t-432) % 4 == 0)
		{
			F2SfKorDalga(sf_dalga_i);
			sf_dalga_i += 1;
		}

		//--------------------------------------------------------- ASAMA 5
		// GIF 631-786: 9 adet 3'lu kemik grubu, tavan/taban donusumlu.
		// Aralar GIF'ten birebir (22,21,20,18,18,15,23,18 kare).
		if (sf_t == 631) { F2SfKorUclu(true);  }
		if (sf_t == 653) { F2SfKorUclu(false); }
		if (sf_t == 674) { F2SfKorUclu(true);  }
		if (sf_t == 694) { F2SfKorUclu(false); }
		if (sf_t == 712) { F2SfKorUclu(true);  }
		if (sf_t == 730) { F2SfKorUclu(false); }
		if (sf_t == 745) { F2SfKorUclu(true);  }
		if (sf_t == 768) { F2SfKorUclu(false); }
		if (sf_t == 786) { F2SfKorUclu(true);  }

		//--------------------------------------------------------- ASAMA 6
		// GIF 811-857: 2 karede bir (30 px arayla) 24 cift; bosluk her
		// ciftte 2 px daralarak 76'dan 30'a iniyor.
		if (sf_t >= 811) and (sf_t <= 857) and ((sf_t-811) % 2 == 0)
		{
			F2SfHuni(sf_huni_i);
			sf_huni_i += 1;
		}

		//--------------------------------------------------------- ASAMA 7
		// GIF 898-926: koridor sagdan kapaniyor (9.1 px/kare), dis sag
		// kenar 410'da duruyor. Sonra yarim koridorda bir uyari + tarak.
		//
		// Kapanma baslarken kalp GERCEK mavi ruha donuyor ve saga slam
		// ediliyor: koridorun dalga/huni bolumu serbest hareket
		// istiyordu, ama daralan kutuda GIF'teki gibi saga savrulup sag
		// duvara yapismasi ve oradan ziplayabilmesi gerekiyor. Sahte mavi
		// gorunum kapaniyor, yoksa Step her kare image_angle'i ezip mavi
		// ruhun yercekimi yonunu gostermesini engellerdi.
		if (sf_t == 898)
		{
			F2SfKen(3,SF_KOR_YARIM_R,28);
			Battle_SetSoul(battle_soul_blue);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
			Battle_SlamRight();
		}
		if (sf_t == 978)  { F2SfUyari(DIR.RIGHT,48,22); }
		if (sf_t == 1002) { F2SfTarak(DIR.RIGHT,50,5,26,0); }

		//--------------------------------------------------------- ASAMA 8
		// GIF 1031-1055: ekran UI dahil TAMAMEN siyah, 25 kare.
		if (sf_t == 1031) { F2SfSiyah(); }
		if (sf_t == 1056) { F2SfSiyahBit(); }

		//--------------------------------------------------------- ASAMA 9
		// GIF 1058-1312: kare kutuda dort tur daha. Bu sefer uyari cogu
		// zaman IKI kenarda birden ve tarak cok daha derin (42-52 px).
		// GIF'te dongu 58 kare: uyari (~35) -> tarak (~12) -> slam.
		//
		// FARK: her turun ARASINA 8. asamadaki gibi TAM SIYAH perde
		// konuldu (SF_KARA = 25 kare). Slam de perdenin arkasinda
		// atiliyor, yani perde kalktiginda kalp yeni duvarina yapismis
		// oluyor. Her ara perde sonraki her seyi 25 kare oteliyor, o
		// yuzden asagidaki kare numaralari GIF'inkinden +0 / +25 / +50 /
		// +75 kaydirilmis halde.
		//
		//   tur A  uyari 1058  tarak 1093            (GIF ile ayni)
		//   siyah  1108 - 1133
		//   tur B  uyari 1141  tarak 1178            (+25)
		//   siyah  1190 - 1215
		//   tur C  uyari 1224  tarak 1262            (+50)
		//   siyah  1274 - 1299
		//   tur D  uyari 1306  tarak 1344            (+75)

		// ---- tur A
		if (sf_t == 1058)
		{
			F2SfUyari(DIR.UP,47,34);
			F2SfUyari(DIR.DOWN,48,34);
		}
		if (sf_t == 1093)
		{
			F2SfTarak(DIR.UP,42,6,8,0);
			F2SfTarak(DIR.DOWN,48,6,8,0);
		}
		if (sf_t == 1108) { F2SfKara(DIR.UP); }
		if (sf_t == 1133) { F2SfKaraBit(); }

		// ---- tur B
		if (sf_t == 1141)
		{
			F2SfUyari(DIR.LEFT,48,36);
			F2SfUyari(DIR.UP,47,36);
		}
		if (sf_t == 1178)
		{
			F2SfTarak(DIR.LEFT,48,5,6,0);
			F2SfTarak(DIR.UP,47,5,6,0);
		}
		if (sf_t == 1190) { F2SfKara(DIR.DOWN); }
		if (sf_t == 1215) { F2SfKaraBit(); }

		// ---- tur C
		if (sf_t == 1224)
		{
			F2SfUyari(DIR.RIGHT,48,36);
			F2SfUyari(DIR.DOWN,48,36);
		}
		if (sf_t == 1262)
		{
			F2SfTarak(DIR.RIGHT,51,5,6,0);
			F2SfTarak(DIR.DOWN,52,5,6,0);
		}
		if (sf_t == 1274) { F2SfKara(DIR.UP); }
		if (sf_t == 1299) { F2SfKaraBit(); }

		// ---- tur D
		if (sf_t == 1306) { F2SfUyari(DIR.LEFT,48,37); }

		// GIF 1269 (+75): ruh kirmiziya doner (blaster halkasinda serbest
		// kacis) ve ayni karede soldan gelen SON tarak baslar: 7 karede
		// giriyor, 31 kare duruyor, 6 karede geri cekiliyor.
		if (sf_t == 1344)
		{
			Battle_SetSoul(battle_soul_red);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
			F2SfTarak(DIR.LEFT,44,7,31,6);
		}

		//-------------------------------------------------------- ASAMA 10
		// GIF 1281 (+75 = 1356): dev gaster blaster halkasi.
		// Uretim SF_BL_DUR'da kesiliyor, atak SF_BL_BITIS'te bitiyor:
		// aradaki 150 kare, son blaster'in ucup ates edip isinini
		// sondurmesi icin (~125 kare). Onceki halinde bu ara 60 kareydi
		// ve kapanis diyalogu son isinlari yarida kesiyordu.
		// Blaster halkasindan ONCE Sans'in bosta durma animasyonu final
		// faz temposuna iniyor. O ana kadarki hizli salinimla dev halkaya
		// girmek dogal durmuyordu; burada yavaslayip sakinlesiyor.
		// Gecis yumusak: battle_enemy_engage/Step_0 hedefe lerp ile gidiyor.
		if (sf_t == 1150) { global.p2_anim_hedef = 0.2; }

		if (sf_t == 1356) { F2SfHalka(); }
		if (sf_t == SF_BL_DUR) { sf_bl_on = false; }

		// Atak biter, kapanis diyalogu baslar.
		if (sf_t == SF_BL_BITIS) { F2SfBitir(); }
	}
}
