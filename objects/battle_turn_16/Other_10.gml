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
	// Bu turda saldiri yok: Papyrus yesil kemikle canini dolduruyor ve diyalog
	// ATAK BITTIKTEN SONRA basliyor. O yuzden burada diyalog kutusu acmiyoruz;
	// acsaydik turn preparation kapanmaz ve sahne hic baslamazdi.
	if (instance_exists(sansy)) { instance_destroy(sansy); }

	with (battle_enemy_engage)
	{
		p2_head_sprite = spr_p2_head;
		pap_state = 2;		// ucu de sahnede
		alp_state = 2;
	}

	// Metin Step_0'da, iyilestirme bitince kullanilacak
		phase2_text="{speaker 1}{font 4}{voice 4}{pap_head 0}THERE YA GO.&GUESSING IT'S A&BIT FOR YOU,&NOW.{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 5}We had them right&there! What are you&doing?!{pause}{clear}{alp_head 4}You really trust this&guy?!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 13}Uhh...{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}COME OOOON,&DON'TJA WANT A&FAIR FIGHT?{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 12}What do I care about&being ''Fair''?!{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 11}OH, I SEE.&YOU'RE CHICKEN.{pause}{clear}{pap_head 4}YOU DON'T WANT&TO FACE THE&HUMAN ON EQUAL&FOOTING.{pause}{clear}{pap_head 12}I GUESS YOU&WON'T BE ABLE TO&SHOW OFF YOUR{pause}{clear}AMAZING POWER ON&THE HUMAN.{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 5}WHAT?!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 21}WHAT?!{pause}{clear}{head 12}I can beat them all&on my own!{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 1}I don't need you guys&to help me, I can beat&them with my eyes&closed!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 17}Fine! Have that your&way then!{pause}{clear}{head 18}I'll teach this human&a lesson, fair and&square!{pause}{clear}"
	+"{speaker 2}{font 2}{voice 2}{alp_head 0}Yeah, hey speaking&of...{sleep 25} I want this&human all to myself!{pause}{clear}{alp_head 4}You guys get out of&here, that's an order!{pause}{clear}"
	+"{speaker 0}{font 3}{voice 3}{head 25}Fine.{pause}{clear}"
	+"{speaker 1}{font 4}{voice 4}{pap_head 1}LESS WORK FOR&ME.";
}