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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 1}She's actually the one&who told me about you.{pause}{clear}{head 5}Said it was a code red,&and to ready my men.{pause}{clear}{head 11}I tried laughing it&off.{pause}{clear}{head 12}But that look on her&face...{pause}{clear}{head 1}Heh.{pause}{clear}{head 4}Y'know, next to you,&I'd say she's the&worst of 'em all.{pause}{clear}{head 0}Surprised you got to&her like that.";
}
if (room == room_battle_1)																																																																		   
{
	sansy.text= "{font 3}{voice 3}{head 2}They made a choice&that day...{pause}{clear}{head 3}To stand up knowing&exactly how that fight&would end.{pause}{clear}{head 10}Not because they&thought they could&win...{pause}{clear}{head 0}But because it was the&right thing to do.";
}