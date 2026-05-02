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
	sansy.text = "{font 3}{voice 3}{squish 1.2}{head 14}You're nothing new.{pause}{clear}{head 12}All the carnage...&heartache you brought?{pause}{clear}{head 14}I've seen it all&before.{pause}{clear}{head 11}Live for as long as I&have, and you're bound&to hear about it&eventually.";
}
if (room == room_battle_1)																																																																		   
{
	sansy.text= "{font 3}{voice 3}{head 11}We spent every waking&moment...{pause}{clear}{head 10}Every possible second&of our lives...{pause}{clear}{head 6}...preparing for&something like you to&come steal it from us.";
}