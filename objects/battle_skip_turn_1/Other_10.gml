Battle_SetBoardSizeCubic(65,65,65,65);
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);

// SANS'I GERI GETIR (battle_skip_turn_0/Other_10 ile ayni gerekce).
// Bir onceki tur iska ile bittiyse Sans hala gizli olabilir. Mizrak
// sahnesi icin ayrica sart: SapSansAlpha ilk cagriida "orijinal" alpha'lari
// kaydediyor -- burada 1'e cekilmezse 0 kaydedip Sans'i hic geri getiremezdi.
// finalstretch sarti battle_skip_turn_0 ile ayni gerekce: faz 1'in son
// atagindan sonra Sans yorgun pozda (*_alpha1) duruyor, kosulsuz geri
// yukleme eski kol/bacaklari da acip iki sprite bindiriyordu. Mizrak
// sahnesi de zaten finalstretch == 0 istiyor.
if (global.p25phase == 0) and (global.finalstretch == 0)
{
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
}

// FAZ 2: Mercy burada faz 1'in mizrak sahnesini de repliklerini de
// oynatmamali. Item/act turunun (battle_skip_turn_0) yaptiginin aynisi:
// kutu normal olcusune donuyor, balon hic acilmiyor, tur sessizce bitiyor.
if (room == room_battle_1)
{
	Battle_SetBoardSizeCubic(65,65,120,120);
	with (battle_dialog_enemy) { instance_destroy(); }
	exit;
}

if (global.p25phase == 0) and (global.sanstalk <= 22)
{
	sap_bg_on = true;
}

if (global.p25phase >= 1)
{
	sansy.text = "{speaker 0}{font 3}{voice 3}{head 22}...";
}

if (global.finalstretch == 0) and (global.p25phase == 0)
{
	sansy.text="{font 3}{voice 3}{head 3}...{pause}{clear}...What..?{pause}{clear}{head 2}What do you think&you're doing?{pause}{clear}{head 10}Mercy...&you're showing me&mercy.{pause}{clear}{head 11}No, I know what this&is.{pause}{clear}{head 25}You think that I'm&WEAK.{pause}{clear}{head 24}And you're showing ME&PITY?!{pause}{clear}{head 13}Well, I'll show you&what happens to those&who underestimate ME,&HUMAN!";
}
if (global.finalstretch == 1) and (global.sanstalk < 0)
{
	audio_stop_sound(snd_chance);
	sansy.text="{font 3}{voice 3}{head 22}...{pause}{clear}{head 28}Heh.{pause}{clear}{head 27}Wow...{pause}{clear}{head 22}I mean, really, bravo.{pause}{clear}{head 21}It takes guts to turn&over a new leaf.{pause}{clear}{head 19}But why the change of&heart?{pause}{clear}{head 20}Did you resonate with&something I said?{pause}{clear}{head 23}Must be if you're&showing pity to a&poor, defenseless&monster such as&myself.{pause}{clear}{head 12}But there's still&something I can't seem&to wrap my head&around...{pause}{clear}{head 13}Now, how could&someone as formidable&as you...{pause}{clear}{head 24}...fall for such a&simple distraction?";
}
if (global.finalstretch == 0) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 19}...?";
}
if (global.finalstretch == 1) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 19}...What?{pause}{clear}Human, what are&you...";
}
if (global.finalstretch == 2) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 20}Stop...&Stop rubbing this in!";
}
if (global.finalstretch == 3) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 22}I understand, you want&to rub in the fact&that you defeated me.{pause}{clear}{head 23}Well ha ha, human.&Now get this over&with.";
}
if (global.finalstretch == 4) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 21}I don't understand.{pause}{clear}I can't...&Why would you...{pause}{clear}{head 20}Why would you not&want to fight back?";
}
if (global.finalstretch == 5) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 20}This isn't like you&humans, you never&change.{pause}{clear}You humans only think&for yourselves.";
}
if (global.finalstretch == 6) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 19}If you didn't, the&barrier would be open&by now.{pause}{clear}{head 20}You're disgusting.{pause}{clear}Even after all this,&you still won't fight&me?";
}
if (global.finalstretch == 7) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 19}...{pause}{clear}This is so unfair.{pause}{clear}{head 20}I'm supposed to be&Sans The Great!{pause}{clear}Invincible...&Unbeatable to all who&dare to cross me!{pause}{clear}You weren't supposed&to act like this!{pause}{clear}{head 21}How... how does one&do the things you did,&and just...{pause}{clear}Abandon them as if&they never happened?{pause}{clear}{head 22}...{pause}{clear}{head 19}This... really is what&you want, huh?{pause}{clear}You wouldn't have done&all this if not.{pause}{clear}{head 22}So human, for the sake&of the world...{pause}{clear}{head 19}You must choose.{pause}{clear}Our lives, or yours.&Only one of us is&getting out of here&standing.";
}
if (global.finalstretch == 8) and (global.sanstalk == 23)
{
	sansy.text="{font 3}{voice 3}{head 22}...";
}