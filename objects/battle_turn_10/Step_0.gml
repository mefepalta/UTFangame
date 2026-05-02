var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_timer == 1)
{
	Battle_SlamDown();
    Battle_SetBoardSizeCubic(65,65,160,160);
	audio_play_sound(snd_impact,2,false);
	RegularBlaster(320,-50,420,top_box-100,270,270,270,1,4,2,50);
	RegularBlaster(320,-50,220,top_box-100,270,270,270,1,4,2,50);
}
if (_timer == 30)
{
	RegularBoneWall(DIR.UP,20,1,150,left_box + 130,top_box,50,246,0,false);
	RegularBoneWall(DIR.DOWN,20,1,150,left_box + 200,bottom_box,50,246,0,false);
}
if (_timer > 70) and (_timer < 286) and (_timer % 26 == 0)
{
	RegularBone(left_box + 155,top_box - 20,25,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 175,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 135,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
}
if (_timer == 330)
{
	RegularBone(right_box + 20,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 50,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 65,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 80,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 95,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 370)
{
	RegularBone(left_box - 20,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 50,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 65,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 80,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 95,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 110,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 410)
{
	RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer > 430) and (_timer < 630) and (_timer % 30 == 0)
{
	RegularBone(right_box,bottom_box,25,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 480)
{
	RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,170,1,2,2,50);
}
if (_timer == 550)
{
	RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,100,1,2,2,50);
}
if (_timer == 600)
{
	Battle_SlamUp();
	audio_play_sound(snd_impact,2,false);
}
if (_timer > 600) and (_timer % 5 == 0)
{
	RegularBone(right_box,top_box,25,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 680)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer == 650)
{
	RegularBlaster(320,-50,right_box + 100,top_box + 70,180,180,50,1,2,2,50);
}
if (_timer == 750)
{
	RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 800)
{
	RegularBone(right_box + 20,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box + 35,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 35,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 900)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* Sans flips a bone in mid-air.")
	Battle_EndTurn();
}