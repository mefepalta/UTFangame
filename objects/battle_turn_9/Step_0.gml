var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_timer == 1)
{
	Battle_SetSoul(battle_soul_red);
    Battle_SetBoardSizeCubic(65,65,130,130);
}
if (_timer == 50)
{
	RegularBone(left_box - 30,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 40,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 90)
{
	RegularBone(left_box - 30,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 40,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 130)
{
	RegularBone(left_box,top_box,120,5,0,180,0,0,1,0,0,0,0,true);
	audio_play_sound(snd_stab,2,false);
}
if (_timer == 150)
{
	RegularBoneWall(DIR.DOWN,280,25,40,left_box,bottom_box,50,999,0,false);
}
if (_timer == 230)
{
	RegularBone(left_box,top_box,70,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,70,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 280)
{
	RegularBoneWall(DIR.UP,280,25,40,left_box,top_box,50,999,0,false);
	RegularBone(left_box,top_box,30,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,110,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,30,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,110,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 280) and (_timer < 480) and (_timer % 40 == 0)
{
	RegularBlaster(-50,-50,battle_soul.x,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer > 520) and (_timer < 720) and (_timer % 30 == 0)
{
	audio_play_sound(snd_pullback,2,false);
	RegularBone(left_box - 30,top_box + random_range(40,80),20,3,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box + random_range(40,80),20,-3,0,90,0,0,1,0,0,0,0,true);
}
if (_timer == 760)
{
	Battle_SlamLeft();
}
if (_timer == 780)
{
	RegularBone(left_box,bottom_box,152,0.5,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 800)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer == 820)
{
	RegularBone(right_box,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 40,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 860)
{
	RegularBone(right_box,top_box,60,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,top_box,70,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,90,-1.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 50,bottom_box,60,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 60,bottom_box,70,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 70,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 80,bottom_box,90,-1.5,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 90,bottom_box,152,-1.5,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 1070)
{
	Battle_SlamRight();
	RegularBoneWall(DIR.RIGHT,180,14,20,right_box,top_box,50,999,0,false);
}
if (_timer == 1150)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* It smells like bones in here.")
	Battle_EndTurn();
}