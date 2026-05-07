///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
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
	Battle_SetBoardSizeCubic(65,65,125,125);
	sansy.text = "{font 3}{voice 3}{squish 1.2}{head 1}Woah, now.{pause}{clear}{head 6}Going for the throat&already?{pause}{clear}{head 9}I can block faster&than you can swing&that toy.{pause}{clear}{head 8}So go ahead, swing&that wannabe sword&around...{pause}{clear}{head 14}See what good it does&you.";
}
if (room == room_battle_1)																																																																		   
{
	Battle_SetBoardSizeCubic(65,65,125,125);
	sansy.text= "{font 3}{voice 3}{squish 1.2}{head 14}117.{pause}{clear}{head 15}That's how many&Monsters were&entrusted to me when I&became Alphys' vice&captain.{pause}{clear}{head 25}We swore to have each&other's backs.{pause}{clear}{head 1}And that no matter&what, we would never&give up on each other.{pause}{clear}{head 12}I wouldn't even be&ALIVE if it weren't&for them!";
}