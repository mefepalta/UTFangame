var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_timer == 1)
{
	Battle_SetSoul(battle_soul_blue);
    Battle_SetBoardSizeCubic(65,65,90,90);
	//audio_play_sound(snd_impact,2,false);
}
if (_timer > 20) and (_timer % 20 == 0) and (_timer < 420)
{
	makeplatform(left_box-50,top_box+100,60,3,0,true,0);
}
if (_timer > 50) and (_timer % 5 == 0) and (_timer < 420)
{
	RegularBone(left_box,bottom_box,25,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box - 5,bottom_box + 10,25,0,-3,90,0,0,1,0,0,0,0,true);
}
if (_timer > 150) and (_timer < 160)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer > 200) and (_timer < 210)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer > 250) and (_timer < 260)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer > 300) and (_timer < 310)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer > 350) and (_timer < 360)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer > 400) and (_timer < 410)
{
	if (_timer % 4 ==0)
	{
        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
	}
}
if (_timer == 500)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
	Battle_SetBoardSizeCubic(65,65,65,65);
	RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
	RegularBlaster(-50,battle_board.y,left_box-100,battle_board.y,0,0,20,20,2,2,50);
	RegularBlaster(690,battle_board.y,right_box+100,battle_board.y,180,180,20,20,2,2,50);
	RegularBlaster(320,540,320,bottom_box+100,90,90,20,20,2,2,50);
	
	Anim_Create(battle_board,"angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,0,45,90);
}
if (_timer == 700)
{
	Battle_SetSoul(battle_soul_red);
	Anim_Create(battle_board,"angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,45,-45,90);
	Battle_SetMenuDialog("* No way out.")
	Battle_EndTurn();
}