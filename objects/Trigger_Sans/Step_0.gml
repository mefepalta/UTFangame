if (!gop) and (place_meeting(x,y,char_player)) and (room == room_area_0)
{
	char_player.moveable=false;
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
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* ...{pause}{clear}* I don't understand.{pause}{clear}* This place... you...{pause}{clear}* I feel like we've been here&for as long as time.{pause}{clear}* is this my fate? To face&you until the end of time?{pause}{clear}* Well then, I accept my fate.{pause}{clear}* If this means our people are&safe, then I'll stand here until&the end of my days.{pause}{clear}* I am Sans! The Endless Knight!{pause}{clear}* This is the end!");
	}
	break;
	case 11:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* Hey, calm down. You look&redder then any tomato I've&ever seen.");
	}
	break;
	case 10:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* You're back... I mean, here.{pause}{clear}* Sorry, I've just been got a&huge sense of deja vu.{pause}{clear}* ...{pause}{clear}* Whatever.");
	}
	break;
	case 9:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* You know... a small white&dog stole my special attack&right before you showed up.{pause}{clear}* Well that's fine, I'll just&settle for a regular legion of&magic attacks instead.");
	}
	break;
	case 8:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* Alphys told me humans were&threatening foreboding&creatures.{pause}{clear}* That tomato red face of&yours makes that hard to take&seriously.");
	}
	break;
	case 7:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* The snow is nice outside.{pause}{clear}* Such a calming view, you&could sit back, and watch the&cold snow fall from above.{pause}{clear}* We could have shared such a&charming time here, too.{pause}{clear}* Well... I guess that's&behind us now.");
	}
	break;
	case 6:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* That face makes me think&you just had everything taken&from you.{pause}{clear}* What's the matter? I&thought you were supposed to&be the brute strong type.");
	}
	break;
	case 5:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* ...{pause}{clear}* Should I ask why you look&so red?");
	}
	break;
	case 4:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* I don't know why, I feel&like we've been fighting for&ages.{pause}{clear}* Though.... we basically just&met.{pause}{clear}* Hm...{pause}{clear}* Well, that's besides the&point.");
	}
	break;
	case 3:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* Greetings...{pause}{clear}* ...{pause}{clear}* That face... you need to&cool off a bit.{pause}{clear}* Well, too bad...{pause}{clear}* You won't have much time to.");
	}
	break;
	case 2:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* ...{pause}{clear}* That face...{pause}{clear}* Have we met before or&something?");
	}
	break;
	case 1:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* Greetings, human.{pause}{clear}* did you think I wouldn't&notice you sneaking by just&now?{pause}{clear}* Not at all. I know exactly&how you humans work inside,&and out.{pause}{clear}* ...{pause}{clear}* ...{pause}{clear}* That look on your face...{pause}{clear}* You've heard all of this&before.{pause}{clear}* Hm.{pause}{clear}* Well, either way...{pause}{clear}* FIGHTING YOU SEEMS LIKE MY&ONLY OPTION!");
	}
	break;
	case 0:
	if (gop1 == 350){
		Dialog_Start()
		Dialog_Add("{font 3}{voice 3}* Greetings, human.{pause}{clear}* Did you think I wouldn't&notice you sneaking by just&now?{pause}{clear}* Not at all. I know exactly&how you humans work inside,&and out.{pause}{clear}* ...{pause}{clear}* The snow is nice outside.{pause}{clear}* Such a calming view, you&could sit back, and watch the&cold snow fall from above.{pause}{clear}* We could have shared such a&charming time here, too.{pause}{clear}* ...{pause}{clear}* I am no stranger to death,&human.{pause}{clear}* Living in this world for so&long, you are bound to hear&about it.{pause}{clear}* One way or another.{pause}{clear}* How a monster would die...{pause}{clear}* Or rather, how a monster&would be turned to dust just&like that.{pause}{clear}* Though, this never crossed&my mind that it would happen&to Papyrus, of all people.{pause}{clear}* Or even Alphys, for that&matter.{pause}{clear}* Yet here we stand. Facing&one another.{pause}{clear}* And here I am.{pause}{clear}* Standing right in front of&the beast who started this&whole mess.{pause}{clear}* So the coldest thing here,&isn't the snow, only your&heart.{pause}{clear}* ...");
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

if (!instance_exists(text_typer)) and (gop1 > 355) and (room == room_area_0)
{
	go_battle++;
	o_fog.diddyvalue = true;
	o_heartow.diddyvalue = true;
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

