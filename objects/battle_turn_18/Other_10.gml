///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,125,125);
with (battle_enemy_engage)
{
	_head_alpha = 1;
	_spear_alpha = 1;
	_armleft_alpha = 1;
	_armright_alpha = 1;
	_legs_alpha = 1;
	p2_armleft_alpha = 1;
	p2_armright_alpha = 1;
	p2_body_alpha = 1;
	p2_cape_alpha = 1;
	p2_legs_alpha = 1;
	p2_head_alpha = 1;
	p2_thingy_alpha = 1;
}
global.checkornot = false;
if (room == room_battle)
{
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}The evacuees weren't&faring much better,&to be honest.{pause}{clear}{head 2}Apparently, people&thought that starting&riots was more&important than hiding.{pause}{clear}{head 3}Undyne had a heck of&a time getting things&under control.{pause}{clear}{head 10}I don't blame them...{pause}{clear}With me as their last&hope, I'd probably do&the same.";
}
if (room == room_battle_1)
{
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 1}diddy";
}