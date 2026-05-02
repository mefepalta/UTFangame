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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 6}When Papyrus told me&you were in Waterfall,&I trusted him.{pause}{clear}{head 3}I thought I could, at&least.{pause}{clear}{head 2}I was just too caught&up to realize how&faint his smile was.";
}
if (room == room_battle_1)																																																																		   
{
	sansy.text= "{font 3}{voice 3}{head 11}They kept pushing&forward, throwing&everything they had&at you.{pause}{clear}{head 16}Never wavering, not&even for a second.{pause}{clear}{head 2}I couldn't have asked&for a better team...";
}