
depth = -9000000;
visible = true;
sprite_index = -1;

active = false;
who = 0;
t = 0;

T_BLACK   = 22;
T_SOUL    = 70;
T_HOLD    = 112;
T_GLITCH  = 126;
T_BURST   = 158;
T_FLASH   = 174;
T_END     = 210;

soul_x = 320;
soul_y = 300;
soul_alpha = 0;
soul_bright = 0;
soul_scale = 1;
soul_shake_x = 0;
soul_shake_y = 0;

black_alpha = 0;
flash_alpha = 0;
beam_alpha = 0;
beam_len = 0;
beam_n = 6;
beam_spin = 0;
circle_r = 0;

PIECE_N = 7;
piece_p = 0;
piece_ox = array_create(PIECE_N,0);
piece_oy = array_create(PIECE_N,0);
piece_ang = array_create(PIECE_N,0);
piece_spin = array_create(PIECE_N,0);
piece_img = array_create(PIECE_N,0);
piece_delay = array_create(PIECE_N,0);

DEBRIS_N = 4;
debris_on = false;
debris_alpha = 0;
deb_x = array_create(DEBRIS_N,0);
deb_y = array_create(DEBRIS_N,0);
deb_hs = array_create(DEBRIS_N,0);
deb_vs = array_create(DEBRIS_N,0);
deb_ang = array_create(DEBRIS_N,0);
deb_spin = array_create(DEBRIS_N,0);
deb_img = array_create(DEBRIS_N,0);

ring_r = 0;
ring_alpha = 0;

start = function(_who)
{
	if (active) { return; }
	active = true;
	who = _who;
	t = 0;
	soul_alpha = 0;
	soul_bright = 0;
	soul_scale = 1;
	black_alpha = 0;
	flash_alpha = 0;
	beam_alpha = 0;
	beam_len = 0;
	circle_r = 0;
	beam_spin = random(360);
	piece_p = 0;
	debris_on = false;
	debris_alpha = 0;
	ring_r = 0;
	ring_alpha = 0;

	for (var i = 0; i < PIECE_N; i++)
	{
		var _a = (i/PIECE_N)*360 + random_range(-24,24);
		var _d = random_range(280,440);
		piece_ox[i] = lengthdir_x(_d,_a);
		piece_oy[i] = lengthdir_y(_d,_a);
		piece_ang[i] = random(360);
		piece_spin[i] = random_range(-7,7);
		piece_img[i] = irandom(sprite_get_number(spr_battle_soul_slice_white)-1);
		piece_delay[i] = random(0.22);
	}

	if (who == 1) { global.p2_revived_pap = true; } else { global.p2_revived_alp = true; }


	audio_pause_all();
};
