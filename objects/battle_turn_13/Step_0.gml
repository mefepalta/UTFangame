// Tur baslarken Sans'in kafasi diyalog ifadesinden idle animasyonuna doner
if (room == room_battle_1) and (_timer == 1)
{
	battle_enemy_engage.p2_head_sprite = spr_p2_idle;
}

var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer = 1)
	{
		Battle_SetBoardSizeCubic(65,65,215,215);
		Battle_SlamDown();
	}
	if (_timer = 20)
	{
		makeplatform(right_box + 50,top_box + 100,50,-3.1,0,true,0);
	}
	if (_timer > 20) and (_timer % 5 == 0)
	{
		RegularBone(right_box,bottom_box + 2,30,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 60)
	{
		RegularBone(right_box,bottom_box + 2,87,-3.1,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,37,-3.1,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 120)
	{
		makeplatform(right_box + 50,top_box + 80,50,-3.1,0,true,0);
	}
	if (_timer = 170)
	{
		RegularBone(right_box,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,27,-3.1,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 185)
	{
		makeplatform(right_box + 20,top_box + 80,50,-3.1,0,true,0);
	}
	if (_timer = 230)
	{
		RegularBone(right_box,top_box,67,-5,0,180,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,67,-5,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer = 280)
	{
		makeplatform(right_box + 20,top_box + 80,50,-3.1,0,true,0);
	}
	if (_timer = 330)
	{
		RegularBone(right_box,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 360)
	{
		makeplatform(right_box + 20,top_box + 80,50,-3.1,0,true,0);
	}
	if (_timer = 410)
	{
		RegularBone(right_box,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,bottom_box + 2,107,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 490)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		RegularBone(right_box,top_box,85,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,top_box,85,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,85,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,top_box,85,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,top_box,85,-5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 540)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer > 540) and (_timer % 15 == 0)
	{
		RegularBlaster(320,-50,battle_soul.x,top_box - 70,270,270,20,20,1,2,50);
	}
	if (_timer = 720)
	{
		Battle_SetMenuDialog("* He doesn't look happy.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}

if (room == room_battle_1)
{
	if (_timer == 1)
	{
		BGM_SetVolume(5,0.22,150);
		Battle_SetBoardSizeCubic(34,34,34,34,90);
	}
	if (_timer == 120)
	{
		instance_create_depth(0,0,0,battle_soul_red_effect);
		Battle_SetSoul(battle_soul_yellow_dr);
		Camera_Shake(3,3,2,2);
	}

	if (_timer == 150) { DrTarget(DR_TARGET.NORMAL,0,3.9); }
	if (_timer == 168) { DrTarget(DR_TARGET.NORMAL,135,3.9); }
	if (_timer == 194) { DrTarget(DR_TARGET.MIRROR,0,3.5); }
	if (_timer == 198) { DrTarget(DR_TARGET.NORMAL,270,3.6); }
	if (_timer == 212) { DrTarget(DR_TARGET.MIRROR,135,3.5); }
	if (_timer == 216) { DrTarget(DR_TARGET.NORMAL,45,3.6); }
	if (_timer == 242) { DrTarget(DR_TARGET.MIRROR,270,3.2); }
	if (_timer == 246) { DrTarget(DR_TARGET.NORMAL,180,3.9); }
	if (_timer == 260) { DrTarget(DR_TARGET.MIRROR,45,3.2); }
	if (_timer == 264) { DrTarget(DR_TARGET.NORMAL,315,3.9); }
	if (_timer == 290) { DrTarget(DR_TARGET.MIRROR,180,3.5); }
	if (_timer == 294) { DrTarget(DR_TARGET.NORMAL,90,4.2); }
	if (_timer == 308) { DrTarget(DR_TARGET.MIRROR,315,3.5); }
	if (_timer == 312) { DrTarget(DR_TARGET.NORMAL,225,4.2); }
	if (_timer == 338) { DrTarget(DR_TARGET.MIRROR,90,3.8); }
	if (_timer == 342) { DrTarget(DR_TARGET.NORMAL,0,3.9); }
	if (_timer == 356) { DrTarget(DR_TARGET.MIRROR,225,3.8); }
	if (_timer == 360) { DrTarget(DR_TARGET.NORMAL,135,3.9); }
	if (_timer == 386) { DrTarget(DR_TARGET.MIRROR,0,3.5); }
	if (_timer == 390) { DrTarget(DR_TARGET.BIG,270,1.6); }
	if (_timer == 404) { DrTarget(DR_TARGET.MIRROR,135,3.5); }
	if (_timer == 430) { DrTarget(DR_TARGET.MIRROR,270,3.2); }
	if (_timer == 440) { DrTarget(DR_TARGET.NORMAL,45,3.5); }
	if (_timer == 458) { DrTarget(DR_TARGET.NORMAL,180,3.5); }
	if (_timer == 484) { DrTarget(DR_TARGET.MIRROR,45,3.1); }
	if (_timer == 488) { DrTarget(DR_TARGET.NORMAL,315,4.1); }
	if (_timer == 502) { DrTarget(DR_TARGET.MIRROR,180,3.1); }
	if (_timer == 506) { DrTarget(DR_TARGET.NORMAL,90,4.1); }
	if (_timer == 532) { DrTarget(DR_TARGET.MIRROR,315,3.7); }
	if (_timer == 536) { DrTarget(DR_TARGET.NORMAL,225,2.6); }
	if (_timer == 550) { DrTarget(DR_TARGET.MIRROR,90,3.7); }
	if (_timer == 554) { DrTarget(DR_TARGET.NORMAL,0,2.6); }
	if (_timer == 578) { DrTarget(DR_TARGET.MIRROR,225,4.6); }
	if (_timer == 584) { DrTarget(DR_TARGET.NORMAL,135,4); }
	if (_timer == 596) { DrTarget(DR_TARGET.MIRROR,0,4.6); }
	if (_timer == 602) { DrTarget(DR_TARGET.NORMAL,270,4); }
	if (_timer == 628) { DrTarget(DR_TARGET.MIRROR,135,3.6); }
	if (_timer == 632) { DrTarget(DR_TARGET.NORMAL,45,4.1); }
	if (_timer == 646) { DrTarget(DR_TARGET.MIRROR,270,3.6); }
	if (_timer == 650) { DrTarget(DR_TARGET.NORMAL,180,4.1); }
	if (_timer == 676) { DrTarget(DR_TARGET.MIRROR,45,3.7); }
	if (_timer == 680) { DrTarget(DR_TARGET.BIG,315,1.6); }
	if (_timer == 694) { DrTarget(DR_TARGET.MIRROR,180,3.7); }
	if (_timer == 720) { DrTarget(DR_TARGET.MIRROR,315,3.2); }
	if (_timer == 730) { DrTarget(DR_TARGET.NORMAL,90,3.7); }
	if (_timer == 748) { DrTarget(DR_TARGET.NORMAL,225,3.7); }
	if (_timer == 774) { DrTarget(DR_TARGET.MIRROR,90,3.3); }
	if (_timer == 778) { DrTarget(DR_TARGET.NORMAL,0,4); }
	if (_timer == 792) { DrTarget(DR_TARGET.MIRROR,225,3.3); }
	if (_timer == 796) { DrTarget(DR_TARGET.NORMAL,135,4); }
	if (_timer == 822) { DrTarget(DR_TARGET.MIRROR,0,3.6); }
	if (_timer == 826) { DrTarget(DR_TARGET.NORMAL,270,2.6); }
	if (_timer == 840) { DrTarget(DR_TARGET.MIRROR,135,3.6); }
	if (_timer == 844) { DrTarget(DR_TARGET.NORMAL,45,2.6); }
	if (_timer == 868) { DrTarget(DR_TARGET.MIRROR,270,4.6); }
	if (_timer == 874) { DrTarget(DR_TARGET.NORMAL,180,3.6); }
	if (_timer == 886) { DrTarget(DR_TARGET.MIRROR,45,4.6); }
	if (_timer == 892) { DrTarget(DR_TARGET.NORMAL,315,3.6); }
	if (_timer == 918) { DrTarget(DR_TARGET.MIRROR,180,3.2); }
	if (_timer == 922) { DrTarget(DR_TARGET.NORMAL,90,3.9); }
	if (_timer == 936) { DrTarget(DR_TARGET.MIRROR,315,3.2); }
	if (_timer == 938) { DrTarget(DR_TARGET.NORMAL,225,3.9); }
	if (_timer == 954) { DrTarget(DR_TARGET.NORMAL,0,3.9); }
	if (_timer == 968) { DrTarget(DR_TARGET.MIRROR,90,3.5); }
	if (_timer == 984) { DrTarget(DR_TARGET.MIRROR,225,3.5); }
	if (_timer == 991) { DrTarget(DR_TARGET.BIG,135,1.5); }
	if (_timer == 1000) { DrTarget(DR_TARGET.MIRROR,0,3.5); }
	if (_timer == 1031) { DrTarget(DR_TARGET.MIRROR,135,3.1); }
	if (_timer == 1041) { DrTarget(DR_TARGET.NORMAL,270,3.6); }
	if (_timer == 1059) { DrTarget(DR_TARGET.NORMAL,45,3.6); }
	if (_timer == 1085) { DrTarget(DR_TARGET.MIRROR,270,3.2); }
	if (_timer == 1089) { DrTarget(DR_TARGET.NORMAL,180,4.1); }
	if (_timer == 1103) { DrTarget(DR_TARGET.MIRROR,45,3.2); }
	if (_timer == 1105) { DrTarget(DR_TARGET.NORMAL,315,4.1); }
	if (_timer == 1121) { DrTarget(DR_TARGET.NORMAL,90,4.1); }
	if (_timer == 1135) { DrTarget(DR_TARGET.MIRROR,180,3.7); }
	if (_timer == 1151) { DrTarget(DR_TARGET.MIRROR,315,3.7); }
	if (_timer == 1158) { DrTarget(DR_TARGET.NORMAL,225,2.6); }
	if (_timer == 1167) { DrTarget(DR_TARGET.MIRROR,90,3.7); }
	if (_timer == 1176) { DrTarget(DR_TARGET.NORMAL,0,2.6); }
	if (_timer == 1200) { DrTarget(DR_TARGET.MIRROR,225,4.6); }
	if (_timer == 1206) { DrTarget(DR_TARGET.NORMAL,135,4.1); }
	if (_timer == 1218) { DrTarget(DR_TARGET.MIRROR,0,4.6); }
	if (_timer == 1224) { DrTarget(DR_TARGET.NORMAL,270,4.1); }
	if (_timer == 1250) { DrTarget(DR_TARGET.MIRROR,135,3.7); }
	if (_timer == 1254) { DrTarget(DR_TARGET.NORMAL,45,4.1); }
	if (_timer == 1268) { DrTarget(DR_TARGET.MIRROR,270,3.7); }
	if (_timer == 1270) { DrTarget(DR_TARGET.NORMAL,180,4.1); }
	if (_timer == 1286) { DrTarget(DR_TARGET.NORMAL,315,4.1); }
	if (_timer == 1300) { DrTarget(DR_TARGET.MIRROR,45,3.7); }
	if (_timer == 1316) { DrTarget(DR_TARGET.MIRROR,180,3.7); }
	if (_timer == 1323) { DrTarget(DR_TARGET.BIG,90,1.4); }
	if (_timer == 1332) { DrTarget(DR_TARGET.MIRROR,315,3.7); }
	if (_timer == 1363) { DrTarget(DR_TARGET.MIRROR,90,3); }
	if (_timer == 1373) { DrTarget(DR_TARGET.NORMAL,225,3.8); }
	if (_timer == 1391) { DrTarget(DR_TARGET.NORMAL,0,3.8); }
	if (_timer == 1417) { DrTarget(DR_TARGET.MIRROR,225,3.4); }
	if (_timer == 1421) { DrTarget(DR_TARGET.NORMAL,135,4); }
	if (_timer == 1435) { DrTarget(DR_TARGET.MIRROR,0,3.4); }
	if (_timer == 1437) { DrTarget(DR_TARGET.NORMAL,270,4); }
	if (_timer == 1453) { DrTarget(DR_TARGET.NORMAL,45,4); }
	if (_timer == 1467) { DrTarget(DR_TARGET.MIRROR,135,3.6); }
	if (_timer == 1483) { DrTarget(DR_TARGET.MIRROR,270,3.6); }
	if (_timer == 1490) { DrTarget(DR_TARGET.NORMAL,180,2.6); }
	if (_timer == 1499) { DrTarget(DR_TARGET.MIRROR,45,3.6); }
	if (_timer == 1508) { DrTarget(DR_TARGET.NORMAL,315,2.6); }
	if (_timer == 1532) { DrTarget(DR_TARGET.MIRROR,180,4.6); }
	if (_timer == 1538) { DrTarget(DR_TARGET.NORMAL,90,3.7); }
	if (_timer == 1550) { DrTarget(DR_TARGET.MIRROR,315,4.6); }
	if (_timer == 1556) { DrTarget(DR_TARGET.NORMAL,225,3.7); }
	if (_timer == 1582) { DrTarget(DR_TARGET.MIRROR,90,3.3); }
	if (_timer == 1586) { DrTarget(DR_TARGET.NORMAL,0,3.8); }
	if (_timer == 1600) { DrTarget(DR_TARGET.MIRROR,225,3.3); }
	if (_timer == 1602) { DrTarget(DR_TARGET.NORMAL,135,3.8); }
	if (_timer == 1618) { DrTarget(DR_TARGET.NORMAL,270,3.8); }
	if (_timer == 1632) { DrTarget(DR_TARGET.MIRROR,0,3.4); }
	if (_timer == 1648) { DrTarget(DR_TARGET.MIRROR,135,3.4); }
	if (_timer == 1655) { DrTarget(DR_TARGET.BIG,45,1.5); }
	if (_timer == 1664) { DrTarget(DR_TARGET.MIRROR,270,3.4); }
	if (_timer == 1695) { DrTarget(DR_TARGET.MIRROR,45,3.1); }
	if (_timer == 1705) { DrTarget(DR_TARGET.NORMAL,180,4.1); }
	if (_timer == 1723) { DrTarget(DR_TARGET.NORMAL,315,4.1); }
	if (_timer == 1749) { DrTarget(DR_TARGET.MIRROR,180,3.7); }
	if (_timer == 1753) { DrTarget(DR_TARGET.NORMAL,90,4.1); }
	if (_timer == 1767) { DrTarget(DR_TARGET.MIRROR,315,3.7); }
	if (_timer == 1769) { DrTarget(DR_TARGET.NORMAL,225,4.1); }
	if (_timer == 1785) { DrTarget(DR_TARGET.NORMAL,0,4.1); }
	if (_timer == 1799) { DrTarget(DR_TARGET.MIRROR,90,3.7); }
	if (_timer == 1815) { DrTarget(DR_TARGET.MIRROR,225,3.7); }
	if (_timer == 1822) { DrTarget(DR_TARGET.NORMAL,135,2.6); }
	if (_timer == 1831) { DrTarget(DR_TARGET.MIRROR,0,3.7); }
	if (_timer == 1840) { DrTarget(DR_TARGET.NORMAL,270,2.6); }
	if (_timer == 1864) { DrTarget(DR_TARGET.MIRROR,135,4.6); }
	if (_timer == 1870) { DrTarget(DR_TARGET.NORMAL,45,3.7); }
	if (_timer == 1882) { DrTarget(DR_TARGET.MIRROR,270,4.6); }
	if (_timer == 1888) { DrTarget(DR_TARGET.NORMAL,180,3.7); }
	if (_timer == 1914) { DrTarget(DR_TARGET.MIRROR,45,3.3); }
	if (_timer == 1918) { DrTarget(DR_TARGET.NORMAL,315,3.9); }
	if (_timer == 1932) { DrTarget(DR_TARGET.MIRROR,180,3.3); }
	if (_timer == 1934) { DrTarget(DR_TARGET.NORMAL,90,3.9); }
	if (_timer == 1950) { DrTarget(DR_TARGET.NORMAL,225,3.9); }
	if (_timer == 1964) { DrTarget(DR_TARGET.MIRROR,315,3.5); }
	if (_timer == 1980) { DrTarget(DR_TARGET.MIRROR,90,3.5); }
	if (_timer == 1987) { DrTarget(DR_TARGET.BIG,0,1.6); }
	if (_timer == 1996) { DrTarget(DR_TARGET.MIRROR,225,3.5); }
	if (_timer == 2027) { DrTarget(DR_TARGET.MIRROR,0,3.2); }
	if (_timer == 2037) { DrTarget(DR_TARGET.NORMAL,135,3.5); }
	if (_timer == 2055) { DrTarget(DR_TARGET.NORMAL,270,3.5); }
	if (_timer == 2081) { DrTarget(DR_TARGET.MIRROR,135,3.1); }
	if (_timer == 2085) { DrTarget(DR_TARGET.NORMAL,45,3.7); }
	if (_timer == 2099) { DrTarget(DR_TARGET.MIRROR,270,3.1); }
	if (_timer == 2101) { DrTarget(DR_TARGET.NORMAL,180,3.7); }
	if (_timer == 2117) { DrTarget(DR_TARGET.NORMAL,315,3.7); }
	if (_timer == 2131) { DrTarget(DR_TARGET.MIRROR,45,3.3); }
	if (_timer == 2147) { DrTarget(DR_TARGET.MIRROR,180,3.3); }
	if (_timer == 2154) { DrTarget(DR_TARGET.NORMAL,90,2.6); }
	if (_timer == 2163) { DrTarget(DR_TARGET.MIRROR,315,3.3); }
	if (_timer == 2172) { DrTarget(DR_TARGET.NORMAL,225,2.6); }
	if (_timer == 2196) { DrTarget(DR_TARGET.MIRROR,90,4.6); }
	if (_timer == 2202) { DrTarget(DR_TARGET.NORMAL,0,3.7); }
	if (_timer == 2214) { DrTarget(DR_TARGET.MIRROR,225,4.6); }
	if (_timer == 2220) { DrTarget(DR_TARGET.NORMAL,135,3.7); }
	if (_timer == 2246) { DrTarget(DR_TARGET.MIRROR,0,3.3); }
	if (_timer == 2250) { DrTarget(DR_TARGET.NORMAL,270,3.8); }
	if (_timer == 2264) { DrTarget(DR_TARGET.MIRROR,135,3.3); }
	if (_timer == 2266) { DrTarget(DR_TARGET.NORMAL,45,3.8); }
	if (_timer == 2282) { DrTarget(DR_TARGET.NORMAL,180,3.8); }
	if (_timer == 2296) { DrTarget(DR_TARGET.MIRROR,270,3.4); }
	if (_timer == 2312) { DrTarget(DR_TARGET.MIRROR,45,3.4); }
	if (_timer == 2319) { DrTarget(DR_TARGET.BIG,315,1.6); }
	if (_timer == 2328) { DrTarget(DR_TARGET.MIRROR,180,3.4); }
	if (_timer == 2359) { DrTarget(DR_TARGET.MIRROR,315,3.2); }

	if (_timer > 2359) and (fade_at < 0)
	and (!instance_exists(battle_dr_target)) and (!instance_exists(battle_dr_shot))
	{
		fade_at = _timer;
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		BGM_SetVolume(5,1,45);
		Fader_Fade(-1,1,1);
	}
	if (fade_at > 0) and (_timer == fade_at+15)
	{
		Battle_SetBoardSizeCubic(85,85,35,35,0);
		Battle_SetSoul(battle_soul_red);
	}
	if (fade_at > 0) and (_timer == fade_at+35)
	{
		Fader_Fade(-1,0,1);
	}

	var _bx = battle_board.x;
	var _bt = battle_board.y-battle_board.up+2;

	if (fade_at > 0) and (_timer > fade_at+1300) and (_timer < fade_at+2260) { WallStep(); }
	if (fade_at > 0) and (_timer == fade_at+80)
	{
		Gate(23,46,1.8,true);
		Gate(23,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+147)
	{
		Gate(54,46,1.8,true);
		Gate(54,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+214)
	{
		Gate(85,46,1.8,true);
		Gate(85,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+281)
	{
		Gate(116,46,1.8,true);
		Gate(116,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+348)
	{
		Gate(147,46,1.8,true);
		Gate(147,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+415)
	{
		Gate(116,46,1.8,true);
		Gate(116,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+482)
	{
		Gate(85,46,1.8,true);
		Gate(85,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+549)
	{
		Gate(54,46,1.8,true);
		Gate(54,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+616)
	{
		Gate(23,46,1.8,true);
		Gate(23,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+683)
	{
		Gate(23,46,1.8,true);
		Gate(23,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+750)
	{
		Gate(54,46,1.8,true);
		Gate(54,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+817)
	{
		Gate(85,46,1.8,true);
		Gate(85,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+884)
	{
		Gate(116,46,1.8,true);
		Gate(116,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+951)
	{
		Gate(147,46,1.8,true);
		Gate(147,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+1018)
	{
		Gate(116,46,1.8,true);
		Gate(116,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+1085)
	{
		Gate(85,46,1.8,true);
		Gate(85,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+1152)
	{
		Gate(54,46,1.8,true);
		Gate(54,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+1219)
	{
		Gate(23,46,1.8,true);
		Gate(23,46,1.8,false);
	}
	if (fade_at > 0) and (_timer == fade_at+1326)
	{
		audio_play_sound(snd_impact,2,false);
		Battle_SlamLeft();
	}
	if (fade_at > 0) and (_timer == fade_at+1356)
	{
		Anim_Create(battle_board,"x",ANIM_TWEEN.CUBIC,ANIM_EASE.OUT,320,-180,52);
	}
	if (fade_at > 0) and (_timer == fade_at+1416)
	{
		WallMake(34,40);
	}
	if (fade_at > 0) and (_timer == fade_at+1486)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
		dag_x = battle_board.x-battle_board.left-30;
	}
	if (fade_at > 0) and (_timer == fade_at+1516)
	{
		Dagger(dag_x,_bt+16,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1538)
	{
		Dagger(dag_x,_bt+63,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1560)
	{
		Dagger(dag_x,_bt+110,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1582)
	{
		Dagger(dag_x,_bt+17,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1604)
	{
		Dagger(dag_x,_bt+64,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1626)
	{
		Dagger(dag_x,_bt+111,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1648)
	{
		Dagger(dag_x,_bt+18,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1670)
	{
		Dagger(dag_x,_bt+65,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1692)
	{
		Dagger(dag_x,_bt+112,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1714)
	{
		Dagger(dag_x,_bt+19,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1736)
	{
		Dagger(dag_x,_bt+66,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1758)
	{
		Dagger(dag_x,_bt+113,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1780)
	{
		Dagger(dag_x,_bt+20,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1802)
	{
		Dagger(dag_x,_bt+67,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1824)
	{
		Dagger(dag_x,_bt+114,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1846)
	{
		Dagger(dag_x,_bt+21,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1868)
	{
		Dagger(dag_x,_bt+68,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1890)
	{
		Dagger(dag_x,_bt+115,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1912)
	{
		Dagger(dag_x,_bt+22,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1934)
	{
		Dagger(dag_x,_bt+69,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1956)
	{
		Dagger(dag_x,_bt+116,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1978)
	{
		Dagger(dag_x,_bt+23,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2000)
	{
		Dagger(dag_x,_bt+70,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2022)
	{
		Dagger(dag_x,_bt+117,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2044)
	{
		Dagger(dag_x,_bt+24,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2066)
	{
		Dagger(dag_x,_bt+71,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2088)
	{
		Dagger(dag_x,_bt+118,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2110)
	{
		Dagger(dag_x,_bt+25,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2132)
	{
		Dagger(dag_x,_bt+72,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2154)
	{
		Dagger(dag_x,_bt+119,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2176)
	{
		Dagger(dag_x,_bt+26,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2198)
	{
		Dagger(dag_x,_bt+73,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2220)
	{
		Dagger(dag_x,_bt+120,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2242)
	{
		Dagger(dag_x,_bt+27,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2264)
	{
		Dagger(dag_x,_bt+74,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2286)
	{
		Dagger(dag_x,_bt+121,68,13,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2308)
	{
		Dagger(dag_x,_bt+28,68,9,20);
	}
	if (fade_at > 0) and (_timer == fade_at+2330)
	{
		Dagger(dag_x,_bt+75,68,11,20);
	}
	if (fade_at > 0) and (_timer == fade_at+1586)
	{
		Anim_Create(battle_board,"x",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,140,180,620);
	}
	if (fade_at > 0) and (_timer == fade_at+2442)
	{
		WallClear();
	}
	if (fade_at > 0) and (_timer == fade_at+2442)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He doesn`t look happy.")
		if (instance_exists(o_sans_blockp2))
		{
			o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		}
		Battle_EndTurn();
	}
}

