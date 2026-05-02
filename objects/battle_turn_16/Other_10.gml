///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,185,185);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 4}So we held weekly&training sessions.&{head 3}''Captain training.''{pause}{clear}{head 0}She wanted me as ready&as I could possibly be.{pause}{clear}{head 10}I dedicated every&waking hour to&bettering myself.{pause}{clear}{head 11}Our final battle was&scheduled for just a&few days from now.{pause}{clear}{head 12}But I guess...{pause}{clear}Now that I'm her...&successor...{pause}{clear}...{pause}{clear}{head 11}Maybe it IS just&another unearned&title...";
}
if (room == room_battle_1)
{
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 1}diddy";
}