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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}But...{pause}{clear}{head 9}For all the misery&we've been going&through...{pause}{clear}{head 1}You'd think I'd be&more upset.{pause}{clear}Is it weird that I'm&not?{pause}{clear}{head 4}Because at this&point...{pause}{clear}{head 0}There isn't much more&I can do to help.{pause}{clear}{head 11}I'm not even a fourth&of Alphys' full&strength...{pause}{clear}{head 12}And yet you still&managed to beat her&even AFTER she blew&past her limits.{pause}{clear}{head 3}So, where in the world&does that leave me,&exactly?";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		p2_state = 1;
		pap_state = 2;
		alp_state = 0;
	}
	sansy.text="{speaker 0}{font 3}{voice 3}{head 2}Come on, Papyrus, let&me have a crack at&'em.{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}SUIT YOURSELF. I&WAS GETTING&TIRED ANYWAY.{pause}{clear}{pap_state 3}"
	+"{speaker 0}{font 3}{voice 3}{head 17}No more will we suffer&at the hands of&humanity.{pause}{clear}{head 9}We will finally see&the sun, feel the&warmth.{pause}{clear}{head 12}And feel a sense of&gratitude in the fact&that you no longer&exist in our world.";
}

if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
