depth = 50;

hsp = 0;
image_alpha = 1;
creditstimer = 0;
audio_stop_sound(snd_chance);
audio_stop_sound(snd_menu);

// ---------------------------------------------------------------------
// Credits schedule. One entry per board: which sprite, the step it comes
// in on, how long it stays and how long its closing fade takes.
// Boards 0-7 keep the original 520-step rhythm starting at 300, so the
// whole sequence still lines up with snd_goldenstarlight.
// ---------------------------------------------------------------------
credit_schedule = [];

var _boards = [s_credits_0, s_credits_1, s_credits_2, s_credits_3,
               s_credits_4, s_credits_5, s_credits_6, s_credits_7];
for (var _b = 0; _b < array_length(_boards); _b++)
{
	array_push(credit_schedule, {
		spr     : _boards[_b],
		start   : 300 + _b * 520,
		dur     : 520,
		fadein  : 80,
		fadeout : 130
	});
}

// "Testing & Feedback" - a normal board, same rhythm as the rest
array_push(credit_schedule, {
	spr     : s_credits_8,
	start   : 4560,
	dur     : 520,
	fadein  : 80,
	fadeout : 130
});

// the closing message: held long, then a slow fade that finishes at 6200,
// just before the logo comes back down at 6220
array_push(credit_schedule, {
	spr     : s_credits_9,
	start   : 5180,
	dur     : 1020,
	fadein  : 80,
	fadeout : 500
});


panel_sprite  = -1;
panel_x       = 320;
panel_y       = 250;
panel_alpha   = 0;
panel_scale   = 1;
panel_glow    = 0;
panel_flash   = 0;
panel_current = -1;

fx_t = 0;

stars = [];
for (var _si = 0; _si < 110; _si++)
{
	var _layer = irandom(2);
	array_push(stars, {
		px    : random(660) - 10,
		py    : random(500) - 10,
		size  : 0.6 + _layer * 0.5,
		vy    : 0.05 + _layer * 0.09,
		vx    : 0.08 + _layer * 0.13,
		phase : random(6.2831),
		blink : 0.015 + random(0.035),
		tint  : choose(c_white, c_white, make_colour_rgb(180, 200, 255), make_colour_rgb(255, 220, 190))
	});
}

var _nebcol = [make_colour_rgb(80, 40, 150), make_colour_rgb(25, 60, 150), make_colour_rgb(120, 30, 110)];
nebula = [];
for (var _ni = 0; _ni < 3; _ni++)
{
	array_push(nebula, {
		px    : 120 + random(400),
		py    : 140 + random(240),
		r     : 150 + random(110),
		phase : random(6.2831),
		col   : _nebcol[_ni]
	});
}

shots = [];
shot_timer = irandom_range(150, 300);
