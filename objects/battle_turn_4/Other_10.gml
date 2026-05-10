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
	sansy.text = "{font 3}{voice 3}{squish 1.2}{head 1}An old friend of mine&gave me this spear.{pause}{clear}{head 0}The brilliant Doctor&Undyne.{pause}{clear}{head 14}Designed purely from&magic for the sole&purpose of capturing a&human SOUL.";
}
if (room == room_battle_1)																																																																		   
{
	Battle_SetBoardSizeCubic(65,65,65,65);
	sansy.text= "{font 3}{voice 3}{squish 1.2}{head 5}I gave them specific&orders to wait for me&before engaging you.{pause}{clear}{head 20}I knew how dangerous&the job was.{pause}{clear}{head 17}But they did too!{pause}{clear}{head 14}Which is exactly why&they did what any&true hero would...{pause}{clear}{head 12}And fought valiantly...&living every moment to&the fullest.";
}