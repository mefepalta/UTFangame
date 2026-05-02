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
	Battle_SetBoardSizeCubic(65,65,220,220);
	audio_play_sound(snd_impact,2,false);
}
if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
{
	RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
{
	RegularBone(right_box,top_box,24,-4,0,180,0,0,1,0,0,0,0,true);
}
if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
{
	RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,10,20,2,2,50);
}
if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
{
	RegularBlaster(320,-50,left_box - 50,battle_soul.y,0,0,10,20,2,2,50);
}
if (_timer == 580)
{
	Battle_SetBoardSizeCubic(65,65,110,110);
}
if (_timer > 650) and (_timer < 1150) and (_timer % 60 == 0)
{
	RegularBone(left_box + 120,bottom_box + 30,24,0,-2,0,0,0,1,0,0,0,0,true);
}
if (_timer > 650) and (_timer < 1150) and (_timer % 70 == 0)
{
	RegularBone(left_box,bottom_box,24,2,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 650)
{
	with (o_smaaash)
	{
		audio_play_sound(snd_smash_rise,2,0);
		_ready = true;
	}
}
if (_timer > 650) and (_timer % 90 == 0)
{
	bluddy = random_range(0,1);
}
if (bluddy < 0.5) and (bluddy >= 0)
{
	if (_timer > 650) and (_timer < 1150) and (_timer % 90 == 0)
	{
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,00),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
	}
	}
if (bluddy > 0.5) and (bluddy <= 1)
{
	if (_timer > 650) and (_timer < 1150) and (_timer % 90 == 0)
	{
		
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
		RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
	}
}
if (_timer == 1150)
{
	with (o_smaaash)
	{
		_ready = false;
	}
	anotherTest = instance_create_depth(0,0,0,battle_dialog_enemy);
	anotherTest.text = "{font 3}{voice 3}{head 13}{squish 1.2}you'll soon get what's&coming to you.";
}
if (_timer > 1150)
{
	if !(instance_exists(anotherTest))
	{
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* He's preparing something.")
		Battle_EndTurn();
	}
}