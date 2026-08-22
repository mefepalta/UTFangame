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
	p2_wing_angle_diddler = sin(current_time / 100 * p2_wing_speed_diddler) * 90;  // 30 = max angle
	p2_arm_angle_diddler  = sin(current_time / 100 * p2_arm_speed_diddler)  * 15;
	p2_head_angle_diddler = sin(current_time / 100 * p2_head_speed_diddler) * 3;

	timer++;
	if global.invinvible > 0{
		global.invinvible-=1;
	}

	if (_wiggle){
		slam_counter=0;
		slam_image=0;
		slam_alpha=0;
	
		_timee+=0.5;
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
if (global.p1sanshp == true)
{
	if (room == room_battle)
	{
		room_goto(room_p15);
	}
	_head_image = 15;
	_head_alpha = 1;
	_body_alpha = 1;
	_legs_alpha1 = 1;
}
if (room == room_battle)
{
	global.sansphase = 0;
}
if (room == room_battle_1)
{
	global.sansphase = 1;
}