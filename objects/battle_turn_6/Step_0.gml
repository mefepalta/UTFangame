var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;
 
if (room == room_battle)
{
	if (_timer == 1)
	{
		Battle_SetSoul(battle_soul_blue);
	    Battle_SetBoardSizeCubic(65,65,195,195);
	}
	if (_timer == 50)
	{
		RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 130)
	{
		RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 180)
	{
		RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 200)
	{
		RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 230)
	{
		RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 300)
	{
		RegularBone(left_box,bottom_box,20,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,20,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 310)
	{
		RegularBone(left_box,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 320)
	{
		RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 330)
	{
		RegularBone(left_box,bottom_box,80,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,80,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 350)
	{
		RegularBlaster(-50,-50,left_box - 60,top_box + 60,0,0,50,15,2,2,30);
		RegularBlaster(-50,-50,right_box + 60,top_box + 60,180,180,50,15,2,2,30);
	}
	if (_timer == 470)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamUp();
		RegularBoneWall(DIR.UP,420,37,70,left_box,top_box,50,30,0,false);
	}
	if (_timer == 530)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamDown();
	}
	if (_timer == 550)
	{
		RegularBone(left_box,bottom_box,84,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,44,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,84,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,44,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 600)
	{
		RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,64,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,64,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 650)
	{
		RegularBone(left_box,bottom_box,44,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,84,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,44,-3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,84,-3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 750)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* The Knight has appeared.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{

	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer == 40) or (_timer == 100) or (_timer == 160)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		RegularBoneWall(DIR.LEFT ,132,12,48,left_box,top_box,40,28,0,false);
	}
	if (_timer == 70) or (_timer == 130)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamRight();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		RegularBoneWall(DIR.RIGHT,132,12,48,left_box,top_box,40,28,0,false);
	}

	if (_timer == 190)
	{
		RegularBoneWall(DIR.LEFT ,132,12,48,left_box,top_box,40,100,0,false);
		RegularBoneWall(DIR.RIGHT,132,12,48,left_box,top_box,40,100,0,false);
	}
	if (_timer == 233)
	{
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer == 295)
	{
		RegularBoneWall(DIR.LEFT ,132,12,62,left_box,top_box,40,100,0,false);
		RegularBoneWall(DIR.RIGHT,132,12,34,left_box,top_box,40,100,0,false);
	}
	if (_timer >= 236) and (_timer <= 436) and (_timer % 20 == 0)
	{
		var _corr_c = (_timer < 338 ? 320 : 334);
		var _corr_s = (((_timer div 20) % 2 == 0) ? -11 : 11);
		Dagger(_corr_c+_corr_s,top_box-90,46,0,6,180);
	}

	if (_timer == 465) or (_timer == 505) or (_timer == 545)
	{
		var _hd_left = ((_timer == 465) or (_timer == 545));
		for (var _k = 0; _k < 3; _k++)
		{
			if (_hd_left)
			{
				Dagger(left_box-120,top_box+18+_k*42,46,7,0,90);
			}
			else
			{
				Dagger(right_box+120,top_box+40+_k*42,46,-7,0,90);
			}
		}
	}

	if (_timer == 640)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamRight();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		Anim_Create(battle_board,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,320,180,60);
	}
	if (_timer == 715)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamRight();
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slam;
		RegularBoneWall(DIR.RIGHT,132,12,44,left_box,top_box,40,120,0,false);
	}
	if (_timer == 725)
	{
		RegularBlaster(-100,battle_board.y+10,255,battle_board.y+10,0,0,40,15,2,2,45);
	}

	if (_timer == 790)
	{
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer >= 875) and (_timer <= 1050) and (_timer % 35 == 0)
	{
		audio_play_sound(snd_stab,2,false);
		var _grp_top = ((_timer div 35) % 2 == 1);
		for (var _i = 0; _i < 4; _i++)
		{
			if (_grp_top)
			{
				RegularBone(left_box-45+_i*13,top_box,83,7,0,180,0,0,1,0,0,0,0,true);
			}
			else
			{
				RegularBone(left_box-45+_i*13,bottom_box,83,7,0,0,0,0,1,0,0,0,0,true);
			}
		}
	}

	if (_timer == 1060)
	{
		Anim_Create(battle_board,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,500,-180,170);
	}
	if (_timer > 1070) and (_timer < 1240) and (_timer % 5 == 0)
	{
		var _gate = sin(_timer*0.07)*22;
		RegularBone(left_box,top_box,58+_gate,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,down_box,58-_gate,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer >= 1076) and (_timer <= 1240) and (_timer % 20 == 0)
	{
		Dagger(battle_board.x+sin(_timer*0.11)*46,top_box-90,46,0,6,180);
	}

	if (_timer == 1260)
	{
		RegularBlaster(320,-60,320,top_box-75,270,270,25,5,2,2,25);
	}
	if (_timer == 1280)
	{
		RegularBlaster(-60,battle_board.y,left_box-80,battle_board.y,0,0,20,5,2,2,25);
		RegularBlaster(700,battle_board.y,right_box+80,battle_board.y,180,180,20,5,2,2,25);
	}

	if (_timer == 47) or (_timer == 77) or (_timer == 107) or (_timer == 137)
	or (_timer == 167) or (_timer == 647) or (_timer == 722)
	{
		battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
	}

	if (_timer == 1410)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetBoardSizeCubic(65,65,125,125);
		Battle_SetMenuDialog("* He doesn't look happy.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}
