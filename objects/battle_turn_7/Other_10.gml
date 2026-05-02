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
	sansy.text = "{font 3}{voice 3}{squish 1.2}{head 10}And when it finally&dawned on me, I rushed&back to the village...{pause}{clear}{head 11}I couldn't feel my&legs.{pause 0.1} It was probably&the fastest I ever ran.{pause}{clear}{head 14}But when I got&there...{pause}{clear}{head 12}He was already...{pause}{clear}{head 2}...Tch...";
}
if (room == room_battle_1)																																																																		   
{
	sansy.text= "{font 3}{voice 3}{head 9}My Captain was the&same way...{pause}{clear}{head 2}With a heart of gold,&she made for the&perfect role model.{pause}{clear}{head 10}Amazingly charismatic,&impossibly patient,&unbelievably loyal...{pause}{clear}Brave, fearless,&determined, you name&it.{pause}{clear}{head 14}Yeah... just about&everything I could've&been.{pause}{clear}{head 15}Everything I messed up&on.";
}