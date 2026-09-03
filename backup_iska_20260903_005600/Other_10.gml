///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,120,120);
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);

// Asagidaki global.sanstalk diyaloglari phase 1'e ait. Phase 2'de bunlar
// calisirsa yanlis replik (ya da default'taki yer tutucu) cikiyor; balon da
// kapanmadigi icin turn preparation bitmiyor. Phase 2'de balonu hemen kapat.
if (room == room_battle_1)
{
	with (battle_dialog_enemy)
	{
		instance_destroy();
	}
	exit;
}

// 1-12 arasi replikler scripts/Surrender'da tutuluyor: gercek atak
// oynarken de ayni metin kullanildigi icin tek kaynaktan okunuyor.
// Bu turlar normalde battle_turn_9..20'ye gidiyor; burasi yedek yol.
switch (global.sanstalk)
{
	case 23:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}...";
	break;
	case 22:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 12}You've destroyed our&homes, our people...&no more.{pause}{clear}{head 9}Because now you're&going to get what's&coming to you. {pause}{clear}I hope you're ready&for this.{pause}{clear}{head 18}Witness the power of&a thousand suns!";
	break;
	case 21:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 9}Well let me tell you,&you have.{pause}{clear}{head 18}You've proven to be&weak.";
	break;
	case 20:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 25}You think because you&don't fight back&you're better than I?{pause}{clear}Are you trying to&prove something?";
	break;
	case 19:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 24}I said, fight back!";
	break;
	case 18:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 14}Fight back.";
	break;
	case 17:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 10}No human has pushed&me this far.{pause}{clear}{head 26}Well, you are the&first I've...{pause}{clear}{head 25}...";
	break;
	case 16:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 24}Alright, you really&want this, huh?{pause}{clear}{head 25}You really want to see&what I'm capable of?{pause}{clear}{head 3}You really want to see&my special attack?{pause}{clear}{head 11}Because if you don't&stop this meaningless&drivel that you keep&going on about...{pause}{clear}{head 24}I will make sure you&never see the sun&again.";
	break;
	case 15:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 11}Well, that doesn't&matter.{pause}{clear}{head 13}If not for me holding&back, you'd be toast.";
	break;
	case 14:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 11}Papyrus, Alphys, my&guards...{pause}{clear}{head 12}Why?&Why are you choosing&now to go back on this&now?";
	break;
	case 13:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 25}Blah, blah blah.{pause}{clear}is that all you like&to do? Talk?{pause}{clear}What's so hard about&fighting back?{pause}{clear}{head 2}You've done a lot of&that already.";
	break;
	case 12:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 11:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 10:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 9:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 8:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 7:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 6:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 5:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 4:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 3:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 2:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break;
	case 1:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = Surrender_Text();
	break
	case 0:
	instance_destroy(battle_dialog_enemy);
	break
	default:
	instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text="{font 3}{voice 3}{head 25}do not.";
	break;
}