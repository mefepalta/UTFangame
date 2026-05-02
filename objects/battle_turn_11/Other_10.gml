///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,65,65);
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
sansy.text="{font 3}{voice 3}{squish 1.2}{head 8}I thought we could&fight alongside each&other...{pause}{clear}{head 14}But she shot me down.{pause}{clear}And basically said that&with the power I&currently have...{pause}{clear}{head 12}It'd be better if I&protected the&evacuees in case of an&emergency.";
