/// Enum for character IDs
enum Speaker {
    Char1,
    Char2,
    Char3,
    Neutral
}

// Dialogue script
dialogue = [
    { speaker: Speaker.Neutral, text: "* (Ring, ring...)", expression: -1},
    { speaker: Speaker.Char1, text: "* ...", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Hey.", expression: 4 },
	{ speaker: Speaker.Char1, text: "* ugh, come on, is this thing on?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* Oh, there we go.", expression: 0 },
	{ speaker: Speaker.Char1, text: "* So...", expression: 8, music: snd_phoneringing  },
	{ speaker: Speaker.Char1, text: "* This is Sans.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* I didn't think I would get signal through the barrier.", expression: 6 },
	{ speaker: Speaker.Char1, text: "* Anyway... I'm just here to tell you...", expression: 9 },
	{ speaker: Speaker.Char1, text: "* You really messed things up for us.", expression: 12 },
	{ speaker: Speaker.Char1, text: "* You just had to see the surface, didn't you?", expression: 12 },
	{ speaker: Speaker.Char1, text: "* You just couldn't let us have a happy ending.", expression: 15 },
	{ speaker: Speaker.Char1, text: "* The Queen is gone, everyone is.", expression: 10 },
	{ speaker: Speaker.Char1, text: "* All that's left is the few that survived, Undyne, and me.", expression: 10 },
	{ speaker: Speaker.Char1, text: "* And for that, I became the new ruler.", expression: 0 },
	{ speaker: Speaker.Char1, text: "* And... seeing as that is a big responsibility for just one person...", expression: 7 },
	{ speaker: Speaker.Char1, text: "* I... elected Dr Undyne to be...", expression: 9 },
	{ speaker: Speaker.Char1, text: "* Co-Leader. To do paperwork, make sure the people are happy.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* That kind of thing.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Uh, anyway.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* ...Though, I guess things are getting back on track.", expression: 8 },
	{ speaker: Speaker.Char1, text: "* I mean, we are going back to our normal lives.", expression: 0 },
	{ speaker: Speaker.Char1, text: "* And I'd say after a few years, this place will be as lively as then.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Undyne is working on a way to get us out of here.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Because the souls we did have... well, I think you know what happened.", expression: 14 },
	{ speaker: Speaker.Char1, text: "* Oh, that's her right now.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Hey, Undyne, can you take the phone?", expression: 0 },
	{ speaker: Speaker.Char1, text: "* I need to lay down.", expression: 1},
	{ speaker: Speaker.Char2, text: "* Um... okay.", expression: 0 },
	{ speaker: Speaker.Char2, text: "* Who am I speaking to?", expression: 5 },
	{ speaker: Speaker.Char1, text: "* The human.", expression: 1 },
	{ speaker: Speaker.Char2, text: "* The what?", expression: 8 },
	{ speaker: Speaker.Char1, text: "* Calm down. Not like they can hurt us from here.", expression: 2 },
	{ speaker: Speaker.Char2, text: "* I guess...", expression: 2 },
	{ speaker: Speaker.Char2, text: "* What do you want, human?", expression: 4 },
	{ speaker: Speaker.Char2, text: "* W-... We don't exactly like you here after you did, so...", expression: 7 },
	{ speaker: Speaker.Char2, text: "* Don't expect us to have a party if you return.", expression: 4 },
	{ speaker: Speaker.Char2, text: "* ...", expression: 2 },
	{ speaker: Speaker.Char2, text: "* And I guess you already heard this by now...", expression: 1 },
	{ speaker: Speaker.Char2, text: "* Sans had no one else to lead, so... I'm the Queen now, kind of.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Co-Leader!", expression: 2 },
	{ speaker: Speaker.Char2, text: "* Right, right. Co-Leader.", expression: 0 },
	{ speaker: Speaker.Char2, text: "* Sans doesn't like calling me the Queen.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* That's because you're not.", expression: 2 },
	{ speaker: Speaker.Char2, text: "* I even get to sit on the throne.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Only by technicality.", expression: 7 },
	{ speaker: Speaker.Char2, text: "* In any case, human...", expression: 2 },
	{ speaker: Speaker.Char2, text: "* I... I guess things aren't that bad for us.", expression: 3 },
	{ speaker: Speaker.Char2, text: "* The future does look bright for us.", expression: 5 },
	{ speaker: Speaker.Char2, text: "* One day... we'll get to the surface, and...", expression: 4 },
	{ speaker: Speaker.Char2, text: "* ...", expression: 4 },
	{ speaker: Speaker.Char2, text: "* Well Sans?", expression: 3 },
	{ speaker: Speaker.Char1, text: "* What?", expression: 3 },
	{ speaker: Speaker.Char2, text: "* What will we do next?", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Why are you asking me? We aren't there yet.", expression: 3 },
	{ speaker: Speaker.Char1, text: "* Though after all this... I can't say I'm particularly looking forward to another war.", expression: 10 },
	{ speaker: Speaker.Char1, text: "* We need time to rest, for real this time.", expression: 10 },
	{ speaker: Speaker.Char1, text: "* We'll... figure that out as we go.", expression: 0 },
	{ speaker: Speaker.Char2, text: "* At least now, we can rest easy...", expression: 1 },
	{ speaker: Speaker.Char2, text: "* Knowing that there is still a chance for us. For me, for everyone.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Yeah.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Oh, speaking of...", expression: 5 },
	{ speaker: Speaker.Char2, text: "* I thought you needed to lay down.", expression: 8 },
	{ speaker: Speaker.Char1, text: "* Huh? Well... I'm feeling better now.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Anyway.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* The royal guard only has one member now.", expression: 11 },
	{ speaker: Speaker.Char2, text: "* He's a bit... young, so he isn't given proper training.", expression: 6 },
	{ speaker: Speaker.Char1, text: "* Though his enthusiasm is really something.", expression: 0 },
	{ speaker: Speaker.Char1, text: "* Reminds me of myself in that regard.", expression: 1 },
	{ speaker: Speaker.Char1, text: "* Oh, I needed a captain for the guard, so...", expression: 5 },
	{ speaker: Speaker.Char3, text: "* So he got me~", expression: 3 },
	{ speaker: Speaker.Char1, text: "* When did you get here?", expression: 3 },
	{ speaker: Speaker.Char3, text: "* Just now.", expression: 0 },
	{ speaker: Speaker.Char3, text: "* Oh! Is that the human?", expression: 2 },
	{ speaker: Speaker.Char1, text: "* How would you know that?", expression: 3 },
	{ speaker: Speaker.Char3, text: "* Let me talk to them!", expression: 3 },
	{ speaker: Speaker.Char2, text: "* Um, okay.", expression: 4 },
	{ speaker: Speaker.Char3, text: "* You are speaking to the captain, now, human.", expression: 5 },
	{ speaker: Speaker.Char3, text: "* Now I call the shots around here.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* What? No you don't, I do!", expression: 2 },
	{ speaker: Speaker.Char2, text: "* We do.", expression: 8 },
	{ speaker: Speaker.Char3, text: "* Yeah, yeah, I know.", expression: 5 },
	{ speaker: Speaker.Char3, text: "* Isn't that great? Look at me now, I'm the peacemaker.", expression: 1 },
	{ speaker: Speaker.Char3, text: "* Hey, when are you coming back?~ I want to introduce you to my pet.", expression: 3 },
	{ speaker: Speaker.Char2, text: "* They're... they're not, Muffet.", expression: 3 },
	{ speaker: Speaker.Char3, text: "* Ah, well... maybe next time.", expression: 4 },
	{ speaker: Speaker.Char1, text: "* Besides, we need a break from war.", expression: 10 },
	{ speaker: Speaker.Char3, text: "* Always so controlling.", expression: 0 },
	{ speaker: Speaker.Char3, text: "* I'm so proud of you, you're king now!", expression: 5 },
	{ speaker: Speaker.Char2, text: "* Wow Muffet, you know with all that talk, you almost sound like his...", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Stop. Talking.", expression: 14 },
	{ speaker: Speaker.Char1, text: "* Oh, the batteries are low on this thing.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* Just please, don't come back.", expression: 12 },
	{ speaker: Speaker.Char1, text: "* We finally have something going here, and we don't want you messing that up.", expression: 12 },
	{ speaker: Speaker.Char2, text: "* Goodbye.", expression: 2 },
	{ speaker: Speaker.Char3, text: "* See you.", expression: 5 },
	{ speaker: Speaker.Char1, text: "* See you around.", expression: 0 },
	{ speaker: Speaker.Neutral, text: "* (Click...)", expression: -1, music:noone }
];

// Character data as an array indexed by enum
char_data = array_create(4);

char_data[Speaker.Char1]  = { portrait: s_phonecallsans, sound: snd_text_voice_sans, font: fnt_sansow };
char_data[Speaker.Char2]  = { portrait: s_phonecallundyne, sound: snd_text_voice_undyne, font: font_determination_mono_4 };
char_data[Speaker.Char3]  = { portrait: s_phonecallmuffet, sound: snd_text_voice_default, font: font_determination_mono_4 };
char_data[Speaker.Neutral] = { portrait: noone, sound: noone, font: font_determination_mono_4 };

// Dialogue state
dialogue_index = 0;
current_text = "";
current_music = noone;
char_index = 0;
text_speed = 2;
text_timer = 0;
text_done = false;
text_pos = 0; // current position in dialogue text

// Visibility delay
visible = false;
alarm[0] = room_speed * 2;