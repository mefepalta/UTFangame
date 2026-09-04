var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 10)
	{
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBlaster(270,-50,270,top_box-100,270,270,100,1,2,2,50);
		RegularBlaster(370,-50,370,top_box-100,270,270,100,1,2,2,50);
	}
	if (_timer == 120)
	{
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 190)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 220)
	{
		Battle_SlamDown();
	}
	if (_timer == 230)
	{
		RegularBone(right_box,top_box,84,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,79,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,top_box,74,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,top_box,69,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,top_box,64,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,top_box,59,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,top_box,54,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,top_box,49,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,top_box,44,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,top_box,39,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,top_box,34,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,top_box,29,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,29,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,bottom_box,34,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,bottom_box,39,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,bottom_box,44,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,bottom_box,49,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,bottom_box,54,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,bottom_box,59,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,bottom_box,69,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,bottom_box,74,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,79,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 290)
	{
		RegularBone(left_box,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-20,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-30,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-40,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-50,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-60,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 320) and (_timer < 720) and (_timer % 40 == 0)
	{
		RegularBone(left_box,bottom_box,20,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,102,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,20,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,102,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-110,bottom_box,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,152,-5,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer = 760)
	{
		RegularBoneWall(DIR.LEFT,135,13,110,left_box,top_box,50,50,0,false);
		RegularBoneWall(DIR.RIGHT,135,13,110,right_box,top_box,50,50,0,false);
	}
	if (_timer = 770)
	{
		RegularBlaster(320,-50,right_box + 60,bottom_box - 20,180,180,20,1,2,2,50);
	}
	if (_timer == 820)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer > 840) and (_timer < 1200) and (_timer % 40 == 0)
	{
		RegularBone(left_box - 110,bottom_box,82,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,82,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 110,bottom_box,82,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1240)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* The weight of it all shows&  on his face.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		audio_play_sound(snd_bell,2,0);
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}

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

	if (_timer == 60)
	{
		Anim_Create(battle_soul,"y",ANIM_TWEEN.CUBIC,ANIM_EASE.IN_OUT,battle_soul.y,400-battle_soul.y,50);
	}

	if (instance_exists(battle_dr_corridor))
	{
		yol += battle_dr_corridor.scroll_spd;
	}

	if (kir_on)
	{
		kir_t += 1;

		if (kir_t == 60)
		{
			instance_create_depth(0,0,0,battle_soul_red_effect);
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,160,160,20);
			Battle_SetSoul(battle_soul_red);
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
		}

		if (kir_t >= 90) and (kir_t <= 122)
		{
			if ((kir_t-90) % 8 == 0) { YelpazeKemik(1,10.6,0); }
		}

		if (kir_t >= 200) and (kir_t <= 232)
		{
			if ((kir_t-200) % 8 == 0) { YelpazeKemik(-1,10.6,0); }
		}

		if (kir_t >= 310) and (kir_t <= 342)
		{
			if ((kir_t-310) % 8 == 0)
			{
				YelpazeKemik(1,6.3,0);
				YelpazeKemik(-1,6.3,0);
			}
		}

		if (kir_t == 430) { MaviKemik(-1); }
		if (kir_t == 446) { MaviKemik(1); }
		if (kir_t == 480)
		{
			instance_create_depth(0,0,0,battle_soul_blue_effect);
			Battle_SetSoul(battle_soul_blue);
		}

		if (kir_t >= 520) and (kir_t <= 556)
		{
			if ((kir_t-520) % 12 == 0) { TuruncuKemik(-1); }
		}

		if (kir_t == 600) { BosluklKemik(0); }
		if (kir_t == 645) { BosluklKemik(1); }
		if (kir_t == 690) { BosluklKemik(2); }

		if (kir_t >= 750) and (kir_t <= 774)
		{
			if ((kir_t-750) % 12 == 0) { TuruncuKemik(1); }
		}

		if (kir_t == 810)
		{
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,75,75,30);
			Battle_SlamDown();
			audio_play_sound(snd_impact,2,false);
			DipDuvar();
			SticikPlatform();
		}

		if (kir_t > 810) and (instance_exists(battle_platform1))
		{
			with (battle_platform1)
			{
				var _pl = battle_board.x-battle_board.left+width*0.5+4;
				var _pr = battle_board.x+battle_board.right-width*0.5-4;
				if (x <= _pl) and (move_x < 0) { move_x = abs(move_x); }
				if (x >= _pr) and (move_x > 0) { move_x = -abs(move_x); }
				x = clamp(x,_pl,_pr);
			}
		}

		if (kir_t == 880) { HancerYatay(-1); }
		if (kir_t == 900) { HancerYatay(1); }
		if (kir_t == 920) { HancerYatay(-1); }
		if (kir_t == 940) { HancerYatay(1); }

		if (kir_t == 1000)
		{
			with (battle_platform1) { instance_destroy(); }
			with (battle_regularbonewall) { instance_destroy(); }
			with (battle_regularbone) { instance_destroy(); }
			instance_create_depth(0,0,0,battle_soul_red_effect);
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(65,65,160,160,25);
			Battle_SetSoul(battle_soul_red);
		}

		if (kir_t >= 1040) and (kir_t <= 1156)
		{
			if ((kir_t-1040) % 4 == 0) { HancerNisan(); }
		}

		if (kir_t == 1260)
		{
			kir_on = false;
			with (battle_platform1) { instance_destroy(); }
			with (battle_regularbone) { instance_destroy(); }
			with (battle_regularbonewall) { instance_destroy(); }
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Papyrus is enjoying himself.")
			if (instance_exists(o_sans_blockp2))
			{
				o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
			}
			Battle_EndTurn();
		}
	}


	if (bolum == 0) and (_timer >= 60)
	{
		bolum = 1;
		yol = 0;
		ChainRun(6,120,60);
	}

	if (bolum == 1) and (yol >= 700)
	{
		bolum = 2;
		BoxRun(3,110,120,320,45);
	}

	if (bolum == 2) and (yol >= 1490)
	{
		bolum = 3;
		JumpUnit(900,[0,-70]);
		JumpUnit(1680,[50,-45,60]);
	}

	if (bolum == 3) and (yol >= 3750)
	{
		bolum = 4;
		ChainRun(6,120,60);
		BlastMark(700,-1);
	}

	if (bolum == 4) and (yol >= 4000)
	{
		bolum = 5;
		JumpUnit(900,[-50]);
		JumpUnit(1420,[55,-40,65,-30]);
	}

	if (bolum == 5) and (yol >= 6105)
	{
		bolum = 6;
		BoxRun(4,104,110,300,40);
	}

	if (bolum == 6) and (yol >= 7710)
	{
		bolum = 7;
		ChainRun(6,110,60);
	}

	if (bolum == 7) and (yol >= 7760)
	{
		bolum = 8;
		JumpUnit(1050,[-55,50,-45]);
	}

	if (bolum == 8) and (yol >= 9400)
	{
		bolum = 9;
		ChainRun(7,110,60);
	}

	if (bolum == 9) and (yol >= 10015)
	{
		bolum = 10;
		BoxRun(3,104,110,300,40);
		BlastMark(1100,1);
	}

	if (bolum == 10) and (yol >= atak_yol)
	{
		bolum = 11;
		GuestStart(8);
		konuk_son = yol+3600;
	}

	if (bolum == 11) and ((!gst_on) or (yol >= konuk_son))
	{
		bolum = 12;
		GuestStop();
		bitis_kare = _timer;
	}


	if (box_on) and (instance_exists(battle_soul))
	{
		var _kmul = 1;
		if (instance_exists(battle_soul_orange_dr)) { _kmul = battle_soul_orange_dr.world_mul; }
		var _kay = 4*_kmul;
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
			blasts[_i].y += 4*_bmul;
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
		for (var _i = 0; _i < _cn; _i++) { cars[_i].y += 4*_cmul; }

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

	if (bolum == 12) and (_timer == bitis_kare+35)
	{
		bolum = 13;
		CarStop();
		BoxStop();
		DrCorridorStop();
		with (battle_regularbone) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
		with (battle_gasterblaster_beam) { instance_destroy(); }
		SigaraBasla();
	}

	if (sahne == 1) and (_timer == sahne_kare+45)
	{
		sahne = 2;
		var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
		_dlg.text = "{speaker 1}{font 4}{voice 4}{pap_head 1}MIND IF I TAKE A&QUICK SMOKE&BREAK?";
	}

	if (sahne == 2) and (!instance_exists(battle_dialog_enemy))
	{
		sahne = 3;
		sahne_kare = _timer;
		duman_t = 0;
		with (battle_enemy_engage)
		{
			pap_body_sprite = spr_papyrus_smoking;
			pap_body_image = 0;
			pap_head_alpha = 0;
			pap_arm_alpha = 0;
		}
	}

	if (sahne == 3)
	{
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

		if (_timer == sahne_kare+300)
		{
			sahne = 4;
			sahne_kare = _timer;
			with (battle_enemy_engage)
			{
				pap_body_sprite = spr_papyrus_body;
				pap_body_image = 0;
				pap_head_alpha = 1;
				pap_arm_alpha = 1;
			}
		}
	}

	if (sahne == 4) and (_timer == sahne_kare+35)
	{
		sahne = 5;
		var _dlg = instance_create_depth(0,0,0,battle_dialog_enemy);
		_dlg.text = "{speaker 1}{font 4}{voice 4}{pap_head 4}AH, NOTHING&BEATS A CIGAR&AM I RIGHT?";
	}

	if (sahne == 5) and (!instance_exists(battle_dialog_enemy))
	{
		sahne = 6;
		KirmiziBasla();
	}

	if (array_length(duman) > 0)
	{
		for (var _i = array_length(duman)-1; _i >= 0; _i--)
		{
			var _dm = duman[_i];
			_dm.t += 1;
			_dm.vy *= 0.985;
			_dm.vx *= 0.99;
			_dm.x += _dm.vx+dsin(_dm.t*2.6+_dm.tohum)*0.35;
			_dm.y += _dm.vy;
			if (_dm.t >= _dm.omur) { array_delete(duman,_i,1); }
		}
	}
}
