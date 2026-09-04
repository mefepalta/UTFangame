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
		RegularBone(left_box,top_box,81,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,top_box,81,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,81,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,81,-4,0,0,0,0,1,0,0,0,0,true);
	}
    if (_timer == 50)
	{
		RegularBone(left_box,bottom_box,81,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,81,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,81,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,81,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		Battle_SetSoul(battle_soul_blue);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,top_box,122,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,top_box,122,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,122,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,122,-4,0,180,0,0,1,0,0,0,0,true);
	}
    if (_timer == 130)
	{
		RegularBone(left_box,bottom_box,72,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,72,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,72,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,72,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		Battle_SlamUp();
		RegularBoneWall(DIR.UP,290,24,75,left_box,bottom_box,50,90,0,false);
	}
	if (_timer == 220)
	{
		Battle_SetSoul(battle_soul_red);
		RegularBone(left_box,bottom_box,72,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,72,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,72,-4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,72,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 230)
	{
		RegularBlaster(320,-50,317,top_box-100,270,270,20,1,2,2,50);
	}
	if (_timer == 310)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
		RegularBoneWall(DIR.UP,290,24,60,left_box,bottom_box,50,90,0,false);
		RegularBoneWall(DIR.DOWN,290,24,60,left_box,bottom_box,50,90,0,false);
		RegularBoneWall(DIR.LEFT,130,11,60,left_box,top_box,50,90,0,false);
		RegularBoneWall(DIR.RIGHT,130,11,60,left_box,top_box,50,90,0,false);
	}
	if (_timer == 450)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He sounds tired.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}

	if (_timer == 20)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(65,65,237,237,20);
		Battle_SetSoul(battle_soul_red);
		battle_soul.x = battle_board.x;
		battle_soul.y = battle_board.y;
	}

	if (_timer == 86) { OrtaBlaster(); }

	if (_timer >= 160) and (_timer <= 495)
	{
		if ((_timer-160) % 31 == 0) { DusenKemik(0); }
	}

	if (_timer == 216)
	{
		instance_create_depth(0,0,0,battle_soul_blue_effect);
		Battle_SetSoul(battle_soul_blue);
	}

	if (_timer == 240) { Battle_SlamRight(); }
	if (_timer == 270) { YanDuvar(true);  }

	if (_timer == 340) { Battle_SlamLeft();  }
	if (_timer == 370) { YanDuvar(false); }

	if (_timer == 440) { Battle_SlamRight(); }
	if (_timer == 470) { YanDuvar(true);  }

	if (_timer == 530) { Battle_SlamDown(); }

	if (_timer == 530)
	{
		Platform(T19_SUTUN_SOL);
		Platform(T19_SUTUN_ORTA);
		Platform(T19_SUTUN_SAG);
	}

	if (_timer >= 550) and (_timer <= 1540)
	{
		if ((_timer-710) % 6 == 0) { KucukKemik(); }
	}

	if (_timer >= 560) and (_timer <= 1540)
	{
		if ((_timer-560) % 42 == 0)  { AraKemik(false); }
		if ((_timer-560) % 42 == 21) { AraKemik(true);  }
	}

	if (_timer ==  630) { BlasterCifti(); }
	if (_timer ==  750) { BlasterCifti(); }
	if (_timer ==  870) { BlasterCifti(); }
	if (_timer ==  990) { BlasterCifti(); }
	if (_timer == 1110) { BlasterCifti(); }
	if (_timer == 1230) { BlasterCifti(); }
	if (_timer == 1350) { BlasterCifti(); }
	if (_timer == 1470) { BlasterCifti(); }

	if (_timer == 1580)
	{
		with (battle_regularbone) { instance_destroy(); }
		with (battle_regularbonewall) { instance_destroy(); }
		with (battle_platform1) { instance_destroy(); }
		with (battle_gasterblaster) { instance_destroy(); }
		with (battle_gasterblaster_beam) { instance_destroy(); }
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Anim_Destroy(battle_board,"up");
		Anim_Destroy(battle_board,"down");
		Anim_Destroy(battle_board,"left");
		Anim_Destroy(battle_board,"right");
		Battle_SetBoardSizeCubic(BATTLE_BOARD.UP,BATTLE_BOARD.DOWN,BATTLE_BOARD.LEFT,BATTLE_BOARD.RIGHT);
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* No more speeches.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
