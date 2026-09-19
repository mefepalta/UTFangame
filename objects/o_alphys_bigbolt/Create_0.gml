event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;
sprite_index = spr_alphys_lightning_bolt;
image_speed = 0;
image_index = 0;
image_alpha = 0;

bolt_scale = 3;
spin       = 6;
fade_in    = 8;

boom_scale = 0.6;
boom_grow  = 0.22;
boom_time  = 22;

fan_count  = 8;
fan_speed  = 5;
fan_curve  = 2.6;
fan_decay  = 0.978;
fan_spin   = 8;
fan_scale  = 1;

// NORMAL'de patlamadan cikan kucuk boltlar sadelesiyor: sayi bu degere
// kirpiliyor ve boltlar egrilmeden DUZ gidiyor (curve/spin sifir). HARD
// yukaridaki fan_* degerlerini aynen kullaniyor. EASY faz 2'de bu atagin
// gectigi turlar (t14/t16/t17/t20) zaten listede degil.
// Uygulandigi yer: Explode().
normal_fan_count = 4;

// Patlamadan cikan boltlarin taban acisi burada, olusturulurken seciliyor
// (eskiden Explode icinde irandom(359) idi) ki dusus sirasinda Draw_0
// yonleri onceden gosterebilsin.
fan_base = irandom(359);

// Yon belirteci: bolt duserken patlamadan cikacak boltlarin izleyecegi
// yolu (HARD'da egri, NORMAL'de duz) yanip sonen ok cizgileriyle cizer.
// Turlerden _b.gosterge = false ile kapatilir.
// gosterge_yer 0: oklar boltun uzerinde, onunla birlikte duser (varsayilan;
//   patlama noktasinda bolt gelmeden beliren oklar garip duruyordu).
// gosterge_yer 1: oklar tahmini patlama noktasinda sabit durur.
// Cizgi uzunlugu = gosterge_adim * fan_speed piksel.
gosterge       = true;
gosterge_yer   = 0;
gosterge_adim  = 14;
gosterge_kalin = 2;
gosterge_col   = c_yellow;

serbest_y = -1;

_state = 0;
_t = 0;

// Zorluk ayari: HARD fan_* degerlerini aynen kullaniyor; NORMAL daha az
// sayida ve egrilmeden duz giden bolt uretiyor. Explode ve Draw_0'daki
// belirtec ayni tabloyu okuyor ki gosterilen yol ile cikan bolt tutsun.
FanAyar = function()
{
	var _f = { adet: fan_count, curve: fan_curve, decay: fan_decay, spin: fan_spin };
	if (Difficulty_Get() != DIFFICULTY_HARD)
	{
		_f.adet  = min(fan_count,normal_fan_count);
		_f.curve = 0;
		_f.decay = 1;
		_f.spin  = 0;
	}
	return _f;
};

// Mevcut hizla ilerlemeye devam edilirse Step_0'daki kosullarla patlamanin
// gerceklesecegi nokta ([x,y]); tahtaya hic girmeyecekse undefined.
PatlamaNoktasi = function()
{
	var _bl = battle_board.x-battle_board.left;
	var _br = battle_board.x+battle_board.right;
	var _bt = battle_board.y-battle_board.up;
	var _bb = battle_board.y+battle_board.down;

	var _px = x;
	var _py = y;
	for (var _i = 0; _i < 200; _i++)
	{
		if (serbest_y >= 0)
		{
			if (_py >= serbest_y) { return [_px,_py]; }
		}
		else if (_px > _bl) and (_px < _br) and (_py > _bt) and (_py < _bb)
		{
			return [_px,_py];
		}
		_px += hspeed;
		_py += vspeed;
	}
	return undefined;
};

Explode = function()
{
	_state = 1;
	_t = 0;
	speed = 0;
	audio_play_sound(kaboom,0,false);
	Camera_Shake(6,6,1,1,1,1);

	var _f = FanAyar();
	for (var _i = 0; _i < _f.adet; _i++)
	{
		var _b = instance_create_depth(x,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bolt);
		_b.direction = fan_base + _i*(360/_f.adet);
		_b.speed = fan_speed;
		_b.spin  = _f.spin;
		_b.curve = _f.curve;
		_b.curve_decay = _f.decay;
		_b.scale = fan_scale;
	}
};
