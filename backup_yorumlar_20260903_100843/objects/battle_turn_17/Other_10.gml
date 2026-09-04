///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,65,65);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}I thought if I could&just capture one of&you...{pause}{clear}{head 10}Then I'd prove her&right.{pause}{clear}{head 7}That I really COULD be&their captain.{pause}{clear}{head 14}But... being so scared,&I could barely move?{pause}{clear}{head 12}Guess that's one way&to make a point...";
}
if (room == room_battle_1)
{
	// Sans ve Papyrus sahneyi terk eder, Alphys ortaya gecer
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		p2_state = 3;				// Sans sola dogru ekran disina cikar
		pap_state = 3;				// Papyrus da sola cikar
		alp_state = 2;				// tek basina kaldigi icin otomatik ortaya gecer
		alp_head_sprite = spr_alphys_head;
	}
	sansy.text="{speaker 2}{font 2}{voice 2}{alp_head 5}Human!{pause}{clear}{alp_head 0}I saw you tear through&our home.{pause}{clear}{alp_head 1}Snowdin, Waterfall,&the royal guard...{pause}{clear}{alp_head 0}You must've thought&you were&unstoppable...{pause}{clear}{alp_head 3}Even got the best of&me when we first met.{pause}{clear}{alp_head_spr `spr_alphys_head_mad`}{alp_head 1}But that changes&nothing!{pause}{clear}{alp_head 0}This time, there will&be no mistakes!";
}

// SURRENDER ACT: bu tur ACT'tan geldiyse Sans'in kendi tur repligi yerine
// teslim yayinin repligi oynuyor (bkz. scripts/Surrender). Son turda (12)
// replik burada degil atagin sonunda oynadigi icin bu blok atlanir.
// Normal FIGHT akisinda global.surrender_turn false, blok hic calismaz.
if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
