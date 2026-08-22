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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}The evacuees weren't&faring much better,&to be honest.{pause}{clear}{head 2}Apparently, people&thought that starting&riots was more&important than hiding.{pause}{clear}{head 3}Undyne had a heck of&a time getting things&under control.{pause}{clear}{head 10}I don't blame them...{pause}{clear}With me as their last&hope, I'd probably do&the same.";
}
if (room == room_battle_1)
{
	// Sans hala sahne disinda; Papyrus geri doner, Alphys ortadan cekilir
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		p2_state = 0;				// Sans hala sahne disinda
		pap_state = 1;				// Papyrus kendi yerine geri geliyor
		alp_state = 2;				// Alphys 17. turdan beri sahnede
		alp_head_sprite = spr_alphys_head_mad;
	}
	sansy.text="{speaker 2}{font 2}{voice 2}{alp_head 1}Hey, I told you to&stay out of my way!{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 4}WELL EXCUSE ME,&CAPTAIN.{pause}{clear}{pap_head 16}THIS HUMAN IS&OUR BUSINESS&TOO.{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head_spr `spr_alphys_head`}{alp_head 0}Fine. You can have&'em.{pause}{clear}{alp_head 4}But you better take&them seriously this&time!{pause}{clear}{alp_state 3}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}GOOD RIDDENCE.{pause}{clear}{pap_head 0}HEY.{pause}{clear}{pap_head 11}SO, IN CASE YOU&WEREN'T PAYING&ATTENTION...{pause}{clear}{pap_head 5}NAME'S PAPYRUS.&HI.{pause}{clear}{pap_head 13}THE SAME GUY YOU&TURNED TO DUST&BACK IN SNOWDIN.{pause}{clear}{pap_head 1}GOOD TIMES,&GOOD TIMES.{pause}{clear}{pap_head 16}MIND IF I RETURN&THE FAVOR?";
}