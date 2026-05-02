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
if (_timer > 50) and (_timer < 350)
{
	if (_timer % 5 == 0)
	{
		RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
	}
}
if (_timer == 370)
{
	audio_play_sound(snd_impact,2,false);
	Battle_SlamLeft();
	RegularBoneWall(DIR.LEFT,140,12,70,left_box,top_box,50,180,0,false);
}
if (_timer == 380)
{
	RegularBlaster(-50,-50,left_box + 80,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer == 410)
{
	RegularBlaster(-50,-50,left_box + 110,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer == 440)
{
	RegularBlaster(-50,-50,left_box + 140,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer == 470)
{
	RegularBlaster(-50,-50,left_box + 170,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer == 500)
{
	RegularBlaster(-50,-50,left_box + 200,top_box - 70 ,270,270,30,5,1,2,40);
}
if (_timer == 410)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
}
if (_timer > 550) and (_timer < 780) and (_timer % 60 == 0)
{
	RegularBone(left_box,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,down_box,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,down_box,82,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 800)
{
    Battle_SetBoardSizeCubic(65,65,65,65);
}
if (_timer == 820)
{
	with (o_excmark)
	{
		image_index = 2;
	}
	instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
	audio_play_sound(snd_bonewarn,2,false);
}
if (_timer == 860)
{
	RegularBone(right_box + 110,top_box + 50,150,-6,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,top_box + 60,150,-6,0,90,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 110,top_box + 70,150,-6,0,90,0,0,1,0,0,0,0,true);
}
if (_timer == 940)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* Sans stares you down.")
	Battle_EndTurn();
}