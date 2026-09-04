if Input_IsPressed(INPUT.CONFIRM){
	room_goto(room_menu);
}

// ---------------------------------------------------------------------
// Presentation
// ---------------------------------------------------------------------
fx_t++;
if (_hint) { hint_t++; }

if (view_enabled) and (view_visible[0])
{
	var _cam = view_camera[0];
	vx_ = camera_get_view_x(_cam);
	vy_ = camera_get_view_y(_cam);
	vw_ = camera_get_view_width(_cam);
	vh_ = camera_get_view_height(_cam);
}

// --- ambient specks --------------------------------------------------
// hint_half_size kamerayi 2. karede 320x240 yapiyor; parcaciklari ondan
// sonra dagit, yoksa 640x480 alanina saciliyorlar
if (array_length(dust) == 0) and (fx_t >= 3)
{
	for (var _d = 0; _d < 55; _d++)
	{
		array_push(dust, {
			px     : vx_ + random(vw_),
			py     : vy_ + random(vh_),
			r      : 0.4 + random(1.0),
			vy     : 0.10 + random(0.30),
			sway   : random(6.2831),
			swaysp : 0.006 + random(0.018),
			a      : 0.12 + random(0.32)
		});
	}
	for (var _s = 0; _s < 45; _s++)
	{
		array_push(stars, {
			px    : vx_ + random(vw_),
			py    : vy_ + random(vh_),
			r     : 0.4 + random(0.7),
			phase : random(6.2831),
			blink : 0.010 + random(0.030)
		});
	}
}
for (var _i = 0; _i < array_length(dust); _i++)
{
	var _f = dust[_i];
	_f.sway += _f.swaysp;
	_f.py   -= _f.vy;                       // drifts upwards, like embers
	_f.px   += sin(_f.sway) * 0.28;
	// wrap on every side, so a camera change never strands a speck offscreen
	if (_f.py < vy_ - 4)        { _f.py = vy_ + vh_ + 4; _f.px = vx_ + random(vw_); }
	if (_f.py > vy_ + vh_ + 4)  { _f.py = vy_ - 4;       _f.px = vx_ + random(vw_); }
	if (_f.px < vx_ - 4)        { _f.px = vx_ + vw_ + 4; }
	if (_f.px > vx_ + vw_ + 4)  { _f.px = vx_ - 4; }
}
for (var _j = 0; _j < array_length(stars); _j++)
{
	var _st = stars[_j];
	_st.phase += _st.blink;
	if (_st.px < vx_) or (_st.px > vx_ + vw_) or (_st.py < vy_) or (_st.py > vy_ + vh_)
	{
		_st.px = vx_ + random(vw_);
		_st.py = vy_ + random(vh_);
	}
}

// --- the spear landing -----------------------------------------------
if (!impacted) and (_spear == true) and (instance_exists(o_spear))
{
	if (o_spear.x >= 295)
	{
		impacted   = true;
		impact_t   = 0;
		impact_x   = o_spear.x;
		impact_y   = o_spear.y;
		logo_punch = 1.13;

		for (var _k = 0; _k < 26; _k++)
		{
			var _ang = random(2 * pi);
			var _spd = 2.0 + random(5.5);
			array_push(sparks, {
				px   : impact_x,
				py   : impact_y,
				vx   : cos(_ang) * _spd,
				vy   : sin(_ang) * _spd * 0.75,
				life : 0,
				max  : 24 + irandom(20),
				col  : choose(c_white, c_white, make_colour_rgb(255, 220, 140), make_colour_rgb(230, 150, 255))
			});
		}
	}
}
if (impact_t >= 0) { impact_t++; }

for (var _p = array_length(sparks) - 1; _p >= 0; _p--)
{
	var _sp = sparks[_p];
	_sp.px += _sp.vx;
	_sp.py += _sp.vy;
	_sp.vx *= 0.94;
	_sp.vy = _sp.vy * 0.94 + 0.10;          // a little gravity
	_sp.life++;
	if (_sp.life > _sp.max) { array_delete(sparks, _p, 1); }
}

// --- the logo itself: eases in, then takes the hit --------------------
logo_punch = lerp(logo_punch, 1, 0.11);
if (instance_exists(o_logo))
{
	var _in = clamp(fx_t / 45, 0, 1);
	_in = 1 - power(1 - _in, 3);
	var _breathe = 1 + sin(fx_t * 0.030) * 0.006;
	var _sc = lerp(1.55, 1.75, _in) * logo_punch * _breathe;
	with (o_logo)
	{
		image_alpha  = _in;
		image_xscale = _sc;
		image_yscale = _sc;
	}
}
