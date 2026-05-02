///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,65,65);
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);

if (global.finalstretch == 0)
{
	sansy.text="{font 3}{voice 3}{head 3}...{pause}{clear}...What..?{pause}{clear}{head 2}What do you think&you're doing?{pause}{clear}{head 10}Mercy...&you're showing me&mercy.{pause}{clear}{head 11}No, I know what this&is.{pause}{clear}{head 25}You think that I'm&WEAK.{pause}{clear}{head 24}And you're showing ME&PITY?!{pause}{clear}{head 13}Well, I'll show you&what happens to those&who underestimate ME,&HUMAN!";
}
if (global.finalstretch == 1) and (global.sanstalk < 0)
{
	audio_stop_sound(snd_chance);
	sansy.text="{font 3}{voice 3}...{pause}{clear}Heh.{pause}{clear}Wow...{pause}{clear}I mean, really, bravo.{pause}{clear}It takes guts to turn&over a new leaf.{pause}{clear}But why the change of&heart?{pause}{clear}Did you resonate with&something I said?{pause}{clear}Must be if you're&showing pity to a&poor, defenseless&monster such as&myself.{pause}{clear}But there's still&something I can't seem&to wrap my head&around...{pause}{clear}Now, how could&someone as formidable&as you...{pause}{clear}...fall for such a&simple distraction?";
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