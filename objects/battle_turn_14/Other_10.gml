sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,125,125);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 14}But you beat me to it.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 1}He had this sort of&way of putting people&at ease.{pause}{clear}{head 2}I'd vent a lot when we&were little, and he'd&just sit there with a&smile on his face.{pause}{clear}{head 13}He did that for&everyone else, too.";
}

if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
