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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 7}She always said how&she'd make me captain&someday.{pause}{clear}{head 5}The plan was to wait a&day before retirement...{pause}{clear}{head 8}Queen's been&pressuring her to&choose a successor.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		// Papyrus bu turun ortasinda canlaniyor. Tur tekrar oynarsa sahne bir
		// daha oynamaz, o yuzden bastan sahnede duruyor.
		pap_state = (global.p2_revived_pap ? 2 : 0);
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 14}My only regret was not&doing the same for&him...{pause}{clear}{head 13}And never having&the courage to&say...{sleep 30} thank you.{pause}{clear}{head 25}Two words...{pause}{clear}Was it really so hard?{pause}{clear}{head 15}What would he even&say...{sleep 30} if he saw me&now?{pause}{clear}"
	+"{revive 1}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 9}SURPRISE,&SURPRISE, LITTLE&HUMAN!{pause}{clear}{pap_head 16}YOUR GOOD PAL&PAPYRUS IS BACK&FROM THE DEAD!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 6}These powers make no&sense.{pause}{clear}{head 2}But I guess I can&solve the mysteries of&that, later.";
}