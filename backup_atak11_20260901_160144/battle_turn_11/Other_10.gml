///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,65,65);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 8}I thought we could&fight alongside each&other...{pause}{clear}{head 14}But she shot me down.{pause}{clear}And basically said that&with the power I&currently have...{pause}{clear}{head 12}It'd be better if I&protected the&evacuees in case of an&emergency.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 3}I dipped inside this&huge hotel, where&Papyrus...{pause}{clear}{head 4}...who was totally&ignoring my texts,&by the way...{pause}{clear}{head 0}Was performing one of&his...{pause}{clear}{head 1}How do I say this&lovingly?{pause}{clear}{head 22}AWFUL stand-up&routines.";
}

// SURRENDER ACT: bu tur ACT'tan geldiyse Sans'in kendi tur repligi yerine
// teslim yayinin repligi oynuyor (bkz. scripts/Surrender). Son turda (12)
// replik burada degil atagin sonunda oynadigi icin bu blok atlanir.
// Normal FIGHT akisinda global.surrender_turn false, blok hic calismaz.
if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
