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
    Battle_SetBoardSizeCubic(65,65,65,65);
}
if (_timer > 20) and (_timer < 320) and (_timer % 30 == 0)
{
	RegularBone(left_box,bottom_box,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 350)
{
	with (o_excmark)
	{
		image_index = 0;
	}
	instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
	audio_play_sound(snd_bonewarn,2,false);
}
if (_timer == 370)
{
	RegularBone(left_box + 60,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 70,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box + 80,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
}
if (_timer > 400) and (_timer < 520) and (_timer % 30 == 0)
{
	RegularBone(left_box,bottom_box,82,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 560)
{
	with (o_excmark)
	{
		image_index = 2;
	}
	instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
	audio_play_sound(snd_bonewarn,2,false);
}
if (_timer == 530)
{
	RegularBlaster(-50,-50,left_box + 70,top_box - 80,270,270,30,5,2,2,50);
}
if (_timer == 580)
{
	RegularBlaster(-50,-50,left_box + 10,top_box - 80,270,270,30,5,1,2,50);
	RegularBlaster(-50,-50,right_box - 10,top_box - 80,270,270,30,5,1,2,50);
}
if (_timer == 600)
{
	RegularBone(left_box - 80,top_box + 50,77,7,0,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 80,top_box + 60,77,7,0,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 80,top_box + 70,77,7,0,90,0,0,1,0,0,0,0,true);
}
if (_timer == 730)
{
	Battle_SetSoul(battle_soul_red);
	Battle_SetMenuDialog("* The beginning of the end.")
	Battle_EndTurn();
}