if(global.sansphase == 0)
{
	y = ynew
	ynew = (battle_board.y-battle_board.up)-10;

	if global.kr=false{
		if(instance_exists(hurtkr)){
			instance_destroy(hurtkr)
		}
	}

	if index_img > 8{
		index_img=0
	}
	index_img+=0.5/2;

	if (game_get_speed(gamespeed_fps) != 60)
	    game_set_speed(60, gamespeed_fps);

	//Angular Movement Shit
	wing_angle = sin(current_time / 100 * wing_speed) * 30;  // 30 = max angle
	arm_angle  = sin(current_time / 100 * arm_speed)  * 15;
	head_angle = sin(current_time / 100 * head_speed) * 3;

	timer++;
	if global.invinvible > 0{
		global.invinvible-=1;
	}

	if (_wiggle){
		slam_counter=0;
		slam_image=0;
		slam_alpha=0;
	
		_timee+=0.5;
		_body_x=sin(_timee*0.1)*-2.2/2;
		_body_y=sin(_timee*0.2)*-1.6/2;
	    //_head_x=sin(_timee*0.1)*-0.1;
	    //_head_y=sin(_timee*0.2)*0.1;
	}else{
		_body_x=0
		_body_y=0
		_head_y=0
		_head_x=0
		_armleft_x=0
		_armleft_x1=0
		_armright_x=0
		_armright_x1=0
	}
	/*if global.sans_mode = 0{
		_head_sprite=spr_papyrus_head
		_body_sprite=spr_papyrus_body
		leg_sprite=spr_papyrus_legs
	
		_head_init_x=0;
		_head_init_y=-26;
		_body_init_x=-1;
		_body_init_y=-20;
	}else if global.sans_mode = 1{
		_head_sprite=spr_sans_miss_head
		_body_sprite=spr_sans_miss_body
		leg_sprite=spr_sans_miss_legs
	
		_head_init_x=-2;
		_head_init_y=-24;
		_body_init_x=4;
		_body_init_y=-21;
	}*/

	squish = lerp(squish,1,0.1);
	squish = clamp(squish,0,6969);

	var num=sprite_get_number(_body_sprite);

	_body_image +=_body_speed;
	if(_body_image>=num){
		if(_body_loop){
			_body_image=0;
			if amk = 0{
			alarm[2]=25
			amk=1
			}
		}else{
			_body_image=num-1;
			_body_speed=0;
			amk=0
		}
	}

	/*if(action==SANS_ACTION.STATIC)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=false;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.IDLE)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=true;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.LEFT)
	{
		if(_action_step <= 4){
			switch _action_step
			{
				case 0:
         
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break;
	            case 1:
	                _body_x = 5;
	                break;
	            case 2:
	                _body_x = 6;
	                break;
	            case 3:
	                _body_x = -3;
	                break;
	            case 4:
	                _body_x = -2;
	                break;
				case 5:
	                _body_x = 0;
	                break;
			}
	        _action_step += 0.25
		}
	}
	else if(action==SANS_ACTION.RIGHT)
	{
		if(_action_step <= 5){
	        switch _action_step
	        {
	            case 0:
               
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break
	            case 1:
	                _body_x = -5;
	                break;
	            case 2:
	                _body_x = -6;
	                break;
	            case 3:
	                _body_x = 3;
	                break;
	            case 4:
	                _body_x = 2;
	                break;
	            case 5:
	                _body_x = 0;
	                break;
	        }
	        _action_step += 0.25
	    }
	}
	else if(action==SANS_ACTION.DOWN)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=-1;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false
					break;
				case 1:
					_body_y=-3;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=3;
			     	 break;
				case 3:
					_body_y=2;
					break;
			}
			_action_step+=0.2;
		}
	}
	else if(action==SANS_ACTION.UP)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=3;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false;
					break;
				case 1:
					_body_y=5;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=-1;
					break;
				case 3:
					_body_y=0;
					break;
			}
			_action_step+=0.2;
		}
	}*/
}
if(global.sansphase == 1)
{
	y = ynew
	ynew = (battle_board.y-battle_board.up)-10;

	if global.kr=false{
		if(instance_exists(hurtkr)){
			instance_destroy(hurtkr)
		}
	}

	if index_img > 8{
		index_img=0
	}
	index_img+=0.5/2;

	if (game_get_speed(gamespeed_fps) != 60)
	    game_set_speed(60, gamespeed_fps);

	//Angular Movement Shit
	wing_angle = sin(current_time / 100 * wing_speed) * 30;  // 30 = max angle
	arm_angle  = sin(current_time / 100 * arm_speed)  * 15;
	head_angle = sin(current_time / 100 * head_speed) * 3;
	// FAZ 2 SANS'ININ BOSTA DURMA HIZI
	// Son atagin sonunda, blaster halkasindan once Sans bilerek
	// yavaslatiliyor: o ana kadarki tempoyla halkaya girmek dogal
	// durmuyordu, final fazdaki sakin nefes alisina gecmesi gerekiyor.
	// global.p2_anim_hiz 1 = normal, 0.2 = final faz temposu; hedefe
	// yumusak gecis yapiyor ki hiz aniden dusmesin.
	// Zaman current_time yerine kendi birikeninden okunuyor -- carpani
	// dogrudan current_time'a uygulasaydik hiz her degistiginde salinim
	// faz atlardi.
	global.p2_anim_hiz = lerp(global.p2_anim_hiz,global.p2_anim_hedef,0.01);
	p2_anim_t += 16.6667*global.p2_anim_hiz;

	p2_wing_angle_diddler = sin(p2_anim_t / 100 * p2_wing_speed_diddler) * 90;  // 30 = max angle
	p2_arm_angle_diddler  = sin(p2_anim_t / 100 * p2_arm_speed_diddler)  * 15;
	p2_head_angle_diddler = sin(p2_anim_t / 100 * p2_head_speed_diddler) * 3;

	timer++;
	if global.invinvible > 0{
		global.invinvible-=1;
	}

	if (_wiggle){
		slam_counter=0;
		slam_image=0;
		slam_alpha=0;
	
		_timee+=0.5*global.p2_anim_hiz;
		//p2_body_x=sin(_timee*0.1)*-2.2/2;
		// Genlik /4 iken ciziimde ~0.8px kaliyordu ve bacak skew'i fark edilmiyordu.
		p2_body_y=sin(_timee*0.1)*-1.6;
	    //_head_x=sin(_timee*0.1)*-0.1;
	    //_head_y=sin(_timee*0.2)*0.1;
	}else{
		p2_body_x=0
		p2_body_y=0
		p2_head_y=0
		p2_head_x=0
		p2_armleft_x=0
		p2_armright_x=0
	}
	/*if global.sans_mode = 0{
		_head_sprite=spr_papyrus_head
		_body_sprite=spr_papyrus_body
		leg_sprite=spr_papyrus_legs
	
		_head_init_x=0;
		_head_init_y=-26;
		_body_init_x=-1;
		_body_init_y=-20;
	}else if global.sans_mode = 1{
		_head_sprite=spr_sans_miss_head
		_body_sprite=spr_sans_miss_body
		leg_sprite=spr_sans_miss_legs
	
		_head_init_x=-2;
		_head_init_y=-24;
		_body_init_x=4;
		_body_init_y=-21;
	}*/

	squish = lerp(squish,1,0.1);
	squish = clamp(squish,0,6969);

	var num=sprite_get_number(_body_sprite);

	_body_image +=_body_speed;
	if(_body_image>=num){
		if(_body_loop){
			_body_image=0;
			if amk = 0{
			alarm[2]=25
			amk=1
			}
		}else{
			_body_image=num-1;
			_body_speed=0;
			amk=0
		}
	}

	/*if(action==SANS_ACTION.STATIC)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=false;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.IDLE)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=true;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.LEFT)
	{
		if(_action_step <= 4){
			switch _action_step
			{
				case 0:
         
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break;
	            case 1:
	                _body_x = 5;
	                break;
	            case 2:
	                _body_x = 6;
	                break;
	            case 3:
	                _body_x = -3;
	                break;
	            case 4:
	                _body_x = -2;
	                break;
				case 5:
	                _body_x = 0;
	                break;
			}
	        _action_step += 0.25
		}
	}
	else if(action==SANS_ACTION.RIGHT)
	{
		if(_action_step <= 5){
	        switch _action_step
	        {
	            case 0:
               
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break
	            case 1:
	                _body_x = -5;
	                break;
	            case 2:
	                _body_x = -6;
	                break;
	            case 3:
	                _body_x = 3;
	                break;
	            case 4:
	                _body_x = 2;
	                break;
	            case 5:
	                _body_x = 0;
	                break;
	        }
	        _action_step += 0.25
	    }
	}
	else if(action==SANS_ACTION.DOWN)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=-1;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false
					break;
				case 1:
					_body_y=-3;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=3;
			     	 break;
				case 3:
					_body_y=2;
					break;
			}
			_action_step+=0.2;
		}
	}
	else if(action==SANS_ACTION.UP)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=3;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false;
					break;
				case 1:
					_body_y=5;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=-1;
					break;
				case 3:
					_body_y=0;
					break;
			}
			_action_step+=0.2;
		}
	}*/

	//////////////////////////////////////////////////////////////////////////
	// PHASE 2 SAHNE ANIMASYONU (Sans / Papyrus / Alphys)
	//////////////////////////////////////////////////////////////////////////

	pap_wiggle += 1;
	alp_wiggle += 1;

	// Nefes salinimi. Govde, kafa ve kollar birlikte inip cikar; ayaklar yerde
	// sabit kalir, bacak sprite'i Draw_0'da draw_sprite_pos ile gerilip sikisir
	// (Clickteam'daki skew efektinin karsiligi, sadece y ekseninde).
	pap_bob = sin(pap_wiggle*0.025)*4;
	alp_bob = sin(alp_wiggle*0.030+1.7)*3;

	// Kol acilari. Sans'in kollarindaki gibi, ama her biri farkli periyotta
	// olsun diye ayri hizlar ve faz kaymalari kullaniliyor.
	pap_arm_angle      = sin(pap_wiggle*0.018)*3;
	alp_armleft_angle  = sin(alp_wiggle*0.015+0.6)*2.5;
	alp_armright_angle = sin(alp_wiggle*0.021+2.2)*3;

	// Papyrus'un kemik duvari: vurus aninda yukselir, bekler, sonra iner
	var _bwn = sprite_get_number(pap_block_sprite);
	switch (pap_block_state)
	{
		case 0:
			pap_block_image = 0;
			break;

		case 1:		// yukseliyor
			pap_block_image += pap_block_speed;
			if (pap_block_image >= _bwn-1)
			{
				pap_block_image = _bwn-1;
				pap_block_timer = pap_block_hold;
				pap_block_state = 2;
			}
			break;

		case 2:		// tepede bekliyor
			pap_block_timer -= 1;
			if (pap_block_timer <= 0) { pap_block_state = 3; }
			break;

		case 3:		// iniyor
			pap_block_image -= pap_block_speed;
			if (pap_block_image <= 0)
			{
				pap_block_image = 0;
				pap_block_state = 0;
			}
			break;
	}

	// Alphys'in gozundeki parlama efekti
	var _eye_n = sprite_get_number(alp_eye_sprite);
	alp_eye_image += 0.08;
	if (alp_eye_image >= _eye_n)
	{
		alp_eye_image -= _eye_n;
	}
	// Gozu kapali kafa karelerinde (spr_alphys_head 6-8) efekti gosterme
	alp_eye_visible = !((alp_head_sprite == spr_alphys_head) and (alp_head_image >= 6));

	//------------------------------------------------------------------
	// Hizalama: sahnedeki karakter sayisina gore ekrani esit parcalara bol
	//------------------------------------------------------------------
	var _on_pap = (pap_state == 1 or pap_state == 2);
	var _on_p2  = (p2_state  == 1 or p2_state  == 2);
	var _on_alp = (alp_state == 1 or alp_state == 2);
	var _n = _on_pap + _on_p2 + _on_alp;

	// Sahnede olmayanlar ekranin disinda bekler
	var _pap_t = off_left;
	var _p2_t  = off_left;
	var _alp_t = off_right;

	if (_n > 0)
	{
		var _span = 640 - layout_margin*2;
		var _i = 0;
		// soldan saga: Papyrus, Sans, Alphys
		if (_on_pap) { _pap_t = layout_margin + _span*(_i+0.5)/_n; _i += 1; }
		if (_on_p2)  { _p2_t  = layout_margin + _span*(_i+0.5)/_n; _i += 1; }
		if (_on_alp) { _alp_t = layout_margin + _span*(_i+0.5)/_n; _i += 1; }
	}

	// Sahne disinda bekleyenler ve canlandirma bitisinde isinlananlar
	if (pap_state == 0) or (pap_snap) { pap_draw_x = _pap_t; pap_snap = false; }
	if (alp_state == 0) or (alp_snap) { alp_draw_x = _alp_t; alp_snap = false; }
	if (p2_state  == 0) or (p2_snap)  { p2_draw_x = _p2_t;  p2_snap = false; }

	pap_draw_x = lerp(pap_draw_x,_pap_t,layout_speed);
	alp_draw_x = lerp(alp_draw_x,_alp_t,layout_speed);
	// FINAL PHASE kacisi: sahte iskalamada Sans yana kayip ORADA kaliyor.
	// Kaymayi nesnenin x'ine degil YERLESIM HEDEFINE ekliyoruz -- ciziim
	// konumu p2_draw_x'ten geliyor (p2_off_x = p2_draw_x - x) ve bu deger
	// her kare hedefe lerp ediliyor, yani x'i oynatmak hicbir sey yapmiyordu.
	_p2_t += global.p25_kacis;

	p2_draw_x  = lerp(p2_draw_x,_p2_t,layout_speed);

	if (pap_state == 1) and (abs(pap_draw_x-_pap_t) < 2) { pap_state = 2; }
	if (alp_state == 1) and (abs(alp_draw_x-_alp_t) < 2) { alp_state = 2; }
	if (p2_state  == 1) and (abs(p2_draw_x-_p2_t)  < 2)  { p2_state  = 2; }

	if (pap_state == 3) and (pap_draw_x < off_left+10)  { pap_state = 0; }
	if (alp_state == 3) and (alp_draw_x > off_right-10) { alp_state = 0; }
	if (p2_state  == 3) and (p2_draw_x  < off_left+10)  { p2_state  = 0; }

	// Sans'in nesne x'i degismiyor (konusma balonu, hedefleme ve saldirilar
	// ona bagli); sadece ciziim kaydirmasi hareket ediyor.
	p2_off_x = p2_draw_x - x;
	p2_offstage = (p2_state != 2);
	// Sahne disindayken hedef listesinden cikar
	_not_targetable = p2_offstage;

	//------------------------------------------------------------------
	// FIGHT hedef listesi: sahnede duran karakterler dusman slotu olarak
	// kaydediliyor, sahneden cikinca siliniyor. Boylece hangi turda kime
	// saldirilabilecegi otomatik olarak sahnedeki kadroya bagli kaliyor.
	// Slot 0 = Papyrus, slot 1 = Sans, slot 2 = Alphys.
	//------------------------------------------------------------------
	var _pap_live = (pap_state == 2) and (pap_alpha > 0);
	if (_pap_live != instance_exists(Battle_GetEnemy(0)))
	{
		if (_pap_live)
		{
			Battle_SetEnemy(o_p2_papyrus,0);
		}
		else
		{
			// Once slottan cikar (kendi _enemy_slot'unu sifirlayabilsin), sonra sil
			var _old = Battle_GetEnemy(0);
			Battle_RemoveEnemy(0);
			if (instance_exists(_old)) { instance_destroy(_old); }
		}
	}

	var _alp_live = (alp_state == 2) and (alp_alpha > 0);
	if (_alp_live != instance_exists(Battle_GetEnemy(2)))
	{
		if (_alp_live)
		{
			Battle_SetEnemy(o_p2_alphys,2);
		}
		else
		{
			var _old = Battle_GetEnemy(2);
			Battle_RemoveEnemy(2);
			if (instance_exists(_old)) { instance_destroy(_old); }
		}
	}
}
if (global.checkornot == true)
{
	instance_destroy(battle_dialog_enemy);
}
// FAZ 1'IN SON POZU -- SADECE FAZ 1 ODASINDA.
// global.p1sanshp vurus indikten sonra hic sifirlanmiyor (o_credits'e
// kadar acik kaliyor), bu blokta oda kontrolu YOKTU: faz 2'ye gecince de
// her kare _head_image = 15 yaziliyordu. Faz 2'nin kafasi spr_p2_head
// iken bu degeri KARE INDISI olarak kullaniyor (Draw_0), yani Sans'in
// yuzu faz 2 boyunca faz 1'in yarali karesinde takili kaliyordu.
if (global.p1sanshp == true) and (room == room_battle)
{
	// Sans yarali pozunda kaliyor -- gecis boyunca da boyle duruyor.
	_head_image = 15;
	_head_alpha = 1;
	_body_alpha = 1;
	_legs_alpha1 = 1;

	// FAZ 1 -> FAZ 1.5. Asamalar ve gerekce Create_0'da.
	if (room == room_battle)
	{
		p15_gecis += 1;

		// Perde inerken EKRANDA REPLIK OLMASIN. Vurus turu bitirdigi
		// icin motor menuye/replige donuyordu; hazirligi Other_18'de
		// kestik ama o ana kadar acilmis bir balon kalabiliyor.
		if (instance_exists(battle_dialog_enemy)) { instance_destroy(battle_dialog_enemy); }
		Battle_SetMenuDialog("");

		if (p15_gecis == 1)
		{
			// Darbe aninda sarsinti; muzik de bu andan itibaren soluyor.
			// snd_chance dogrudan audio_play_sound ile calindigi icin
			// gain ASSET uzerinden veriliyor (butun ornekleri etkiler).
			Camera_Shake(6,6,3,3);
			audio_sound_gain(snd_chance,0,(P15_BEKLE+P15_KARARMA)*(1000/60));
		}

		if (p15_gecis == P15_BEKLE)
		{
			fader.color = c_black;
			Fader_Fade(0,1,P15_KARARMA);
		}

		if (p15_gecis >= P15_BEKLE+P15_KARARMA+P15_SIYAH)
		{
			room_goto(room_p15);
		}
	}
}
if (room == room_battle)
{
	global.sansphase = 0;
}
if (room == room_battle_1)
{
	global.sansphase = 1;
	// HASAR SISTEMI: faz 2 KARMA degil, klasik hasar kullaniyor. Bayrak her
	// kare zorlaniyor cunku baska yerler de (battle_ui/Create_0) kuruyor;
	// olup yeniden baslama dongusunde bir kare bile KR'ye dusmesin.
	// Degerler: scripts/Macro_Battle -- "FAZ 2 -- NORMAL HASAR SISTEMI".
	global.kr = false;
}

// ==================================================================
//  GAME OVER MESAJ BILGISI
//  Olum ANINDA degil, HER KARE yaziliyor. Boylece oyuncuyu hangi kod
//  yolu oldururse oldursun bayrak zaten guncel oluyor; odayi degistiren
//  tarafin bir sey yapmasi gerekmiyor.
//    1 = Sans, 2 = Papyrus, 4 = Alphys sahnede (faz 2 kadrosu)
//    8 = oyuncu MERHAMET turundeyken oldu
//  Merhamet biti 60 kare tutuluyor: mizrak sahnesi oyuncuyu turun icinde
//  olduruyor ama tur nesnesi ayni karede yok edilirse bit kacmasin.
// ==================================================================
// Bitler TOPLAMAYLA kuruluyor, bitsel VEYA ile degil: GML'de bitsel islemin
// sonucu int64 tipinde oluyor ve okuyan taraftaki is_real() int64 icin FALSE
// donuyor -- maske sessizce sifirlaniyordu.
var _go_cast = 0;
if (room == room_battle_1)
{
	if (p2_state  == 1) or (p2_state  == 2) { _go_cast += 1; }	// Sans
	if (pap_state == 1) or (pap_state == 2) { _go_cast += 2; }	// Papyrus
	if (alp_state == 1) or (alp_state == 2) { _go_cast += 4; }	// Alphys
}
if (instance_exists(battle_skip_turn_1)) { go_mercy_hold = 60; }
else if (go_mercy_hold > 0)              { go_mercy_hold--; }
if (go_mercy_hold > 0) { _go_cast += 8; }

Flag_Set(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_CAST, _go_cast);
