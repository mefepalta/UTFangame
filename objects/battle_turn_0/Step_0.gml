var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (_intro_timer == 1)
{
	audio_play_sound(snd_glisterbones,1,true);
	battle_enemy_engage.p2_head_sprite = spr_p2_head;
}
if (_intro_timer == 20)
{
	testDialog = instance_create_depth(0,0,0,battle_dialog_enemy);
	testDialog.text = "{font 3}{voice 3}{head 1}I get it now.{pause}{clear}{head 2}When Alphys was pushed&to the brink... {pause}{clear}{head 7}She tapped into&something greater than&herself.{pause}{clear}{head 15}Can I really do this?&What if I can't&control it?{pause}{clear}{head 14}...I'll find a way.{pause}{clear}{head 0}Because now... my soul&burns with the same&desire she once had.{pause}{clear}{head 7}Infused with every&last bit of hope this&world can offer me...{pause}{clear}{head 2}I promise that by the&end of today...{pause}{clear}{head 17}You'll know what it's&like... to face the&power of a thousand&suns!{pause}{clear}{script `flash_on`}{sleep 20}{script `testScript`}{script `flash_off`}{head 0}And know how strong&hope really is!";
}

if (_intro_timer > 20)										 
{
	if !(instance_exists(testDialog))
	{
		_start = "turn";
	}
}
if (_timer = 1)
{
	battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	Battle_SetBoardSizeCubic(65,65,130,130);
	Battle_SlamDown();
	battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
	RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,20,0,false);
}
if (_timer = 7)
{
	battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
}
if (_timer = 20)
{
	RegularBlaster(0,0,battle_soul.x,top_box - 80,0,270,18,20,2,2,25);
}
if (_timer = 70)
{
	Battle_SlamDown();
	battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right_slamdown;
	RegularBoneWall(DIR.DOWN,370,31,45,left_box,bottom_box,50,20,0,false);
}
if (_timer = 76)
{
	battle_enemy_engage.p2_armright_sprite = spr_p2_arm_right;
}
if (_timer = 90)
{
	RegularBlaster(0,0,battle_soul.x,top_box - 80,0,270,18,20,2,2,25);
}
if (_timer = 160)
{
	RegularBone(right_box,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 15,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 15,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 15,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 15,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer = 230)
{
	RegularBone(right_box - 5,top_box,160,0,2.5,90,0,0,1,0,0,0,0,true);
}
if (_timer = 250)
{
	RegularBone(left_box + 5,top_box,160,0,2.5,270,0,0,1,0,0,0,0,true);
}
if (_timer = 270)
{
	RegularBone(right_box - 5,top_box,160,0,2.5,90,0,0,1,0,0,0,0,true);
}
if (_timer = 290)
{
	RegularBone(left_box + 5,top_box,160,0,2.5,270,0,0,1,0,0,0,0,true);
}
if (_timer = 320)
{
	RegularBlaster(0,0,battle_soul.x,top_box - 80,0,270,18,20,2,2,25);
	RegularBlaster(0,0,left_box - 50,battle_soul.y,0,0,18,20,2,2,25);
}
if (_timer = 410)
{
	RegularBone(right_box,top_box,92,-4,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 15,top_box,92,-4,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,92,-4,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 15,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer = 430)
{
	RegularBone(left_box,top_box,32,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 15,top_box,32,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,top_box,32,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,92,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 15,bottom_box,92,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 30,bottom_box,92,3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 520) and (_timer < 620) and (_timer % 10 == 0)
{
	RegularBone(right_box,bottom_box,152,-8,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box,bottom_box,152,8,0,0,1,0,1,0,0,0,0,true);
}
if (_timer = 620)
{
	Battle_SetMenuDialog("* He doesn't look happy.")
	Battle_EndTurn();
}