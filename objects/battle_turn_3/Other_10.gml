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
	Battle_SetBoardSizeCubic(65,65,150,150);
	sansy.text = "{font 3}{voice 3}{squish 1.2}{head 2}But actually seeing it&happen in person?{pause}{clear}{head 3}A pile of dust where&life once stood?{pause}{clear}{head 11}Now that's an image&nearly impossible to&get out of your mind.";
}
if (room == room_battle_1)																																																																		   
{
	Battle_SetBoardSizeCubic(65,65,250,250);
	sansy.text= "{font 3}{voice 3}{head 5}Admitting this is gonna&be a bit of a challenge&for me, but...{pause}{clear}{head 14}Honestly...&the thought of them&fighting...{sleep 100}{head 13} scared me.";
}