
depth = 0;

if (instance_exists(fader))
{
	Anim_Destroy(fader,"alpha");
	fader.alpha = 0;
}

PN_X = 40;
PN_GEN = 560;
PN_YUK = round(PN_GEN*593/1078);
PN_Y = round((480-PN_YUK)/2);
PN_OL = PN_GEN/1078;

PERDE = 45;
perde = 1;
asama = "acil";

bolum = 1;
bt = 0;
alt = 0;
final_asama = 0;
FINAL_BEKLE = 120;
FINAL_SON = 300;

mt_liste = [];
mt_i = 0;
mt_t = 0;
mt_on = false;
mt_bitti = true;
MT_HIZ = 3;
MT_BEKLE = 80;

MtBasla = function(_liste)
{
	mt_liste = _liste;
	mt_i = 0;
	mt_t = 0;
	mt_on = (array_length(_liste) > 0);
	mt_bitti = !mt_on;
};

MtSure = function()
{
	if (mt_i >= array_length(mt_liste)) { return 0; }
	return string_length(mt_liste[mt_i])*MT_HIZ+MT_BEKLE;
};

b6 = [
	{ spr : end_frame_7_3, mt : ["...","Mweh... heh... heh."] },
	{ spr : end_frame_7_6, mt : ["L-... Looks like even after all that...",
	                             "Even my own will power wasn't enough to take down...",
	                             "...a human."] },
	{ spr : end_frame_7_9, mt : ["...",
	                             "I won't let you see me turn to dust.",
	                             "I won't let you get that satisfaction..."] },
];

b8 = [
	{ spr : end_frame_8_2, sure : 0, mt : ["The war... is finally over.",
	                                       "You hear that... everyone?",
	                                       "We can finally rest.",
	                                       "...",
	                                       "...I think... I'm going to watch the snow for a little while."] },
	{ spr : end_frame_8_4, sure : 300, mt : [] },
	{ spr : end_frame_8_6, sure : 300, mt : [] },
	{ spr : end_frame_8_8, sure : 340, mt : [] },
];

B_SURE = [0,560,700,380,660,760,0,240,0];

F25_OL = PN_GEN/1536;
f25 = [
	{ sx : 728, sy : 219, sw : 257, sh : 315 },
	{ sx : 332, sy : 402, sw : 257, sh : 346 },
];

AGAC_KAY = 220;

B4_OL = 480/593;
B4_GEN = round(539*B4_OL);
B4_X = 640-B4_GEN;
B4_Y = 0;
NEFES_MX = (189+328)/2;
NEFES_MY = (227+269)/2;

PanelAlan = function()
{
	if (bolum == 5) { return { x : B4_X, y : B4_Y, w : B4_GEN, h : 480 }; }
	return { x : PN_X, y : PN_Y, w : PN_GEN, h : PN_YUK };
};

Ilerle = function()
{
	if (bolum == 6)
	{
		alt += 1;
		if (alt < array_length(b6))
		{
			bt = 0; asama = "acil"; MtBasla(b6[alt].mt);
			return;
		}
		bolum = 7; alt = 0; bt = 0; asama = "bekle";
		return;
	}

	if (bolum == 8)
	{
		alt += 1;
		if (alt < array_length(b8))
		{
			bt = 0; asama = "acil"; MtBasla(b8[alt].mt);
			return;
		}
		alt = array_length(b8)-1;
		bt = 0; asama = "bekle"; final_asama = 1;
		return;
	}

	bolum += 1;
	bt = 0;
	asama = "acil";
	if (bolum == 6) { MtBasla(b6[0].mt); }
};

audio_stop_all();
audio_play_sound(snd_eternal_bloom,1,false);
