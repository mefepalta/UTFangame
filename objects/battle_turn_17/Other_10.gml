///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,65,65);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}I thought if I could&just capture one of&you...{pause}{clear}{head 10}Then I'd prove her&right.{pause}{clear}{head 7}That I really COULD be&their captain.{pause}{clear}{head 14}But... being so scared,&I could barely move?{pause}{clear}{head 12}Guess that's one way&to make a point...";
}
if (room == room_battle_1)
{
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 1}diddy";
}