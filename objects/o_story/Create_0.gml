
image_alpha = 0;
target_alpha = 0;
fade_speed = 0.05;
storypanelval = 0;
pn_i = 0;
son_kare = 6109;

paneller = [
	{ spr : storypanel_1, t : 110, sure : 298, ani : false, olay : [] },
	{ spr : storypanel_2, t : 446, sure : 326, ani : false, olay : [] },
	{ spr : storypanel_7, t : 810, sure : 293, ani : false, olay : [] },
	{ spr : storypanel_8, t : 1141, sure : 313, ani : false, olay : [] },
	{ spr : storypanel_9, t : 1492, sure : 276, ani : false, olay : [] },
	{ spr : storypanel_5, t : 1806, sure : 268, ani : false, olay : [] },
	{ spr : storypanel_10, t : 2112, sure : 360, ani : false, olay : [
			{ d : 246, spr : storypanel_17, ses : snd_eye, sars : 2 },
			{ d : 268, spr : storypanel_11, ses : -1, sars : 0 },
		] },
	{ spr : storypanel_12, t : 2472, sure : 190, ani : true, olay : [
			{ d : 0, spr : -1, ses : snd_damage, sars : 5 },
		] },
	{ spr : storypanel_13, t : 2700, sure : 321, ani : false, olay : [] },
	{ spr : storypanel_14, t : 3059, sure : 499, ani : false, olay : [] },
	{ spr : storypanel_15, t : 3596, sure : 1329, ani : false, olay : [] },
	{ spr : -1, t : 4945, sure : 0, ani : false, olay : [] },
	{ spr : storypanel_16, t : 5652, sure : 857, ani : false, olay : [] },
];

audio_play_sound(snd_balladofhteunderground,1,0);
