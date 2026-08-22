event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// ---------------- AYARLAR ----------------
// Cekic sapinin ucundan doner. Once duvara dik durur, yavasca geriye
// yatar, sonra hizlanarak iner ve duvara paralel hale gelip ucuyla
// carpar. Boltlar tam o koseden, duvardan iceri dogru fisirdir.
wall  = 0;		/// 0 = alt duvar, 1 = ust, 2 = sol, 3 = sag
along = 1;		/// duvar boyunca gidis yonu (+1 / -1)

hit_x = battle_board.x;
hit_y = battle_board.y + battle_board.down;

hammer_scale  = 1.4;
head_corner_x = 103;	/// sprite icinde carpma kosesi
head_corner_y = 39;

start_angle = 90;		/// duvara dik bekleme acisi
pull_angle  = 125;		/// geriye yatma acisi
ready_time  = 14;		/// dik bekleme
pull_time   = 34;		/// geriye cekme -- yavas
strike_time = 9;		/// ileri vurus -- hizli
hold_time   = 30;		/// carptiktan sonra ekranda kalma
leave_time  = 18;		/// cekilme suresi

wave_count  = 3;		/// kac dalga bolt
wave_delay  = 14;		/// dalgalar arasi kare
wave_bolts  = 1;		/// her akimda kac bolt (1 = dalga basina 3 bolt)
bolt_lean   = 25;		/// boltlarin gidis yonune yatma acisi
bolt_fan    = 32;		/// uc akim arasindaki aci
bolt_spread = 9;		/// ayni akimda birden fazla bolt varsa aralari
spd_first   = 7.5;		/// ilk dalganin hizi
spd_last    = 2.5;		/// son dalganin hizi
bolt_spin   = 0;
// -----------------------------------------

_state = 0;
_t = 0;
_wave = 0;
_angle = start_angle;
_alpha = 0;

/// Cekicin duvara paralel yattigi temel aci.
WallAngle = function()
{
	switch (wall)
	{
		case 1:  return 180;	// ust duvar
		case 2:  return 270;	// sol duvar
		case 3:  return 90;		// sag duvar
		default: return 0;		// alt duvar
	}
};

/// Duvarin kutunun icine bakan normali.
NormalDir = function()
{
	switch (wall)
	{
		case 1:  return 270;
		case 2:  return 0;
		case 3:  return 180;
		default: return 90;
	}
};

/// Cekicin duvar boyunca ilerledigi yon.
TravelDir = function()
{
	return ((along >= 0) ? WallAngle() : WallAngle()+180);
};

/// Tek bir bolt dalgasi: uc akim. Dalga numarasi buyudukce hiz
/// spd_first'ten spd_last'e iner, yani ilk cikanlar hizli.
ShootWave = function(_w)
{
	var _spd = spd_first;
	if (wave_count > 1)
	{
		_spd = lerp(spd_first,spd_last,_w/(wave_count-1));
	}

	var _nd = NormalDir();
	var _turn = sign(angle_difference(TravelDir(),_nd));
	if (_turn == 0) { _turn = 1; }
	var _center = _nd + _turn*bolt_lean;

	for (var _s = -1; _s <= 1; _s++)
	{
		for (var _b = 0; _b < wave_bolts; _b++)
		{
			var _off = (_b-(wave_bolts-1)/2)*bolt_spread;
			var _bl = instance_create_depth(hit_x,hit_y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bolt);
			_bl.direction = _center + _s*bolt_fan + _off;
			_bl.speed = _spd;
			_bl.spin = bolt_spin;
		}
	}
	audio_play_sound(snd_noise,2,false);
};
