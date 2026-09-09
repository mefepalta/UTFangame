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
		RegularBone(left_box,bottom_box,152,2,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,152,-2,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 50)
	{
		RegularBlaster(-50,320,left_box + 70,top_box - 100,0,270,18,20,3,3,50);
	}
	if (_timer == 70)
	{
		Battle_SetBoardSizeCubic(65,65,165,165);
	}
	if (_timer == 140)
	{
		Battle_SlamDown();
		RegularBlaster(-50,320,left_box + 165,top_box - 150,0,270,2700,20,5,5,50);
	}
	if (_timer == 250)
	{
		RegularBone(left_box + 155,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box + 155,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 155,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box - 155,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 270) and (_timer < 841)
	{
		if (_timer % 50 == 0)
		{
			RegularBone(left_box + 155,bottom_box,24,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 105,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(right_box - 155,bottom_box,24,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 105,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 840)
	{
		Battle_SetBoardSizeCubic(65,65,205,205);
	}
    if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 50 == 0)
		{
			RegularBone(left_box + 155,bottom_box,22,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 155,bottom_box,22,-3,0,0,0,0,1,0,0,0,0,true);
		}
	}
	if (_timer > 840) and (_timer < 1301)
	{
		if (_timer % 100 == 0)
		{
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y - 40,270,270,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x - 40,battle_soul.y,0,0,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x,battle_soul.y + 40,90,90,10,1,1,1,50);
			RegularBlaster(320,-50,battle_soul.x + 40,battle_soul.y,180,180,10,1,1,1,50);
		}
	}
	if (_timer == 1450)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He can't meet your eyes.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}

	if (_timer == 20) { SariBasla(); }

	if (sari_on)
	{
		sari_t += 1;

		if (sari_t == 21)     { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 31)     { DrTarget(DR_TARGET.NORMAL,225,2.8); }
		if (sari_t == 41)     { DrTarget(DR_TARGET.NORMAL,315,2.8); }
		if (sari_t == 71)     { DrTarget(DR_TARGET.NORMAL,45,2.8); }
		if (sari_t == 81)     { DrTarget(DR_TARGET.NORMAL,180,2.8); }
		if (sari_t == 91)     { DrTarget(DR_TARGET.NORMAL,270,2.8); }
		if (sari_t == 121)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 131)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }
		if (sari_t == 141)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }
		if (sari_t == 171)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 181)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }

		if (sari_t == 168)    { DrTarget(DR_TARGET.BIG,0,1.7); }
		if (sari_t == 201)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 208)    { DrTarget(DR_TARGET.BIG,180,1.7); }
		if (sari_t == 221)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }
		if (sari_t == 239)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }
		if (sari_t == 271)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }
		if (sari_t == 311)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }
		if (sari_t == 329)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }
		if (sari_t == 361)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 379)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }

		if (sari_t == 401)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 419)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }
		if (sari_t == 437)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }
		if (sari_t == 461)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }
		if (sari_t == 463)    { DrTarget(DR_TARGET.MIRROR,90,2.2); }
		if (sari_t == 479)    { DrTarget(DR_TARGET.NORMAL,225,2.8); }
		if (sari_t == 488)    { DrTarget(DR_TARGET.BIG,90,1.7); }
		if (sari_t == 497)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }
		if (sari_t == 503)    { DrTarget(DR_TARGET.MIRROR,270,2.2); }
		if (sari_t == 523)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 528)    { DrTarget(DR_TARGET.BIG,270,1.7); }
		if (sari_t == 541)    { DrTarget(DR_TARGET.NORMAL,45,2.8); }
		if (sari_t == 559)    { DrTarget(DR_TARGET.NORMAL,135,2.8); }

		if (sari_t == 601)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 617)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 633)    { DrTarget(DR_TARGET.MIRROR,135,2.2); }
		if (sari_t == 633)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }
		if (sari_t == 649)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }
		if (sari_t == 665)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }
		if (sari_t == 681)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 683)    { DrTarget(DR_TARGET.MIRROR,45,2.2); }
		if (sari_t == 688)    { DrTarget(DR_TARGET.BIG,45,1.7); }
		if (sari_t == 701)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }
		if (sari_t == 713)    { DrTarget(DR_TARGET.MIRROR,225,2.2); }
		if (sari_t == 717)    { DrTarget(DR_TARGET.NORMAL,180,2.8); }
		if (sari_t == 718)    { DrTarget(DR_TARGET.BIG,225,1.7); }
		if (sari_t == 733)    { DrTarget(DR_TARGET.NORMAL,270,2.8); }
		if (sari_t == 749)    { DrTarget(DR_TARGET.NORMAL,315,2.8); }
		if (sari_t == 765)    { DrTarget(DR_TARGET.NORMAL,0,2.8); }
		if (sari_t == 781)    { DrTarget(DR_TARGET.NORMAL,90,2.8); }

		if (sari_t == sari_son)
		{
			sari_on = false;
			with (battle_dr_target) { instance_destroy(); }
			KirmiziBasla();
		}
	}

	if (kir_on)
	{
		kir_t += 1;

		if (kir_t == 20)
		{
			instance_create_depth(0,0,0,battle_soul_red_effect);
			SpearArena(4);
			Battle_SetSoul(battle_soul_red);
			battle_soul.x = battle_board.x;
			battle_soul.y = battle_board.y;
			with (battle_soul) { moveable = true; }
			Camera_Shake(3,3,2,2);
		}


		if (kir_t >= 80) and (kir_t <= 290)
		{
			if ((kir_t-80) % 26 == 0) { Spear4(); }
		}

		if (kir_t == 310) { SpearArena(5); }

		if (kir_t >= 370) and (kir_t <= 580)
		{
			if ((kir_t-370) % 45 == 0) { Spear5(); }
		}

		if (kir_t == 410) { AlphysShocker(battle_board.x-120,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 459) { AlphysShocker(battle_board.x+ 70,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 508) { AlphysShocker(battle_board.x- 40,battle_board.y+battle_board.down-4,40); }
		if (kir_t == 557) { AlphysShocker(battle_board.x+130,battle_board.y+battle_board.down-4,40); }

		if (kir_t == 600) { SpearArena(3); }

		if (kir_t >= 660) and (kir_t <= 870)
		{
			if ((kir_t-660) % 20 == 0) { Spear3(); }
		}

		if (kir_t == 700) { AlphysBigBolt(battle_board.x-44,-60,270,6,5,2.4); }
		if (kir_t == 820) { AlphysBigBolt(battle_board.x+38,-60,270,6,7,2.4); }

		if (kir_t == 890)
		{
			SpearArena(2);
			s1_next = 950;
			s1_n = 0;
			s1_ang = 0;
		}

		if (kir_t >= 950) and (kir_t <= 1160)
		{
			if (kir_t >= s1_next)
			{
				Spear1(s1_ang);
				s1_ang += 32;
				s1_next = kir_t+Spear1Gap(s1_n);
				s1_n += 1;
			}
		}

		if (kir_t == 1180) { Spear2Speed(true); }

		if (kir_t >= 1180) and (kir_t <= 1390)
		{
			if ((kir_t-1180) % 70 == 0) { Spear2(); }
		}

		if (kir_t == 970)  { AlphysHammer(1,battle_board.x-battle_board.left+190,battle_board.y-battle_board.up,-1,1,1); }
		if (kir_t == 1220) { AlphysHammer(0,battle_board.x+battle_board.right-190,battle_board.y+battle_board.down,-1,1,1); }

		if (kir_t == 1480)
		{
			kir_on = false;
			Spear2Speed(false);
			with (o_alphys_spear) { instance_destroy(); }
			with (o_alphys_hammer) { instance_destroy(); }
			with (o_alphys_shocker) { instance_destroy(); }
			with (o_alphys_bigbolt) { instance_destroy(); }
			with (o_alphys_bolt) { instance_destroy(); }
			Anim_Destroy(battle_board,"up");
			Anim_Destroy(battle_board,"down");
			Anim_Destroy(battle_board,"left");
			Anim_Destroy(battle_board,"right");
			Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Alphys cracks her knuckles.")
			if (instance_exists(o_sans_blockp2))
			{
				o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
			}
			Battle_EndTurn();
		}
	}
}
