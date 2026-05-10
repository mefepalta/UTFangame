if (!gop) and (place_meeting(x,y,char_player)) and (room == room_area_0)
{
	char_player.moveable=false;
	char_player._moveable_menu=false;
	camera.target=spor;
	
	gop=true;
	obj_snas.image_alpha=1;
	Anim_Create(spor,"x",ANIM_TWEEN.EXPO,ANIM_EASE.IN_OUT,spor.x,100,220,50);
}
if (!gop) and (place_meeting(x,y,char_player)) and (room == room_area_1)
{
	char_player.moveable=false;
	gop=true;
	obj_snas.image_alpha=1;
	Anim_Create(spor,"x",ANIM_TWEEN.EXPO,ANIM_EASE.IN_OUT,spor.x,100,220,50);
}
if (gop == false)
{
	spor.x=char_player.x+3;
}
if (gop == true)
{
	gop1++;
}
if (room == room_area_0)
{
	switch (global.death_count)
	{
	default:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* ...{pause}{clear}* I don't understand.{pause}{clear}* This place... you...{pause}{clear}* I feel like we've been here&  for as long as time.{pause}{clear}* is this my fate? To face&  you until the end of time?{pause}{clear}* Well then, I accept my fate.{pause}{clear}* If this means our people are&  safe, then I'll stand here&  until the end of my days.{pause}{clear}* I am Sans!&  The Endless Knight!{pause}{clear}* This is the end!");
	    Dialog_Start();
	}
	break;
	case 9:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* Papyrus used to tell me this&  story.{pause}{clear}* The one about a golden leaf.{pause}{clear}* Basically, it fell from a&  tree made of gold and flowed&  down a river.{pause}{clear}* By the time it reached&  someone, its color faded,&  and it was gray.{pause}{clear}* The further it let the&  current take it, the more&  color it lost.{pause}{clear}* Until it was deemed totally&  worthless by the people who&  found it.{pause}{clear}* We all had our own&  interpretations of it...{pause}{clear}* But seeing you just...&  brought it back to mind,&  I guess.");
	    Dialog_Start();
	}
	break;
	case 8:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* Well, that stance looks&  familiar.{pause}{clear}* It's the same one you used&  against... well... everyone.{pause}{clear}* The only difference is that&  you seem less into it than&  normal.{pause}{clear}* You look tired.{pause}{clear}* You sure you want all this?");
	    Dialog_Start();
	}
	break;
	case 7:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* You're different.{pause}{clear}* I'm used to seeing a certain&  spark in your eyes.{pause}{clear}* But now... It's grayed out.{pause}{clear}* I barely recognized you.{pause}{clear}* ...What happened, exactly?{pause}{clear}* Well, it's a good thing I&  haven't lost MY spark.");
	    Dialog_Start();
	}
	break;
	case 6:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* The snow's nice.{pause}{clear}* Why don't you spend some&  time relaxing by the window?&  I do that sometimes.{pause}{clear}* We could have shared such a&  charming time here, too.{pause}{clear}* ...Sorry for getting&  sentimental on you.{pause}{clear}* It's just that... it feels&  like I've been standing here&  for an eternity.{pause}{clear}* And eternity... really gets&  you thinking about some&  things.");
	    Dialog_Start();
	}
	break;
	case 5:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* For whatever reason, when I&  first saw you...{pause}{clear}* I could've sworn we've been&  talking for ages.{pause}{clear}* Were we friends, in another&  life, somewhere?");
	    Dialog_Start();
	}
	break;
	case 4:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* Tch... what're YOU so&  worked up about with that&  disappointed look?{pause}{clear}* What, after my captain,&  fighting ME just isn't good&  enough for you, is that it?!{pause}{clear}* Well, lucky for you, then,&  I already forgot what I was&  going to say.{pause}{clear}* So we can skip the&  introductions.");
	    Dialog_Start();
	}
	break;
	case 3:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* Heh...{pause}{clear}* You startled me.{pause}{clear}* For a second there, I&  could've sworn you were about to hit me.{pause}{clear}* But the hitting comes DURING&  the duel.{pause}{clear}* And I had my guard down.{pause}{clear}* Humans still have honor,&  right?");
	    Dialog_Start();
	}
	break;
	case 2:
	if (gop1 == 350){
		Dialog_Add("{font 3}{voice 3}* Okay... that's weird.{pause}{clear}* I felt a bit of panic when I&  saw you.{pause}{clear}* Like I just missed an&  opportunity to attack, and&  you were about to...{pause}{clear}* ...{pause}{clear}* Well, our fight hasn't even&  started yet, so it doesn't&  matter.{pause}{clear}* And something tells me&  you've BEEN ready.{pause}{clear}* Well... your move.");
		Dialog_Start()
	}
	break;
	case 1:
	if (gop1 == 350){
		_dialog_part1 = 1;
		Dialog_Add("{font 3}{voice 3}* Okay... so what was that?{pause}{clear}* It couldn't have been a&  dream... could it?{pause}{clear}* I swear I was just...");
		Dialog_Start()
	}
	if (_dialog_part1 == 1 && !instance_exists(ui_dialog)){
	    _dialog_part1 = 2;
	    alarm[2] = 120;
	}
	if (_dialog_part1 == 3){
	    _dialog_part1 = 4;
		obj_snas.image_index = 0;
	    Dialog_Add("{font 3}{voice 3}* ...!{pause}{clear}* You're here already?!{pause}{clear}* How?!{pause}{clear}* But I... I.. uhh...{pause}{clear}* I mean... ugh...{pause}{clear}* Hey. {pause}{clear}* Have we met before?{pause}{clear}* I can't get this image out&  of my head...{pause}{clear}* It's like we were just&  here...{pause}{clear}* Hmph... well...{pause}{clear}* Whatever you're playing&  at...{pause}{clear}* It won't work!{pause}{clear}* Yeah, your mind games won't&  work on me!");
	    Dialog_Start();
	}
	if (_dialog_part1 == 4 && !instance_exists(ui_dialog)){
    _dialog_done1 = true;
	}
	break;
	case 0:
	if (gop1 == 350){
	    _dialog_part = 1;
	    Dialog_Add("{font 3}{voice 3}* Mind if I ask a personal&  question?{pause}{clear}* About your home.{pause}{clear}* Does it snow where you're&  from? On the surface?{pause}{clear}* Papyrus used to take me&  here when I was little.{pause}{clear}* Most of the time, we'd just&  sit there, completely silent.{pause}{clear}* But sometimes...{pause}{clear}* He'd prattle on about all&  the names of stars he could&  remember.{pause}{clear}* I think he called them...&  constellations, or something&  like that.{pause}{clear}* Just the two of us, alone...{pause}{clear}* My only brother.{pause}{clear}* ...{pause}{clear}* You know, if magic wasn't a&  real thing...{pause}{clear}* ...I'd swear it was back&  then.{pause}{end}");
	    Dialog_Start();
	}
	if (_dialog_part == 1 && !instance_exists(ui_dialog)){
	    _dialog_part = 2;
	    alarm[1] = 120;
	}
	if (_dialog_part == 3){
	    _dialog_part = 4;
		obj_snas.image_index = 0;
	    Dialog_Add("{font 3}{voice 3}* ...{pause}{clear}* Tch...{pause}{end}");
	    Dialog_Start();
	}
	if (_dialog_part == 4 && !instance_exists(ui_dialog)){
    _dialog_done = true;
	}
	break;
	}
}
if (room == room_area_1)
{
	if (gop1 == 100)
	{
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* I...{pause 5} can hardly stand.{pause}{clear}* Human...{pause 5} you are the&weirdest person I've ever met.{pause}{clear}* You have no idea how much I&want to return the favor you&gave us...{pause}{clear}* Though no matter how hard I&try, my magic is...{pause 5} limited.{pause}{clear}* ...{pause}{clear}* You refused to strike me&down...{pause 5} you didn't think twice&about sparing my life.{pause}{clear}* So what now?{pause}{clear}* Are you going to meet the&Queen?{pause 5} Then what will you do?{pause}{clear}* ...{pause}{clear}* Whatever...{pause}{clear}* Not that I owe you anything.{pause}{clear}* You left us in a state far&worse than before. {pause}{clear}* At least then we had some&kind of people to fill the&kingdom.{pause}{clear}* ...{pause 5}What are you waiting for?&A hug? Get out of here.");
	}
}

if (!instance_exists(text_typer)) and (gop1 > 355) and (room == room_area_0) and (_dialog_done and global.death_count == 0)
{
    go_battle++;
    o_fog.diddyvalue = true;
    o_heartow.hvalue = true;
}
if (!instance_exists(text_typer)) and (gop1 > 355) and (room == room_area_0) and (_dialog_done1 and global.death_count == 1)
{
    go_battle++;
    o_fog.diddyvalue = true;
    o_heartow.hvalue = true;
}
if (!instance_exists(text_typer)) and (gop1 > 250) and (room == room_area_1)
{
	go_battle++;
}

if (!instance_exists(text_typer)) and (go_battle > 90) and (room == room_area_1)
{
	with (obj_snas)
	{
		instance_destroy();
	}
	if (!instance_exists(o_temp_sprite_1))
	{
		instance_create_layer(760, 165, "Instances", o_temp_sprite_1);
	}
}
if (!instance_exists(text_typer)) and (go_battle > 360) and (room == room_area_1)
{
	char_player.moveable = true;
	with (o_temp_sprite)
	{
		image_alpha = 0;
		instance_destroy();
	}
	with (o_temp_sprite_1)
	{
		instance_destroy();
	}
	char_player.image_alpha = 1;
}
/*if go_battle = 1{
	Encounter_Start(0);
}
if go_battle = 93{
	room_goto(room_p05);
}

