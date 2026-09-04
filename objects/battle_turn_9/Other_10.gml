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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 2}So Of COURSE he'd take&you on.{pause}{clear}{head 3}He NEVER wanted me to&fight a human!{pause}{clear}{head 11}Especially not by&myself.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 11}When things got a&little too&overwhelming...{pause}{clear}{head 2}Papyrus was always&there to soften the&blow...{pause}{clear}{head 1}He helped so many&people this way...";
}

if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
