dialogue_index = 0;
_inst_text = noone;
_portrait_sprite = noone;
_portrait_expression = 0;
_current_music = noone;
visible = false;
alarm[0] = room_speed * 2;

char_voice[0] = 3;
char_voice[1] = 5;
char_voice[2] = 6;
char_voice[3] = -1;

char_font[0] = 3;
char_font[1] = 0;
char_font[2] = 0;
char_font[3] = 0;

char_portrait[0] = s_phonecallsans;
char_portrait[1] = s_phonecallundyne;
char_portrait[2] = s_phonecallmuffet;
char_portrait[3] = noone;

dialogue = [
    { speaker: Speaker.Neutral, text: "* (Ring, ring...)", expression: -1},
    { speaker: Speaker.Char1, text: "* Am I doing this right?", expression: 3 },
	{ speaker: Speaker.Char1, text: "* How do I turn this&  thing on?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* Hello?", expression: 4 },
	{ speaker: Speaker.Char1, text: "* Is this thing even&  working?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* Hey, don't touch me!", expression: 13 },
	{ speaker: Speaker.Char1, text: "* Huh? I'm on?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* ...", expression: 9 },
	{ speaker: Speaker.Char1, text: "* Uhh... hey.", expression: 3 , music: snd_phoneringing },
	{ speaker: Speaker.Char1, text: "* This is Sans.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* I really didn't think&  I'd get signal through&  the barrier.", expression: 6 },
	{ speaker: Speaker.Char1, text: "* ...", expression: 12 },
	{ speaker: Speaker.Char1, text: "* You just had to see it&  end, didn't you?", expression: 12 },
	{ speaker: Speaker.Char1, text: "* Was getting to the&  surface THAT important&  to you?", expression: 14 },
	{ speaker: Speaker.Char1, text: "* Not to us.", expression: 14 },
	{ speaker: Speaker.Char1, text: "* The Queen is gone, the&  guard has grumbled...", expression: 12 },
	{ speaker: Speaker.Char1, text: "* Why would we ever&  want to live in a world&  full of people like&  YOU?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* SCREW the surface!", expression: 13 },
	{ speaker: Speaker.Char1, text: "* We only have a handful&  of survivors, anyway.", expression: 11 },
	{ speaker: Speaker.Char1, text: "* So any war we'd get&  into would be&  tragically one-sided.", expression: 10 },
	{ speaker: Speaker.Char1, text: "* And because I'm&  technically the&  strongest around&  here...", expression: 8 },
	{ speaker: Speaker.Char1, text: "* ...they made me their&  ruler.", expression: 9 },
	{ speaker: Speaker.Char1, text: "* Say hello to the new&  king of the&  underground.", expression: 4 },
	{ speaker: Speaker.Char1, text: "* Heh...", expression: 9 },
	{ speaker: Speaker.Char1, text: "* It's all I've ever&  wanted, right?", expression: 8 },
	{ speaker: Speaker.Char1, text: "* What a glorious&  position you left me&  in...", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Tch.", expression: 13 },
	{ speaker: Speaker.Char1, text: "* The responsibility&  nearly crushed me.", expression: 11},
	{ speaker: Speaker.Char1, text: "* So...", expression: 7 },
	{ speaker: Speaker.Char1, text: "* I... elected...&  a certain someone...&  to be...", expression: 11 },
	{ speaker: Speaker.Char1, text: "* My Co-Leader.", expression: 2 },
	{ speaker: Speaker.Char1, text: "* Man... I need to lie&  down...", expression: 11 },
	{ speaker: Speaker.Char1, text: "* ...", expression: 10 },
	{ speaker: Speaker.Char1, text: "* AHH! WHEN'D YOU GET&  HERE?!", expression: 14 },
	{ speaker: Speaker.Char3, text: "* Surprised to see me?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* LITTLE BIT, seeing as&  the DOOR was locked!", expression: 14 },
	{ speaker: Speaker.Char3, text: "* Can't the new captain of&  the guard come visit her&  GLORIOUS KING?", expression: 5 },
	{ speaker: Speaker.Char3, text: "* Oh yeah.", expression: 0 },
	{ speaker: Speaker.Char3, text: "* He made me his Queen!", expression: 4 },
	{ speaker: Speaker.Char1, text: "* That is NOT what&  happened.", expression: 3 },
	{ speaker: Speaker.Char3, text: "* I even get to sit on the&  throne. Sans had a second&  one built.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* We don't need to go&  into the logistics right&  now.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Also, Co-Leader! We&  call it Co-Leader now!", expression: 2 },
	{ speaker: Speaker.Char3, text: "* Oh, honey, stop, please,&  you're not getting out of&  this.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Getting outta what?!", expression: 3 },
	{ speaker: Speaker.Char2, text: "* W-Who are you talking to&  in here?", expression: 8 },
	{ speaker: Speaker.Char3, text: "* Oh, you know... the human.", expression: 1 },
	{ speaker: Speaker.Char2, text: "* T-T-The what?!", expression: 7 },
	{ speaker: Speaker.Char2, text: "* Sans, how did you even&  get this number?!", expression: 2 },
	{ speaker: Speaker.Char3, text: "* Yeah, how DID you get it?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* Calm down. They can't&  hurt us anymore,&  remember?", expression: 5 },
	{ speaker: Speaker.Char2, text: "* What do you want, human?", expression: 4 },
	{ speaker: Speaker.Char2, text: "* Can't you just leave us&  alone?", expression: 4 },
	{ speaker: Speaker.Char2, text: "* What, did you expect us&  to throw you a party if&  you came back?", expression: 1 },
	{ speaker: Speaker.Char2, text: "* W-Well, do I have some&  news for you, kid...", expression: 5 },
	{ speaker: Speaker.Char2, text: "* We made a barrier over&  the underground's&  entrance.", expression: 6 },
	{ speaker: Speaker.Char2, text: "* S-So no one can fall down&  here again!", expression: 1 },
	{ speaker: Speaker.Char2, text: "* We won't ever have to&  worry about your obtuse&  kind ever again!", expression: 1 },
	{ speaker: Speaker.Char1, text: "* We've been... slowly&  rebuilding.", expression: 8 },
	{ speaker: Speaker.Char1, text: "* VERY slowly.", expression: 14 },
	{ speaker: Speaker.Char1, text: "* I don't think we'll&  ever fully recover&  from what happened.", expression: 12 },
	{ speaker: Speaker.Char1, text: "* But... we can still&  make something new.", expression: 8 },
	{ speaker: Speaker.Char1, text: "* Something... HOPEFULLY&  better.", expression: 6 },
	{ speaker: Speaker.Char3, text: "* I thought you needed to&  lie down.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Huh? Well... I'm&  feeling better now.", expression: 0 },
	{ speaker: Speaker.Char2, text: "* Aww, would you look at&  that? She's worried about&  you.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* ANYWAY, the royal&  guard only has one&  member now.", expression: 2 },
	{ speaker: Speaker.Char2, text: "* He's a bit... on the&  younger side, so he isn't&  given proper training.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Though his enthusiasm&  is really something.", expression: 7 },
	{ speaker: Speaker.Char1, text: "* Reminds me of myself&  in that regard.", expression: 8 },
	{ speaker: Speaker.Char1, text: "* And I needed a captain&  for the guard, so...", expression: 3 },
	{ speaker: Speaker.Char3, text: "* He got me~", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Unfortunately...", expression: 13 },
	{ speaker: Speaker.Char3, text: "* You're speaking to the&  captain, now, human.", expression: 5 },
	{ speaker: Speaker.Char3, text: "* I call the shots around&  here.", expression: 4 },
	{ speaker: Speaker.Char1, text: "* What? No, you don't,&  I do!", expression: 3 },
	{ speaker: Speaker.Char2, text: "* We do.", expression: 4 },
	{ speaker: Speaker.Char3, text: "* Look at me now, being a&  kind and considerate&  peacemaker.", expression: 0 },
	{ speaker: Speaker.Char3, text: "* Hey, when are you coming&  back?~ I want to&  introduce you to my pet.", expression: 2 },
	{ speaker: Speaker.Char2, text: "* They can't, Muffet.&  Not anymore.", expression: 4 },
	{ speaker: Speaker.Char2, text: "* Just... use your pet to&  help rebuild or something.", expression: 3 },
	{ speaker: Speaker.Char3, text: "* Ah, well... maybe next&  time.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Yeah... Besides, we&  REALLY need a break&  from war.", expression: 10 },
	{ speaker: Speaker.Char3, text: "* Always so controlling.", expression: 4 },
	{ speaker: Speaker.Char3, text: "* You've come a long way!", expression: 3 },
	{ speaker: Speaker.Char3, text: "* I'm so proud of you, my&  dearest king!", expression: 2 },
	{ speaker: Speaker.Char2, text: "* Wow, Muffet, you know&  with all that talk, you&  almost sound like his-...", expression: 6 },
	{ speaker: Speaker.Char1, text: "* Stop. Talking.", expression: 14 },
	{ speaker: Speaker.Char1, text: "* Oh, the batteries are&  low on this thing.", expression: 3 },
	{ speaker: Speaker.Char3, text: "* Saved by the bell.", expression: 0 },
	{ speaker: Speaker.Char1, text: "* We finally have&  something good going on&  for us.", expression: 9 },
	{ speaker: Speaker.Char1, text: "* That's all I wanted to&  say.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* We can rest now.", expression: 0 },
	{ speaker: Speaker.Char2, text: "* Adiós, vile thing.", expression: 7 },
	{ speaker: Speaker.Char2, text: "* Lose this number.", expression: 4 },
	{ speaker: Speaker.Char3, text: "* Don't miss me too much!~", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Yeah, we're blocking&  you now.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Bye.", expression: 1 },
	{ speaker: Speaker.Neutral, text: "* (Click...)", expression: -1, music:noone }
];