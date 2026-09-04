var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (teslim_cikis) and (_timer >= teslim_kare+T20_TESLIM_KARARMA+T20_TESLIM_BEKLE)
	{
		global.surrender_turn = false;
		global.surrender_son = true;
		audio_stop_all();
		room_goto(room_area_aftersans);
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
	if (_timer == T20_YV_BAS)
	{
		with (o_p1final_sansgbfront) { manuel = true; }
		with (o_p1final_gbtop)       { manuel = true; }
		with (o_smaaash)
		{
			hiz = 0;
			prev_frame = -1;
			image_index = 0;
			_ready = true;
		}
		catlak_ox = clamp(329-battle_board.x,-battle_board.left+14,battle_board.right-14);
		catlak_oy = (battle_board.down-battle_board.up)/2;
		yv_on = true;
		yv_no = 0;
		yv_asama = 0;
		yv_t = 0;
	}
	YvAdim();
	CatlakAdim();

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

	if (_timer == T20_VOID_BAS) { VoidKir(); }
	if (_timer == T20_BEYAZ_ACIL) { Fader_Fade(1,0,T20_BEYAZ_CIKIS); }
	VoidAdim();

	if (_timer == T20_SANS_DUSUS)
	{
		with (o_p1final_fall)
		{
			gizli = false;
			image_index = 0;
			x = -68;
			y = -512;
			target_x = -68;
			target_y = 372;
			move_speedy = 0.02;
			p1finalattack = true;
		}
	}

	if (_timer == T20_SANS_DUSUS+T20_DUSUS_SURE)
	{
		with (o_p1final_fall)
		{
			p1finalattack = false;
			image_alpha = 0;
		}
	}

	if (_timer == T20_GB_GELIS) { GbGelis(); }
	if (_timer == T20_GB_GOZ)   { GbGoz(); }

	if (_timer >= T20_CEM_BAS) and (cem_no < T20_CEM_ADET)
	and (((_timer-T20_CEM_BAS) mod T20_CEM_ARA) == 0)
	{
		CemberEkle((cem_no mod 2 == 0) ? 1 : -1);
		cem_no += 1;
	}
	CemberAdim();


	if (_timer == T20_P2_BAS) { Gb2Basla(); }
	Gb2Adim();
	if (_timer == T20_P2_SON) { Gb2Bitir(); SonBasla(); }
	SonAdim();

	var _can = Player_GetHp();
	if (can_onceki < 0) { can_onceki = _can; }
	if (_can < can_onceki) and (_timer >= T20_VOID_BAS) and (_timer < T20_VOID_SON)
	{
		can_alpha = 1;
		can_bekle = can_bekle_max;
	}
	can_onceki = _can;
	if (can_bekle > 0) { can_bekle -= 1; }
	else if (can_alpha > 0) { can_alpha = max(0,can_alpha-can_sonme); }

	if (_timer == T20_VOID_SON) { VoidBitir(); SonPerdeKapat(); }
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
        
			var dir = point_direction(o_p1final_gbsans.x, o_p1final_gbsans.y, battle_soul.x, battle_soul.y);
	        slash.direction = dir;
	        slash.speed = 7;
	        slash.image_angle = dir + 180;

	        attack_done = true;
	    }
	}
	else
	{
	    attack_done = false;
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
	if (_timer == T20_FIN_DUS_BAS)
	{
		if (!instance_exists(o_p1final_fall_1))
		{
			instance_create_depth(-64,-608,-99999,o_p1final_fall_1);
		}
		with (o_p1final_fall_1)
		{
			move_speedy = 0;
			target_y = y;
			image_index = 0;
			image_speed = 0;
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
		RegularBlasterCircle(battle_board.x,battle_board.y,3.2,175,8,45,8,20,1,500);

		Anim_Destroy(id,"sf_grad");
		Anim_Create(id,"sf_grad",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,sf_grad,-sf_grad,240);
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
				if (!teslim_cikis)
				{
					teslim_cikis = true;
					teslim_kare = _timer;
					Fader_Fade(0,1,T20_TESLIM_KARARMA);
				}
			}
			else
			{
				audio_sound_gain(snd_chance,1,0);
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
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		battle_enemy_engage._wiggle = true;
	}

	if (_timer == 20)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(71,65,80,80,18);
		Battle_SetSoul(battle_soul_red);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
	}

	if (_timer == 38)
	{
		F2Ust(4,84);
		F2Alt(-4,84);
	}

	if (_timer == 72)
	{
		F2Ust(-4,84);
		F2Alt(4,84);
	}

	if (_timer == 112) { Battle_SlamUp(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 124) { F2Ust(-5,24); }
	if (_timer == 132) { F2Ust(-5,42); }
	if (_timer == 140) { F2Ust(-5,60); }
	if (_timer == 148) { F2Ust(-5,78); }
	if (_timer == 156) { F2Ust(-5,96); }

	if (_timer == 196) { F2Bosluk(5,0); }
	if (_timer == 214) { F2Bosluk(5,0); }
	if (_timer == 232) { F2Bosluk(5,0); }
	if (_timer == 250) { F2Bosluk(5,0); }

	if (_timer == 290) { F2Ust(-5,24); F2Ust(5,24); }
	if (_timer == 298) { F2Ust(-5,42); F2Ust(5,42); }
	if (_timer == 306) { F2Ust(-5,60); F2Ust(5,60); }
	if (_timer == 314) { F2Ust(-5,78); F2Ust(5,78); }
	if (_timer == 322) { F2Ust(-5,96); F2Ust(5,96); }

	if (_timer == 370) { Battle_SlamDown(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 384)
	{
		F2InenYatay(2);
		F2AltBlaster(-46);
		F2AltBlaster(46);
	}

	if (_timer == 460)
	{
		F2UstBlaster(-56);
		F2UstBlaster(56);
	}
	if (_timer == 470) { F2Bosluk(5,2);  }
	if (_timer == 470) { F2Bosluk(-5,2); }
	if (_timer == 510) { F2Bosluk(5,2);  }
	if (_timer == 510) { F2Bosluk(-5,2); }

	if (_timer == 570) { F2Bosluk(5,1);  }
	if (_timer == 570) { F2Bosluk(-5,1); }
	if (_timer == 610) { F2Bosluk(5,1);  }
	if (_timer == 610) { F2Bosluk(-5,1); }

	if (_timer == 660)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(71,65,85,85,20);
	}

	if (_timer == 690) { Battle_SlamDown(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 710) { F2MaviYelpaze(); }

	if (_timer == 790) { F2Duvar(DIR.DOWN,52,45,120); }

	if (_timer == 880)
	{
		Battle_SlamRight();
		audio_play_sound(snd_impact,2,false);
	}

	if (_timer >= 910) and (_timer <= 1090)
	{
		if ((_timer-910) % 18 == 0) { F2Gecit(5,(_timer-910)/18,54); }
	}

	if (_timer == 1130)
	{
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(71,65,23,23,24);
	}

	if (_timer == 1160) { Battle_SlamLeft(); audio_play_sound(snd_impact,2,false); }

	if (_timer == 1190)
	{
		F2SolaBlaster(-46);
		F2SolaBlaster(46);
	}

	if (_timer == 1270) { F2SolaBlaster(0); }

	if (_timer == 1350)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(71,65,85,85,26);
	}

	if (_timer == 1400)
	{
		F2Duvar(DIR.LEFT,58,50,60);
		F2Duvar(DIR.RIGHT,58,50,60);
		F2Duvar(DIR.UP,44,50,60);
		F2Duvar(DIR.DOWN,44,50,60);
	}

	if (_timer == 1460)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_red);
	}


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

	if (_timer > 1560) and (_timer < 2520)
	{
		F2DenizAdim(34,120,3,50,70);
		F2PlatformAdim();
	}

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

	if (_timer == 2520)
	{
		F2DenizTemizle();
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}



	if (f2_kol_geri > 0) and (_timer == f2_kol_geri) { F2KolGeri(); }


	if (_timer == 2560)
	{
		SpearArena(4);
		Battle_SetSoul(battle_soul_red);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
	}

	if (_timer >= 2620) and (_timer <= 2795)
	{
		if ((_timer-2620) % 26 == 0) { Spear4(); }
	}

	if (_timer == 2835) { SpearArena(5); }

	if (_timer >= 2895) and (_timer <= 3070)
	{
		if ((_timer-2895) % 45 == 0) { Spear5(); }
	}

	if (_timer == 2935) { AlphysShocker(battle_board.x-120,battle_board.y+battle_board.down-4,40); }
	if (_timer == 2984) { AlphysShocker(battle_board.x+ 70,battle_board.y+battle_board.down-4,40); }
	if (_timer == 3033) { AlphysShocker(battle_board.x- 40,battle_board.y+battle_board.down-4,40); }

	if (_timer == 3110) { SpearArena(3); }

	if (_timer >= 3170) and (_timer <= 3345)
	{
		if ((_timer-3170) % 20 == 0) { Spear3(); }
	}

	if (_timer == 3210) { AlphysBigBolt(battle_board.x-44,-60,270,6,5,2.4); }
	if (_timer == 3330) { AlphysBigBolt(battle_board.x+38,-60,270,6,7,2.4); }

	if (_timer == 3385)
	{
		SpearArena(2);
		F2KolFirlat(3835);
		f2_s1_next = 3445;
		f2_s1_n = 0;
		f2_s1_ang = 0;
	}

	if (_timer >= 3445) and (_timer <= 3620)
	{
		if (_timer >= f2_s1_next)
		{
			Spear1(f2_s1_ang);
			f2_s1_ang += 32;
			f2_s1_next = _timer+Spear1Gap(f2_s1_n);
			f2_s1_n += 1;
		}
	}

	if (_timer == 3660) { Spear2Speed(true); }

	if (_timer >= 3660) and (_timer <= 3835)
	{
		if ((_timer-3660) % 70 == 0) { Spear2(); }
	}

	if (f2_kol_geri > 0) and (instance_exists(o_fakebone))
	{
		var _el = F2El();
		o_fakebone.x = _el.ex;
		o_fakebone.y = _el.ey;
	}

	if (_timer >= 3445) and (_timer <= 3805)
	{
		if ((_timer-3445) % 180 == 0) { F2DonenKemik(7,9); }
	}

	if (_timer == 3875)
	{
		Spear2Speed(false);
		with (o_alphys_spear) { instance_destroy(); }
		with (o_alphys_hammer) { instance_destroy(); }
		with (o_alphys_shocker) { instance_destroy(); }
		with (o_alphys_bolt) { instance_destroy(); }
		F2KolGeri();
	}



	if (_timer == 3935)
	{
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,120,120,30);
	}

	if (_timer >= 3995) and (_timer <= 5195)
	{
		if ((_timer-3995) % 60 == 0) { F2AltGrup(2.5); }
	}

	if (_timer >= 4055) and (_timer <= 5235)
	{
		if ((_timer-4055) % 120 == 0) { F2GrupVur(); }
	}

	if (_timer == 4335) { F2NisanBlaster(true); }
	if (_timer == 4535) { F2NisanBlaster(false); }
	if (_timer == 4735) { F2NisanBlaster(true); }
	if (_timer == 4935) { F2NisanBlaster(false); }
	if (_timer == 5135) { F2NisanBlaster(true); }

	if (_timer >= 4635) and (_timer <= 5235)
	{
		if ((_timer-4635) % 120 == 0) { Spear3(); }
	}

	if (_timer == 5335)
	{
		with (o_alphys_spear) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
	}



	if (_timer == 5395) { F2SariBasla(); }

	if (sari_on)
	{
		sari_t += 1;

		if (sari_t == 43) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 54) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 65) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 76) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 87) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 98) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 109) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 120) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 131) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 142) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 153) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 164) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 175) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 186) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 197) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 208) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 233) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 243) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 255) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 265) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 277) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 287) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 299) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 309) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 321) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 331) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 343) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 353) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 365) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 375) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 387) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 397) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 423) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 439) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 455) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 464) { DrTarget(DR_TARGET.BIG,45,1.9); }
		if (sari_t == 471) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 487) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 503) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 519) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 524) { DrTarget(DR_TARGET.BIG,225,1.9); }
		if (sari_t == 535) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 551) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 567) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 583) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 584) { DrTarget(DR_TARGET.BIG,135,1.9); }
		if (sari_t == 599) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 615) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 631) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 647) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 663) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 693) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 704) { DrTarget(DR_TARGET.MIRROR,90,2.4); }
		if (sari_t == 709) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 725) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 739) { DrTarget(DR_TARGET.MIRROR,270,2.4); }
		if (sari_t == 741) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 757) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 764) { DrTarget(DR_TARGET.BIG,90,1.9); }
		if (sari_t == 773) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 789) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 805) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 821) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 829) { DrTarget(DR_TARGET.BIG,270,1.9); }
		if (sari_t == 837) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 853) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 869) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 893) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 894) { DrTarget(DR_TARGET.MIRROR,45,2.4); }
		if (sari_t == 908) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 923) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 924) { DrTarget(DR_TARGET.MIRROR,135,2.4); }
		if (sari_t == 938) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 953) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 954) { DrTarget(DR_TARGET.MIRROR,225,2.4); }
		if (sari_t == 964) { DrTarget(DR_TARGET.BIG,45,1.9); }
		if (sari_t == 968) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 983) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 984) { DrTarget(DR_TARGET.MIRROR,315,2.4); }
		if (sari_t == 998) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 1013) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 1028) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 1039) { DrTarget(DR_TARGET.BIG,225,1.9); }
		if (sari_t == 1043) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 1058) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 1073) { DrTarget(DR_TARGET.NORMAL,0,3.2); }
		if (sari_t == 1088) { DrTarget(DR_TARGET.NORMAL,90,3.2); }
		if (sari_t == 1103) { DrTarget(DR_TARGET.NORMAL,180,3.2); }
		if (sari_t == 1118) { DrTarget(DR_TARGET.NORMAL,270,3.2); }
		if (sari_t == 1124) { DrTarget(DR_TARGET.MIRROR,0,2.4); }
		if (sari_t == 1164) { DrTarget(DR_TARGET.MIRROR,180,2.4); }
		if (sari_t == 1223) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 1233) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 1243) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 1243) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 1253) { DrTarget(DR_TARGET.NORMAL,45,3.2); }
		if (sari_t == 1253) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 1263) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 1263) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 1273) { DrTarget(DR_TARGET.NORMAL,135,3.2); }
		if (sari_t == 1273) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 1279) { DrTarget(DR_TARGET.BIG,0,1.9); }
		if (sari_t == 1283) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 1283) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 1293) { DrTarget(DR_TARGET.NORMAL,225,3.2); }
		if (sari_t == 1293) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 1303) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 1313) { DrTarget(DR_TARGET.NORMAL,315,3.2); }
		if (sari_t == 1319) { DrTarget(DR_TARGET.BIG,180,1.9); }

		if (sari_t == sari_son) { F2SariBitir(); }
	}


	if (serit_on)
	{
		var _sm = 1;
		if (instance_exists(battle_soul_orange_dr)) { _sm = battle_soul_orange_dr.world_mul; }
		var _sn = array_length(seritler);
		for (var _i = 0; _i < _sn; _i++)
		{
			var _sr = seritler[_i];
			_sr.y -= _sr.hiz*_sm;
			if (_sr.y+_sr.boy < 0) { seritler[_i] = F2SeritYap(true); }
		}
	}



	if (_timer == 6995) { Fader_Fade(0,1,1); }

	if (_timer == 7035) { F2TuruncuBasla(); }

	if (_timer == 7055) { Fader_Fade(1,0,1); }

	if (instance_exists(battle_dr_corridor))
	{
		yol += battle_dr_corridor.scroll_spd;
	}

	if (bolum == 0) and (_timer >= 7115)
	{
		bolum = 1;
		yol = 0;
		ChainRunX(8,120,56,[-22,22,-22,22,-22,22,-22,22]);
	}

	if (bolum == 1) and (yol >= 795)
	{
		bolum = 2;
		BoxRun(4,104,110,310,40);
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
		ChainRunX(8,120,56,[22,-22,22,-22,22,-22,22,-22]);
		BlastMark(700,1);
	}

	if (bolum == 4) and (yol >= 3900)
	{
		bolum = 5;
		JumpUnit(900,[40,-40,45,-35,40,-40]);
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
		ChainRunX(9,115,56,[-22,22,-22,22,-22,22,-22,22,-22]);
	}

	if (bolum == 7) and (yol >= 7960)
	{
		bolum = 8;
		JumpUnit(1150,[-35,35,-35,30,-35,35,-30,35]);
	}

	if (bolum == 8) and (yol >= 10875)
	{
		bolum = 9;
		BoxRun(5,100,110,310,40);
		BlastMark(1100,1);
		BlastMark(1700,-1);
	}

	if (bolum == 9) and (yol >= 12930)
	{
		bolum = 10;
		ChainRunX(9,115,56,[22,-22,22,-22,22,-22,22,-22,22]);
	}

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
		var _kay = battle_dr_corridor.scroll_base*_kmul;
		var _nb = array_length(boxes);
		for (var _i = 0; _i < _nb; _i++) { boxes[_i].y += _kay; }

		for (var _i = 0; _i < _nb; _i++)
		{
			var _kb = boxes[_i];
			if (battle_soul.y > _kb.y-_kb.h/2) and (battle_soul.y < _kb.y+_kb.h/2)
			{
				var _kcx = battle_board.x+_kb.ox;
				battle_soul.x = clamp(battle_soul.x,_kcx-_kb.w/2+9,_kcx+_kb.w/2-9);
			}
		}

		for (var _i = _nb-1; _i >= 0; _i--)
		{
			if (boxes[_i].y-boxes[_i].h/2 > 520) { array_delete(boxes,_i,1); }
		}
		if (array_length(boxes) == 0) { box_on = false; }
	}

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

	if (car_on)
	{
		var _cmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _cmul = battle_soul_orange_dr.world_mul; }
		car_ang += car_spin*(1+(_cmul-1)*0.4);
		var _cn = array_length(cars);
		for (var _i = 0; _i < _cn; _i++) { cars[_i].y += battle_dr_corridor.scroll_base*_cmul; }

		for (var _i = _cn-1; _i >= 0; _i--)
		{
			if (cars[_i].y > 560) { array_delete(cars,_i,1); }
		}
		_cn = array_length(cars);
		if (_cn == 0) { car_on = false; }

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
					if (_sg.on <= 0.15) { continue; }
					var _kal = 5*_sg.sc/2+2;
					if (battle_soul.x+_sw > min(_sg.x1,_sg.x2)) and (battle_soul.x-_sw < max(_sg.x1,_sg.x2))
					and (battle_soul.y+_sh > _sg.y-_kal) and (battle_soul.y-_sh < _sg.y+_kal)
					{
						if (global.kr)
						{
							if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
						}
						else
						{
							Battle_HurtNormal(DMG_CAR);
						}
					}
				}
			}
		}
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
			if (instance_exists(battle_soul_orange_dr))
			{
				battle_soul_orange_dr.speed_boost = 1;
			}
			var _gd = point_direction(gst_x,gst_y,gst_tx,gst_ty);
			gst_x += lengthdir_x(gst_spd,_gd);
			gst_y += lengthdir_y(gst_spd,_gd);
			if (gst_y > 520) or (gst_t > 90)
			{
				gst_state = 3;
				gst_t = 0;
				gst_rvx = 0;
				gst_rvy = 0;
			}
		}
		else
		{
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
			else if (gst_state == 2) and (_gmes <= 30) and (kon_tep_t < 0)
			{
				if (global.kr)
				{
					if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
				}
				else
				{
					Battle_HurtNormal(DMG_GUEST);
				}

				var _yon = sign(battle_soul.x-gst_x);
				if (_yon == 0) { _yon = choose(-1,1); }
				kon_tep_x0  = battle_soul.x;
				kon_tep_hed = clamp(kon_tep_x0+_yon*T18_TEP_MESAFE,
				                    battle_board.x-battle_board.left+10,
				                    battle_board.x+battle_board.right-10);
				kon_tep_t = 0;
				battle_soul.moveable = false;

				var _kd = point_direction(battle_soul.x,battle_soul.y,gst_x,gst_y);
				gst_rvx = lengthdir_x(12,_kd);
				gst_rvy = lengthdir_y(12,_kd);
				gst_state = 3;
				gst_t = 0;
				gst_flash = 14;
				audio_play_sound(snd_impact,0,false);
				Camera_Shake(5,5,3,3);
			}
		}
	}

	if (kon_tep_t >= 0)
	{
		if (instance_exists(battle_soul))
		{
			kon_tep_t += 1;
			if (kon_tep_t <= T18_TEP_ITME)
			{
				var _tk = kon_tep_t/T18_TEP_ITME;
				battle_soul.x = lerp(kon_tep_x0,kon_tep_hed,1-(1-_tk)*(1-_tk));
			}
			else
			{
				var _tk = min(1,(kon_tep_t-T18_TEP_ITME)/T18_TEP_DONUS);
				battle_soul.x = lerp(kon_tep_hed,kon_tep_x0,_tk*_tk*(3-2*_tk));
				if (_tk >= 1)
				{
					battle_soul.x = kon_tep_x0;
					battle_soul.moveable = true;
					kon_tep_t = -1;
				}
			}
		}
		else
		{
			kon_tep_t = -1;
		}
	}



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

		if (son_t >= 60) and (son_t <= 1440)
		{
			if ((son_t-60) % 190 == 0)
			{
				var _k = (son_t-60) div 190;
				F2Cember(240,18,1.6,_k*55);
			}
		}

		if (son_t >= 130) and (son_t <= 1460)
		{
			if ((son_t-130) % 200 == 0) { F2SerbestBolt(); }
		}


		if (son_t == 1560)
		{
			son_on = false;
			son_bitis = _timer;
			F2SeritDur();
			with (o_alphys_bigbolt) { instance_destroy(); }
			with (o_alphys_bolt) { instance_destroy(); }
		}
	}



	if (son_bitis > 0) and (_timer == son_bitis+60) { F2MaviKay(); }

	if (mavi_gecis > 0)
	{
		mavi_gecis -= 1;
		if (mavi_gecis == 0) { F2MaviBasla(); }
	}

	var _tam_kutu = false;
	if (instance_exists(battle_board))
	{
		_tam_kutu = (battle_board.x-battle_board.left  <=   2)
		        and (battle_board.x+battle_board.right >= 638)
		        and (battle_board.y-battle_board.up    <=   2)
		        and (battle_board.y+battle_board.down  >= 478);
	}
	var _can = Player_GetHp();
	if (can_onceki < 0) { can_onceki = _can; }
	if (_can < can_onceki) and (_tam_kutu)
	{
		can_alpha = 1;
		can_bekle = can_bekle_max;
	}
	can_onceki = _can;
	if (!_tam_kutu) { can_alpha = 0; can_bekle = 0; }
	else if (can_bekle > 0) { can_bekle -= 1; }
	else if (can_alpha > 0) { can_alpha = max(0,can_alpha-can_sonme); }

	if (mavi_on)
	{
		mavi_t += 1;

		if ((mavi_t % 78) == 0) and (!mavi_final) and (mavi_adim < array_length(mavi_parkur))
		{
			var _sp = F2Basamak(mavi_parkur[mavi_adim]);
			if (mavi_adim == array_length(mavi_parkur)-1) { mavi_son = _sp; }
			mavi_adim += 1;
		}

		if (instance_exists(battle_soul)) and (!mavi_final)
		{
			if (battle_soul.y > 460) { F2MaviOlum(); }
			if (battle_soul.y < 20)  { F2MaviOlum(); }
		}

		if (mavi_t >= 500) and (mavi_t <= 1980)
		{
			if ((mavi_t-500) % 280 == 0) { Spear3(); }
		}


		if (mavi_t >= 1100) and (mavi_t <= 2020)
		{
			if ((mavi_t-1100) % 130 == 0)
			{
				var _kn = ((mavi_t-1100) div 130) % 4;
				F2LabBlaster(_kn);
			}
		}

		if (!mavi_final) and (instance_exists(mavi_son)) and (instance_exists(battle_soul))
		{
			if (battle_soul.inst_plat == mavi_son) { F2MaviFinal(); }
		}

		if (!mavi_final) and (mavi_t >= 2500) { F2MaviFinal(); }

		if (final_beyaz < final_beyaz_hedef)
		{
			final_beyaz = min(final_beyaz_hedef,final_beyaz+final_beyaz_ac);
		}
		else if (final_beyaz > final_beyaz_hedef)
		{
			final_beyaz = max(final_beyaz_hedef,final_beyaz-final_beyaz_kapa);
		}

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

		if (final_dus1) and (instance_exists(battle_soul))
		{
			final_hiz += final_ivme;
			battle_soul.y += final_hiz;
			if (battle_soul.y >= 740) { final_dus1 = false; }
		}
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
			if (final_t == 50)  { F2FinalKirmizi(); }
			if (final_t == 100) { F2FinalBeyaz(); }
			if (final_t == 118) { F2FinalTemizle(); }
			if (final_t == 122) { F2FinalIn(); }
			if (final_t == 205) { F2FinalSahne(); }
		}


		if (final_bitis > 0)
		{
			final_bitis -= 1;
			if (final_bitis == 0) { F2MaviBitir(); }
		}
	}





	if (sf_dlg_bekle > 0)
	{
		sf_dlg_bekle -= 1;
		if (sf_dlg_bekle == 0)
		{
			sf_dlg = -1;
			sf_dlg_bekle = -1;

			P25Baslat();

			Battle_EndTurn();
		}
	}

	if (sf_toz_pap > 0) { sf_toz_pap -= 1; }
	if (sf_toz_alp > 0) { sf_toz_alp -= 1; }

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
			if (sf_dlg == 4) { F2SfToz(true); }
			sf_dlg += 1;
		}
		else
		{
			if (sf_toz_alp < 0) and (sf_dlg_bekle < 0)
			{
				F2SfToz(false);
				sf_dlg_bekle = sf_toz_sure+20;
			}
		}
	}

	if (sf_bekle > 0)
	{
		sf_bekle -= 1;
		if (sf_bekle == 0) { F2SfBasla(); }
	}

	if (sf_grad != sf_grad_hedef)
	{
		if (sf_grad > sf_grad_hedef) { sf_grad = max(sf_grad_hedef,sf_grad-0.006); }
		else                         { sf_grad = min(sf_grad_hedef,sf_grad+0.006); }
		with (o_bg_gradient) { image_alpha = other.sf_grad; }
	}

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

	for (var _ui = array_length(sf_uy)-1; _ui >= 0; _ui--)
	{
		sf_uy[_ui].kalan -= 1;
		if (sf_uy[_ui].kalan <= 0) { array_delete(sf_uy,_ui,1); }
	}

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

	if (sf_kay_on) and (instance_exists(battle_enemy_engage))
	{
		if (sf_kay_bekle > 0)
		{
			sf_kay_bekle -= 1;
			if (sf_kay_bekle == 0) { battle_enemy_engage.kay_x = sf_kay_uc; }
		}
		else
		{
			battle_enemy_engage.kay_x -= sf_kay_hiz;
			if (battle_enemy_engage.kay_x <= -sf_kay_uc) { sf_kay_bekle = 45; }
		}
	}

	if (sf_kay_dur == 1)
	{
		if (instance_exists(battle_soul_blue)) and (battle_soul_blue.impact == 1) { sf_kay_dur = 2; }
	}
	else if (sf_kay_dur == 2)
	{
		if ((!instance_exists(battle_soul_blue)) or (battle_soul_blue.impact == 0))
		{
			sf_kay_on = false;
			sf_kay_bekle = 0;
			sf_kay_dur = 0;
		}
	}

	if (sf_mavi_gorunum) and (instance_exists(battle_soul))
	{
		battle_soul.sprite_index = spr_battle_soul_blue;
		battle_soul.image_angle = 90;
	}

	if (sf_on)
	{
		sf_t += 1;

		if (sf_bl_on)
		{
			sf_bl_aci += SF_BL_DON;
			if (sf_t % 2 == 0) { F2SfBlaster(); }
		}

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

		if (sf_t == 151) or (sf_t == 191) or (sf_t == 231) { F2SfSuzul(229,true); }
		if (sf_t == 176) or (sf_t == 216) or (sf_t == 256) { F2SfSuzul(430,false); }

		if (sf_t == 173)
		{
			Battle_SetSoul(battle_soul_red);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
		}

		if (sf_t == 305)
		{
			Battle_SetSoul(battle_soul_red);
			battle_soul.moveable = 1;
			sf_mavi_gorunum = true;
		}
		if (sf_t == 333) { sf_kay_on = true; }

		if (sf_t == 333) { F2SfKen(3,230,20); }
		if (sf_t == 353)
		{
			F2SfKen(2,SF_KOR_L,17);
			F2SfKen(3,SF_KOR_R,21);
			F2SfKen(0,SF_KOR_U,80);
			F2SfKen(1,SF_KOR_D,80);
		}

		if (sf_t >= 432) and (sf_t <= 608) and ((sf_t-432) % 4 == 0)
		{
			F2SfKorDalga(sf_dalga_i);
			sf_dalga_i += 1;
		}

		if (sf_t == 631) { F2SfKorUclu(true);  }
		if (sf_t == 653) { F2SfKorUclu(false); }
		if (sf_t == 674) { F2SfKorUclu(true);  }
		if (sf_t == 694) { F2SfKorUclu(false); }
		if (sf_t == 712) { F2SfKorUclu(true);  }
		if (sf_t == 730) { F2SfKorUclu(false); }
		if (sf_t == 745) { F2SfKorUclu(true);  }
		if (sf_t == 768) { F2SfKorUclu(false); }
		if (sf_t == 786) { F2SfKorUclu(true);  }

		if (sf_t >= 811) and (sf_t <= 857) and ((sf_t-811) % 2 == 0)
		{
			F2SfHuni(sf_huni_i);
			sf_huni_i += 1;
		}

		if (sf_t == 898)
		{
			F2SfKen(3,SF_KOR_YARIM_R,28);
			Battle_SetSoul(battle_soul_blue);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
			F2SfSlam(DIR.RIGHT);
			sf_kay_dur = 1;
		}
		if (sf_t == 978)  { F2SfUyari(DIR.RIGHT,48,22); }
		if (sf_t == 1002) { F2SfTarak(DIR.RIGHT,50,5,26,0); }

		if (sf_t == 1031) { F2SfSiyah(); }
		if (sf_t == 1056) { F2SfSiyahBit(); }


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
		if (sf_t == 1108) { F2SfKara(DIR.UP,DIR.LEFT,DIR.UP); }
		if (sf_t == 1133) { F2SfKaraBit(); }

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
		if (sf_t == 1190) { F2SfKara(DIR.DOWN,DIR.RIGHT,DIR.DOWN); }
		if (sf_t == 1215) { F2SfKaraBit(); }

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
		if (sf_t == 1274) { F2SfKara(DIR.UP,DIR.LEFT); }
		if (sf_t == 1299) { F2SfKaraBit(); }

		if (sf_t == 1306) { F2SfUyari(DIR.LEFT,48,37); }

		if (sf_t == 1344)
		{
			Battle_SetSoul(battle_soul_red);
			sf_mavi_gorunum = false;
			battle_soul.moveable = 1;
			F2SfTarak(DIR.LEFT,44,7,31,6);
		}

		if (sf_t == 1150) { global.p2_anim_hedef = 0.2; }

		if (sf_t == 1356)
		{
			F2SfHalka();
			if (audio_is_playing(global.p2_bgm)) { audio_sound_gain(global.p2_bgm,0.3,1000); }
		}
		if (sf_t == SF_BL_DUR)
		{
			sf_bl_on = false;
			if (audio_is_playing(global.p2_bgm)) { audio_sound_gain(global.p2_bgm,0,2500); }
		}

		if (sf_t == SF_BL_BITIS)
		{
			if (audio_is_playing(global.p2_bgm)) { audio_stop_sound(global.p2_bgm); }
			F2SfBitir();
		}
	}
}
