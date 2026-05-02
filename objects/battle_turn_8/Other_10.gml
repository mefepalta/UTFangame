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
sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}I wasn't exactly...&the STRONGEST, growing&up.{pause}{clear}{head 10}Admittedly, even now,&a lot of monsters&probably outrank me&tenfold...";
