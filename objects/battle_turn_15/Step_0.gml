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
		Battle_SetBoardSizeCubic(65,65,65,65);
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,20,0,false);
	}
	if (_timer = 60)
	{
		Battle_SetBoardSizeCubic(65,65,125,125);
	}
	if (_timer = 60)
	{
		RegularBone(right_box,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,102,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,top_box,102,3,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 60) and (_timer < 360) and (_timer % 30 == 0)
	{
		RegularBone(right_box,top_box,112,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,112,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box + 2,22,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,22,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 360)
	{
		Battle_SetBoardSizeCubic(65,65,105,105);
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_ding,2,false);
	}
	if (_timer = 360)
	{
		var gbX = random_range(50,540);
		var gbY = random_range(top_box - 20,top_box - 220);
		var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
	}
	if (_timer = 410)
	{
		var gbX = random_range(50,540);
		var gbY = random_range(top_box - 20,top_box - 220);
		var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		gbX = random_range(50,540);
		gbY = random_range(top_box - 20,top_box - 220);
		gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
		RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
	}
	if (_timer = 510)
	{
		Battle_SlamDown();
	}
	if (_timer = 520)
	{
		RegularBone(right_box,bottom_box + 2,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,bottom_box + 2,32,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box + 2,42,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,bottom_box + 2,52,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,bottom_box + 2,62,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 75,bottom_box + 2,72,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 90,bottom_box + 2,62,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 105,bottom_box + 2,52,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 120,bottom_box + 2,42,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 135,bottom_box + 2,32,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 150,bottom_box + 2,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,top_box,32,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,top_box,42,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 45,top_box,52,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 60,top_box,62,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 75,top_box,72,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 90,top_box,62,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 105,top_box,52,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 120,top_box,42,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 135,top_box,32,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 150,top_box,22,5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 570)
	{
		Battle_SlamUp();
	}
	if (_timer = 580)
	{
		RegularBone(right_box,top_box,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 15,top_box,32,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,42,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 45,top_box,52,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 60,top_box,62,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 75,top_box,72,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 90,top_box,62,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 105,top_box,52,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 120,top_box,42,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 135,top_box,32,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 150,top_box,22,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 15,bottom_box + 2,32,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box + 2,42,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 45,bottom_box + 2,52,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 60,bottom_box + 2,62,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 75,bottom_box + 2,72,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 90,bottom_box + 2,62,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 105,bottom_box + 2,52,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 120,bottom_box + 2,42,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 135,bottom_box + 2,32,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 150,bottom_box + 2,22,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer = 630)
	{
		Battle_SlamDown();
		RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,30,0,false);
	}
	if (_timer = 710)
	{
		Battle_SetBoardSizeCubic(65,65,155,155);
		Battle_SlamUp();
	}
	if (_timer > 720) and (_timer < 900) and (_timer % 50 == 0)
	{
		RegularBone(right_box,bottom_box + 2,112,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,22,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box + 2,112,6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,22,6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 726) and (_timer < 900) and (_timer % 25 == 0) and (_timer % 50 != 0)
	{
		RegularBone(right_box,top_box,152,-6,0,180,1,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,152,6,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer = 920)
	{
		audio_play_sound(snd_ding,2,false);
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer > 920) and (_timer < 1250)
	{
		if (_timer % 5 == 0)
		{
			RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
		
		}
		if (_timer % 50 == 0)
		{
			var gbX = random_range(50,540);
			var gbY = top_box - 80;
			var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
			RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,1,2,25);
		}
	}
	if (_timer = 1300)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
	}
	if (_timer = 1310)
	{
		RegularBlaster(-50,320,left_box - 80,top_box + 60,0,0,18,20,3,3,50);
		RegularBlaster(-50,320,left_box + 85,top_box - 80,0,270,18,20,3,3,50);
	}
	if (_timer = 1450)
	{
		Battle_SetMenuDialog("* He doesn't look happy.")
		Battle_EndTurn();
	}
}
if (room == room_battle_1)
{
	if (_timer == 1000)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
		Battle_EndTurn();
	}
}