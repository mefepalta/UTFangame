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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 11}So I marched straight&into Waterfall.{pause}{clear}{head 9}The Captain has tons&of experience fighting&humans.{pause}{clear}{head 7}Surely she would know&what to do.";
}
if (room == room_battle_1)
{
	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 0;
		alp_state = 2;
	}
	sansy.text="{font 3}{voice 3}{head 2}I remember one day in&particular because it&was raining pretty&hard outside.{pause}{clear}{head 1}Now, it's been pouring&for days at this point.{pause}{clear}{head 4}And Papyrus, like&usual, snuck off during&training, nowhere to&be seen.{pause}{clear}{head 5}So naturally, I was&sent to drag his sorry&self back to the&village.";
}

// SURRENDER ACT: bu tur ACT'tan geldiyse Sans'in kendi tur repligi yerine
// teslim yayinin repligi oynuyor (bkz. scripts/Surrender). Son turda (12)
// replik burada degil atagin sonunda oynadigi icin bu blok atlanir.
// Normal FIGHT akisinda global.surrender_turn false, blok hic calismaz.
if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
