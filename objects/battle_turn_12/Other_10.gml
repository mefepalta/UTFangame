///@desc Turn Preparation Start
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 2}I wanted to protest,&I assure you.{pause}{clear}{head 3}But, I was in no&position to do so,&given our ranks.{pause}{clear}{head 11}So I did as my&superior ordered.{pause}{clear}{head 14}Wait. And be still.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 5}I was SUPPOSED to give&him an earful on how&being late can affect&your ranking.{pause}{clear}{head 1}But the crowd thought&it was part of a bit.{pause}{clear}{head 2}So somehow, someway...{pause}{clear}{head 13}I got dragged into&his show...";
}