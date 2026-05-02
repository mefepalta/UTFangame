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