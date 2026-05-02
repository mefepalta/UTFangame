var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 10)
	{
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 40)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 80)
	{
		RegularBlaster(270,-50,270,top_box-100,270,270,100,1,2,2,50);
		RegularBlaster(370,-50,370,top_box-100,270,270,100,1,2,2,50);
	}
	if (_timer == 120)
	{
		RegularBone(left_box,bottom_box,65,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,65,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,65,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,65,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 150)
	{
		RegularBone(left_box,bottom_box,25,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,105,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,25,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,105,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 190)
	{
		RegularBone(left_box,bottom_box,105,4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,25,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,105,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,25,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 220)
	{
		Battle_SlamDown();
	}
	if (_timer == 230)
	{
		RegularBone(right_box,top_box,84,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,top_box,79,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,top_box,74,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,top_box,69,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,top_box,64,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,top_box,59,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,top_box,54,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,top_box,49,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,top_box,44,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,top_box,39,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,top_box,34,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,top_box,29,-4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box+10,bottom_box,29,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+20,bottom_box,34,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+30,bottom_box,39,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+40,bottom_box,44,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+50,bottom_box,49,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+60,bottom_box,54,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+70,bottom_box,59,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+80,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+90,bottom_box,69,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+100,bottom_box,74,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,79,-4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer == 290)
	{
		RegularBone(left_box,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-10,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-20,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-30,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-40,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-50,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box-60,bottom_box,76,5,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 320) and (_timer < 720) and (_timer % 40 == 0)
	{
		RegularBone(left_box,bottom_box,20,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,102,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box,20,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,102,-5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box-110,bottom_box,152,5,0,0,1,0,1,0,0,0,0,true);
		RegularBone(right_box+110,bottom_box,152,-5,0,0,1,0,1,0,0,0,0,true);
	}
	if (_timer = 760)
	{
		RegularBoneWall(DIR.LEFT,135,13,110,left_box,top_box,50,50,0,false);
		RegularBoneWall(DIR.RIGHT,135,13,110,right_box,top_box,50,50,0,false);
	}
	if (_timer = 770)
	{
		RegularBlaster(320,-50,right_box + 60,bottom_box - 20,180,180,20,1,2,2,50);
	}
	if (_timer == 820)
	{
		Battle_SetSoul(battle_soul_red);
		audio_play_sound(snd_bell,2,0);
	}
	if (_timer > 840) and (_timer < 1200) and (_timer % 40 == 0)
	{
		RegularBone(left_box - 110,bottom_box,82,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,82,5,0,180,0,0,1,0,0,0,0,true);
		RegularBone(right_box + 110,bottom_box,82,-5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,82,-5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 1240)
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