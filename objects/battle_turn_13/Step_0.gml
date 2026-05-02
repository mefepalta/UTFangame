var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

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
	Battle_EndTurn();
}