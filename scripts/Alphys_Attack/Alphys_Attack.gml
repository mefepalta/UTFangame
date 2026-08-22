///@desc Alphys'in kirmizi ruh ataklari icin kisayollar.

///@arg wall					0 = alt duvar, 1 = ust, 2 = sol, 3 = sag
///@arg hitX					carpma noktasi (x) -- duvarin uzerinde
///@arg hitY					carpma noktasi (y)
///@arg along					duvar boyunca gidis yonu (+1 / -1)
///@arg waveCount				kac dalga bolt cikacak
///@arg waveBolts				her dalgada HER AKIMDA kac bolt
///@arg spdFirst*				ilk dalganin hizi   (varsayilan 7.5)
///@arg spdLast*				son dalganin hizi   (varsayilan 2.5)
///@arg waveDelay*				dalgalar arasi kare (varsayilan 14)
function AlphysHammer(wall,hitX,hitY,along,waveCount,waveBolts)
{
	var _h = instance_create_depth(0,0,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_hammer);
	_h.wall = wall;
	_h.hit_x = hitX;
	_h.hit_y = hitY;
	_h.along = along;
	_h.wave_count = waveCount;
	_h.wave_bolts = waveBolts;
	if (argument_count >= 7) { _h.spd_first  = argument[6]; }
	if (argument_count >= 8) { _h.spd_last   = argument[7]; }
	if (argument_count >= 9) { _h.wave_delay = argument[8]; }
	return _h;
}

///@arg startX					buyuk boltun dogdugu nokta
///@arg startY
///@arg dir						gidis yonu (derece)
///@arg spd						hizi
///@arg fanCount*				patlayinca cikan bolt sayisi (varsayilan 8)
///@arg fanCurve*				o boltlarin kare basina yon degisimi (varsayilan 2.2)
///@arg fanSpeed*				o boltlarin hizi (varsayilan 5)
function AlphysBigBolt(startX,startY,dir,spd)
{
	var _b = instance_create_depth(startX,startY,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bigbolt);
	_b.direction = dir;
	_b.speed = spd;
	if (argument_count >= 5) { _b.fan_count = argument[4]; }
	if (argument_count >= 6) { _b.fan_curve = argument[5]; }
	if (argument_count >= 7) { _b.fan_speed = argument[6]; }
	return _b;
}

///@arg boltX					yildirimin dusecegi sutun
///@arg strikeY*				carpma noktasi      (varsayilan kutunun alt kenari)
///@arg warnTime*				uyari suresi        (varsayilan 60 = 1 saniye)
///@arg strikeTime*				yildirim suresi     (varsayilan 22)
function AlphysShocker(boltX)
{
	var _s = instance_create_depth(0,0,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_shocker);
	_s.bolt_x = boltX;
	if (argument_count >= 2)
	{
		_s.strike_y = argument[1];
		_s.warn_y = _s.strike_y - 14;
	}
	if (argument_count >= 3) { _s.warn_time   = argument[2]; }
	if (argument_count >= 4) { _s.strike_time = argument[3]; }
	return _s;
}
