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

// Sahne t18'den devraliniyor: Alphys cikmis, Papyrus sahnede, Sans yok.
with (battle_enemy_engage)
{
	p2_head_sprite = spr_p2_head;
	p2_state = 0;
	pap_state = 2;
	alp_state = 0;
	pap_head_sprite = spr_papyrus_head;
}

// EASY'ye ozel Papyrus parcasi burada devreye giriyor ve turun sonunda geri
// alinmiyor: bundan sonrasi (t19, t20) da onun muzigiyle oynuyor.
// battle_turn_20 fade'i zaten global.p2_bgm uzerinden yapiyor.
Difficulty_PapyrusMuzikBasla();

sansy.text="{speaker 1}{font 4}{voice 4}{pap_head 0}HOLD ON A SECOND.{pause}{clear}"
+"{pap_head 11}SOMETHING'S&DIFFERENT ABOUT&YOU TODAY.{pause}{clear}"
+"{pap_head 4}YOU'RE SLOWER.&CLUMSIER.{pause}{clear}"
+"{pap_head 16}LIKE THE WORLD&DECIDED TO TAKE IT&EASY ON YOU.{pause}{clear}"
+"{pap_head 1}HEH. DON'T WORRY.{pause}{clear}"
+"{pap_head 5}I WON'T HOLD IT&AGAINST YOU.{pause}{clear}"
+"{pap_head 13}I'LL JUST HOLD IT&OVER YOU.{pause}{clear}"
+"{pap_head 16}NOW STAND UP.&THIS ROOM ANSWERS&TO ME.";

if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
