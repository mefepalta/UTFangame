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
if (room == room_battle_1)
{
	// Son saldiri: ucu birden sahneye geri gelir
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		p2_state = 2;				// Sans ortada
		pap_state = 1;				// Papyrus soldan geri geliyor
		alp_state = 1;				// Alphys sagdan geri geliyor
		alp_head_sprite = spr_alphys_head;
	}
	sansy.text="{speaker 1}{font 4}{voice 4}{pap_head 1}ALWAYS SO&MELODRAMATIC,&SANS.{pause}{clear}{pap_head 0}LET'S JUST GET A&MOVE ON ALREADY.{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 4}I don't remember&taking orders from&you, Papyrus.{pause}{clear}{head 17}And in case you&forgot, I'm still&your boss.{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 5}And I'm BOTH your&guy's boss!{pause}{clear}{alp_head 4}So you boneheads&better listen up!{pause}{clear}{alp_head 0}We won't defeat them&if we don't work as&a team.{pause}{clear}{alp_head 1}So here's the plan.{pause}{clear}{alp_head 5}We hit 'em with&EVERYTHING we have!{pause}{clear}{alp_head 4}Pouring every last bit&of power we can muster&into one last focused&attack!{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 11}EHH, THAT PLAN&SOUNDS LIKE&SOMETHING YOU DO{pause}{clear}RIGHT BEFORE YOU&LOSE.{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 14}And one we're gonna&have to bet on.{pause}{clear}{head 13}I can't hold out much&longer...{pause}{clear}{head 25}My power is...{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 5}Then shut up and&fight!{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 16}ROGER.";
}
if (room == room_battle)
{
	sansy.text="{font 3}{voice 3}{head 8}But... being weaker&than something isn't a&pass to give up.{pause}{clear}{head 9}No excuse is good&enough for something&like that.{pause}{clear}{head 1}So, I think I'll have a&little change of heart,&if ya don't mind.{pause}{clear}{head 7}Beating you probably&won't happen.{pause}{clear}{head 8}So throughout our&fight...{pause}{clear}{head 0}I won't aim to become&the strongest anymore.{pause}{clear}{head 13}Instead, I'll use this&as an opportunity to&test myself and my&limits...{pause}{clear}{head 4}I'll keep bettering&myself and see just&how far I've come over&the years.{pause}{clear}{head 13}And have a heck of a&time living out&however long I have&left!";
}
