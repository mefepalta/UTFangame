depth = 50;

hsp = 0;
image_alpha = 1;
creditstimer = 0;
audio_stop_sound(snd_chance);
audio_stop_sound(snd_menu);

// ---------------------------------------------------------------------
// Credits sequence.
// Timings are the old ones: first board at 300, 520 steps per board and
// the last board at 4560, so everything still lines up with the music.
// ---------------------------------------------------------------------
panel_start  = 300;
panel_length = 520;
panel_list   = [s_credits_0, s_credits_1, s_credits_2, s_credits_3,
                s_credits_4, s_credits_5, s_credits_6, s_credits_7];
last_start   = 4560;    // "Phase 2 Soon!" board
last_length  = 1640;    // held until 5700, then a long fade out

// what the Draw event puts on screen this step
panel_sprite  = -1;
panel_x       = 320;
panel_y       = 250;
panel_alpha   = 0;
panel_scale   = 1;
panel_glow    = 0;
panel_flash   = 0;
panel_current = -1;

// ---------------------------------------------------------------------
// Background: parallax starfield, drifting nebula pools, shooting stars
// ---------------------------------------------------------------------
fx_t = 0;

stars = [];
for (var _si = 0; _si < 110; _si++)
{
	var _layer = irandom(2);            // 0 = far away, 2 = close
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
