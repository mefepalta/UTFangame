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
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,87,6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,87,-6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 70)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer == 100)
	{
		RegularBone(left_box,top_box,87,6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,87,-6,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 130)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,152,-8,0,180,1,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,67,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,67,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,67,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,67,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box,152,4,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 210)
	{
		Battle_SlamDown();
		Battle_SetBoardSizeCubic(65,65,155,155);
	}
	if (_timer > 220) and (_timer < 720)
	{
		if (_timer % 45 == 0)
		{
			RegularBone(left_box,bottom_box,24,2.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,2.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 50,bottom_box,152,2.5,0,0,1,0,1,0,0,0,0,true);
		}
	}
	if (_timer == 220)
	{
		RegularBlaster(320,-50,right_box - 30,top_box - 70,270,270,480,1,2,2,50);
	}
	if (_timer == 320)
	{
		RegularBlaster(320,-50,right_box - 80,top_box - 70,270,270,380,1,2,2,50);
	}
	if (_timer == 420)
	{
		RegularBlaster(320,-50,right_box - 130,top_box - 70,270,270,280,1,2,2,50);
	}
	if (_timer == 520)
	{
		RegularBlaster(320,-50,right_box - 180,top_box - 70,270,270,180,1,2,2,50);
	}
	if (_timer == 620)
	{
		RegularBlaster(320,-50,right_box - 230,top_box - 70,270,270,80,1,2,2,50);
	}
	if (_timer == 800)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 10,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 20,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 30,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
		RegularBone(left_box - 40,bottom_box,152,6,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer == 825)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(right_box,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,bottom_box,24,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 10,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 20,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 30,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 40,top_box,104,-6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 880)
	{
		RegularBlaster(320,-50,right_box + 60,bottom_box - 20,180,180,40,1,2,2,50);
	}
	if (_timer == 950)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer == 960)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,125,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,17,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,17,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,125,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 990)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,105,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,37,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,37,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1020)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,85,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,57,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,57,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,85,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1050)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,65,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,77,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,77,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1080)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,45,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,97,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,97,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,45,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1110)
	{
		audio_play_sound(snd_stab,2,false);
		RegularBone(left_box,bottom_box,25,3,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,117,3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,117,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-3,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1160)
	{
		Battle_SetBoardSizeCubic(65,65,65,65);
		RegularBlaster(-50,320,left_box - 10,top_box + 60,0,0,18,20,3,3,50);
		RegularBlaster(-50,320,left_box + 152,top_box - 100,0,270,18,20,3,3,50);
	}
	if (_timer == 1310)
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Smells like bones.")
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