var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_timer == 50)
{
	Battle_SlamLeft();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.LEFT,135,12,45,left_box,top_box,65,35,0,false);
	//RegularBone(left_box,bottom_box,162,0,-2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,44,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,84,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,44,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,top_box,84,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 170)
{
	Battle_SlamLeft();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.LEFT,135,12,45,left_box,top_box,65,35,0,false);
	//RegularBone(left_box,bottom_box,162,0,-2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,24,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,104,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,24,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,top_box,104,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 290)
{
	Battle_SlamUp();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.UP,145,12,45,left_box,top_box,65,35,0,false);
	//RegularBone(left_box,bottom_box,162,2.5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,24,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,104,0,-3,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box + 10,24,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box + 10,104,0,-3,90,0,0,1,0,0,0,0,true);
}
if (_timer == 410)
{
	Battle_SlamRight();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.RIGHT,135,12,45,right_box,top_box,65,35,0,false);
	//RegularBone(left_box,top_box - 10,162,0,2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 530)
{
	Battle_SlamDown();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.DOWN,145,12,45,left_box,bottom_box,65,35,0,false);
	//RegularBone(right_box,bottom_box,162,-2.5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,104,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,24,0,3,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box - 10,104,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box - 10,24,0,3,90,0,0,1,0,0,0,0,true);
}
if (_timer == 650)
{
	Battle_SlamRight();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.RIGHT,135,12,45,right_box,top_box,65,35,0,false);
	//RegularBone(left_box,top_box - 10,162,0,2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,104,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,top_box,24,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,104,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,24,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 770)
{
	Battle_SlamDown();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.DOWN,145,12,45,left_box,bottom_box,65,35,0,false);
	//RegularBone(right_box,bottom_box,162,-2.5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,44,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,84,0,3,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box - 10,44,0,3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box - 10,84,0,3,90,0,0,1,0,0,0,0,true);
}
if (_timer == 890)
{
	Battle_SlamRight();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.RIGHT,135,12,45,right_box,top_box,65,35,0,false);
	//RegularBone(left_box,top_box - 10,162,0,2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 1010)
{
	Battle_SlamRight();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.RIGHT,135,12,45,right_box,top_box,65,35,0,false);
	//RegularBone(left_box,top_box - 10,162,0,2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,104,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,top_box,24,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,104,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,24,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 1130)
{
	Battle_SlamRight();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.RIGHT,135,12,45,right_box,top_box,65,35,0,false);
	//RegularBone(left_box,top_box - 10,162,0,2.5,270,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,94,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,top_box,34,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,94,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,top_box,34,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 1250)
{
	Battle_SlamUp();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.UP,145,12,45,left_box,top_box,65,35,0,false);
	//RegularBone(left_box,bottom_box,162,2.5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,44,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,84,0,-3,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box - 10,44,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box - 10,84,0,-3,90,0,0,1,0,0,0,0,true);
}
if (_timer == 1370)
{
	Battle_SlamUp();
	audio_play_sound(snd_impact,2,false);
	RegularBoneWall(DIR.UP,145,12,45,left_box,top_box,65,35,0,false);
	//RegularBone(left_box,bottom_box,162,2.5,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,44,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,84,0,-3,90,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box - 10,44,0,-3,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box - 10,84,0,-3,90,0,0,1,0,0,0,0,true);
}
if (_timer == 1500)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
	Battle_SetMenuDialog("* There's no going back.")
	Battle_EndTurn();
}