///@desc Turn Preparation Start
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
Battle_SetBoardSizeCubic(65,65,185,185);
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
	sansy.text="{font 3}{voice 3}{squish 1.2}{head 4}So we held weekly&training sessions.&{head 3}''Captain training.''{pause}{clear}{head 0}She wanted me as ready&as I could possibly be.{pause}{clear}{head 10}I dedicated every&waking hour to&bettering myself.{pause}{clear}{head 11}Our final battle was&scheduled for just a&few days from now.{pause}{clear}{head 12}But I guess...{pause}{clear}Now that I'm her...&successor...{pause}{clear}...{pause}{clear}{head 11}Maybe it IS just&another unearned&title...";
}
if (room == room_battle_1)
{
	// Diyalog ATAK BITTIKTEN SONRA basliyor. O yuzden burada diyalog kutusu
	// acmiyoruz; acsaydik turn preparation kapanmaz ve atak hic baslamazdi.
	if (instance_exists(sansy)) { instance_destroy(sansy); }

	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 2;		// ucu de sahnede
		alp_state = 2;
	}

	// Metin Step_0'da, atak bitince kullanilacak.
	phase2_text="{speaker 2}{font 2}{voice 2}{alp_head 1}I've been waiting a&long time for this!{pause}{clear}{alp_head 4}You guys scram!{pause}{clear}{alp_head 1}I've got this!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 13}Captain...&Are you sure?{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 0}I've fought my fair&share of humans&before.{pause}{clear}{alp_head 0}I know what I'm&doing.{pause}{clear}{alp_head 5}THAT...{sleep 20} AND the&score's looking like&a solid 0 to 1&right now...{pause}{clear}{alp_head 5}And I've never been&more livid in my&life!{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}AFTERLIFE.{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 25}Fine. Just...&be careful.{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}LESS WORK FOR&ME.";
}
