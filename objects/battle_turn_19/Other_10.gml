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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}But...{pause}{clear}{head 9}For all the misery&we've been going&through...{pause}{clear}{head 1}You'd think I'd be&more upset.{pause}{clear}Is it weird that I'm&not?{pause}{clear}{head 4}Because at this&point...{pause}{clear}{head 0}There isn't much more&I can do to help.{pause}{clear}{head 11}I'm not even a fourth&of Alphys' full&strength...{pause}{clear}{head 12}And yet you still&managed to beat her&even AFTER she blew&past her limits.{pause}{clear}{head 3}So, where in the world&does that leave me,&exactly?";
}
if (room == room_battle_1)
{
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 1}diddy";
}