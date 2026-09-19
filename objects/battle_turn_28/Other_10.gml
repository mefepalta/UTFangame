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

with (battle_enemy_engage)
{
	p2_head_sprite  = spr_p2_head;
	pap_head_sprite = spr_papyrus_head;
	pap_state = 2;
	alp_state = 2;
	p2_state  = 2;   // atak 10 SansAlphysGizle ile 0 yapiyor; her baslangicta geri al
}

if (atak == 1) { Difficulty_PapyrusMuzikBasla(); }

switch (atak)
{
	case 1:
		sansy.text="{easy_raw}{speaker 2}{font 2}{voice 2}{alp_head 1}If only we had&DOPE ASS themes...{pause}{clear}{speaker 2}{font 2}{voice 2}{alp_head 0}And if only we had&DOPE ASS attacks&maybe the game&would be good.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 0}WAIT.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 11}THAT'S WHAT&ALL THIS&IS FOR?{pause}{clear}{speaker 0}{font 3}{voice 3}{head 4}...{pause}{clear}{speaker 2}{font 2}{voice 2}{alp_head 0}Yeah.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 1}IF THAT'S THE&CASE THEN...{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}LET ME SHOW&YOU THOSE&DOPE ASS&ATTACKS.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 5}AND THEMES.";
	break;

	case 2:
		sansy.text="{easy_raw}{speaker 2}{font 2}{voice 2}{alp_head 1}Papyrus maybe calm&down a little ...?{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}I'M GONNA&STOMP IT'S&HEAD{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}UNTIL IT&STOPS MOVING{pause}{clear}{speaker 2}{font 2}{voice 2}{alp_head 5}Papyrus I really&think--{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}SHUT THE&FUCK UP&ALPHYS!!!{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 13}I RUN THIS&SHOW NOW!{pause}{clear}{speaker 0}{font 3}{voice 3}{head 4}...";
	break;

	case 4:
		sansy.text="{easy_raw}{speaker 1}{font 4}{voice 4}{pap_head 13}HEY&ASSHOLE.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}REACT TO&THIS!";
	break;

	case 7:
		sansy.text="{easy_raw}{speaker 1}{font 4}{voice 4}{pap_head 11}IT DIDN'T&HAVE TO BE&LIKE THIS.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 0}YOU COULD'VE&PLAYED IT&LIKE NORMAL.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 0}IT WAS ALL&HANDED TO&YOU ON A&SILVER&PLATTER.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 4}BUT YOU&REJECTED ALL&WITH THE&PALM OF&YOUR HAND.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}I GUESS NOW&I HAVE NO&CHOICE BUT&TO{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 13}MUTILATE&YOUR BODY&AND FEED IT&TO STRAY&ANIMALS.{pause}{clear}{speaker 0}{font 3}{voice 3}{head 4}...";
	break;

	case 10:
		sansy.text="{easy_raw}{speaker 1}{font 4}{voice 4}{pap_head 0}WELL, YOU'VE&GONE FURTHER&THAN I&ANTICIPATED.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 11}YOU'VE EVEN&SAT THROUGH&MY MUSIC&SESH WITHOUT&BACKING OFF.{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 5}I'M&IMPRESSED!{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 1}BUT HOW ARE&YOU GONNA&SURVIVE&NOW...{pause}{clear}{speaker 1}{font 4}{voice 4}{pap_head 16}IF I JUST&STOPPED...&BEING EASY?";
	break;

	default:
		sansy.text="{speaker 1}{font 4}{voice 4}{pap_head 16}AGAIN.";
	break;
}

if (Surrender_BasindaKonusur())
{
	sansy.text = Surrender_Text();
}
