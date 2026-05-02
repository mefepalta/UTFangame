///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,150,150);
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
with (battle_enemy_engage)
{
	_head_alpha = 1;
	_spear_alpha = 1;
	_armleft_alpha = 1;
	_armright_alpha = 1;
	_legs_alpha = 1;
}
global.checkornot = false;
sansy.text="{font 3}{voice 3}{head 8}But... being weaker&than something isn't a&pass to give up.{pause}{clear}{head 9}No excuse is good&enough for something&like that.{pause}{clear}{head 1}So, I think I'll have a&little change of heart,&if ya don't mind.{pause}{clear}{head 7}Beating you probably&won't happen.{pause}{clear}{head 8}So throughout our&fight...{pause}{clear}{head 0}I won't aim to become&the strongest anymore.{pause}{clear}{head 13}Instead, I'll use this&as an opportunity to&test myself and my&limits...{pause}{clear}{head 4}I'll keep bettering&myself and see just&how far I've come over&the years.{pause}{clear}{head 13}And have a heck of a&time living out&however long I have&left!";
