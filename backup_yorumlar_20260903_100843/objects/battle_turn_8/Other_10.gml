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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}I wasn't exactly...&the STRONGEST, growing&up.{pause}{clear}{head 10}Admittedly, even now,&a lot of monsters&probably outrank me&tenfold...";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;		// Papyrus daha sahnede degil
		// Alphys bu turun ortasinda canlaniyor. Tur tekrar oynarsa (item/ACT
		// sonrasi) sahne bir daha oynamaz, o yuzden bastan sahnede duruyor.
		alp_state = (global.p2_revived_alp ? 2 : 0);
	}
	sansy.text= "{font 3}{voice 3}{head 12}They TRUSTED me,&human. You know how&much that means?!{pause}{clear}{head 13}But I froze.{pause}{clear}{head 21}My legs were stuck to&the floor, I couldn't&move an inch!{pause}{clear}{head 14}I should've fought&with them...{sleep 30} I know&she would have.{pause}{clear}"
	+"{revive 2}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 5}AAAUGGGH!&Where are they?!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 6}Alphys?!{pause}{clear}{head 25}How did...{sleep 25} why did...{pause}{clear}...{pause}{clear}{head 1}Heh.{pause}{clear}{head 2}I suppose it doesn't&matter.{pause}{clear}{head 0}You ready?{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 4}You talk too much!&Lemme crush 'em!";
}
