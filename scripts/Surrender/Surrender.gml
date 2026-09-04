
#macro SURRENDER_TUR_SAYISI 12
#macro SURRENDER_ATAK_OFS    8

function Surrender_Aktif()
{
	if (!variable_global_exists("surrender_turn")) { return false; }
	return (global.surrender_turn == true);
}

function Surrender_SonTur()
{
	if (!Surrender_Aktif()) { return false; }
	return (global.sanstalk >= SURRENDER_TUR_SAYISI);
}

function Surrender_BasindaKonusur()
{
	return (Surrender_Aktif() and !Surrender_SonTur());
}

function Surrender_Atak()
{
	if (!variable_global_exists("sanstalk")) { return noone; }
	if (global.sanstalk < 1) or (global.sanstalk > SURRENDER_TUR_SAYISI) { return noone; }
	var _t = asset_get_index("battle_turn_"+string(global.sanstalk+SURRENDER_ATAK_OFS));
	if (!object_exists(_t)) { return noone; }
	return _t;
}

function Surrender_ActSayisi()
{
	if (!variable_global_exists("sanstalk")) { return 1; }
	if (room != room_battle) { return 1; }
	if (global.p25phase != 0) { return 1; }
	if (global.finalstretch != 0) { return 1; }
	if (global.sanstalk < 0) { return 1; }
	if (global.sanstalk >= SURRENDER_TUR_SAYISI) { return 1; }
	return 2;
}

function Surrender_Text()
{
	switch (global.sanstalk)
	{
		case 1:
		return "{font 3}{voice 3}{head 12}...{pause}{clear}"
		+"{head 11}After ALL this...{pause}{clear}"
		+"{head 6}After everything YOU&put me through...{pause}{clear}"
		+"{head 26}You have the AUDACITY&to mock us?{pause}{clear}"
		+"{head 7}I won't have it. {pause}{clear}"
		+"{head 0}You're finishing this&fight, one way or&another.";

		case 2:
		return "{font 3}{voice 3}{head 9}Oh, come on...{pause}{clear}"
		+"{head 10}I swear, you're ALL&the SAME these days.{pause}{clear}"
		+"{head 3}You went out of your&way to pull all these&ELABORATE stunts to&become powerful...{pause}{clear}"
		+"{head 1}Oh, but the MOMENT&you're on the cusp of&actually WINNING...{pause}{clear}"
		+"{head 4}You stop?{pause}{clear}"
		+"{head 26}I don't even get a&grand finale like my&captain did?!";

		case 3:
		return "{font 3}{voice 3}{head 2}So basically, instead&of TESTING yourself&and TRYING to become&stronger...{pause}{clear}"
		+"{head 4}You pull back?{pause}{clear}"
		+"{head 13}That right there tells&me you weren't even a&real warrior to begin&with.";

		case 4:
		return "{font 3}{voice 3}{head 26}REAL fighters ALWAYS&aim for the top, and&higher!{pause}{clear}"
		+"{head 0}There'll always be&someone stronger.{pause}{clear}"
		+"{head 6}But if you don't move,&you'll just become&weaker!{pause}{clear}"
		+"{head 13}Until some day...&maybe today... the&weakest will beat you.";

		case 5:
		return "{font 3}{voice 3}{head 6}Did Alphys beg?{pause}{clear}"
		+"{head 11}Did Papyrus...{pause}{clear}"
		+"{head 12}Or ANY of the guards&you faced...{pause}{clear}"
		+"{head 26}EVER cry for mercy?{pause}{clear}"
		+"{head 7}Never.{pause}{clear}"
		+"{head 0}They cried for JOY.{pause}{clear}"
		+"{head 8}Knowing they served&their kingdom well.{pause}{clear}"
		+"{head 9}And that they could&rest easy, entrusting&its future to the next&generation.";

		case 6:
		return "{font 3}{voice 3}{head 2}Can you even imagine&that kind of passion?{pause}{clear}"
		+"{head 0}The kind of strength...&REAL strength... it&takes to care that&much?{pause}{clear}"
		+"{head 11}About something, or&someone?{pause}{clear}"
		+"{head 12}Sure, you might be&able to destroy us a&million times over...{pause}{clear}"
		+"{head 26}But not this!{pause}{clear}"
		+"{head 18}Everything we built,&everything we stand&for, will shine&forever!";

		case 7:
		return "{font 3}{voice 3}{head 8}So tell me. Genuinely,&honestly, think about&it.{pause}{clear}"
		+"{head 2}Does ALL of this...&TRULY give you that&same feeling?{pause}{clear}"
		+"{head 1}That strength? Did you&find the same passion&we have?";

		case 8:
		return "{font 3}{voice 3}{head 12}Your eyes used to be&filled with this&indescribable rage.{pause}{clear}"
		+"{head 9}But you can't even&bring yourself to be&upset anymore, can&you?";

		case 9:
		return "{font 3}{voice 3}{head 10}You look tired.{pause}{clear}"
		+"{head 11}Like all you want to&do is fall asleep and&never wake up, right?{pause}{clear}"
		+"{head 20}Yeah... I know the&feeling.";

		case 10:
		return "{font 3}{voice 3}{head 8}You've just been&getting more pale since&you got here.{pause}{clear}"
		+"{head 14}Your eyes are empty...&shouldn't they reflect&some kind of color?{pause}{clear}"
		+"{head 10}And those movements...&It's like you're an&amateur.{pause}{clear}"
		+"{head 11}I have a hard time&picturing Alphys&actually losing to&something like you.{pause}{clear}"
		+"{head 3}So uncoordinated.";

		case 11:
		return "{font 3}{voice 3}{head 9}Well, I suppose this&goes without saying,&but... you lost it.{pause}{clear}"
		+"{head 12}Whatever was&motivating you before,&pushing you to move&forward... left.{pause}{clear}"
		+"{head 29}Come on... can't you&show me at least a BIT&of the REAL you?";

		case 12:
		return "{font 3}{voice 3}{head 12}...{pause}{clear}"
		+"{head 9}So... that's it?{pause}{clear}"
		+"{head 4}You're really not&gonna fight?{pause}{clear}"
		+"{head 6}Just gonna stand&there?{pause}{clear}"
		+"{head 26}Come on, look at me!{pause}{clear}"
		+"{head 7}Look me in the eye!{pause}{clear}"
		+"{head 13}Right. You can't even&bring yourself to do&that, can you?{pause}{clear}"
		+"{head 28}Heh.{pause}{clear}"
		+"{head 25}You know, it's kinda&funny.{pause}{clear}"
		+"{head 3}I've always been known&for outsmarting my&enemies rather than&overpowering them.{pause}{clear}"
		+"{head 25}Never thought it'd&work on something like&you, though.";
	}

	return "{font 3}{voice 3}{head 25}...";
}
