switch (asama)
{
	case "kapan":
		perde = min(1,perde+1/PERDE);
		if (perde >= 1) { Ilerle(); }
		break;

	case "acil":
		perde = max(0,perde-1/PERDE);
		if (perde <= 0) { asama = "gorunur"; }
		break;

	case "bekle":
		perde = 1;
		break;
}

if (asama == "acil") or (asama == "gorunur") or (asama == "bekle") { bt += 1; }

if (mt_on) and (asama == "gorunur")
{
	mt_t += 1;
	if (mt_t >= MtSure())
	{
		mt_t = 0;
		mt_i += 1;
		if (mt_i >= array_length(mt_liste))
		{
			mt_on = false;
			mt_bitti = true;
		}
	}
}

if (asama == "gorunur")
{
	var _bitti = false;

	if (bolum == 6)
	{
		_bitti = mt_bitti;
	}
	else if (bolum == 8)
	{
		var _p = b8[alt];
		_bitti = (array_length(_p.mt) > 0) ? mt_bitti : (bt >= _p.sure);
	}
	else
	{
		_bitti = (bt >= B_SURE[bolum]);
	}

	if (_bitti) { asama = "kapan"; }
}

if (asama == "bekle") and (bolum == 7) and (bt >= B_SURE[7])
{
	bolum = 8;
	alt = 0;
	bt = 0;
	asama = "acil";
	MtBasla(b8[0].mt);
}

if (final_asama == 1) and (bt >= FINAL_BEKLE)
{
	if (!audio_is_playing(snd_eternal_bloom))
	{
		final_asama = 2;
		audio_play_sound(snd_vaporize,0,false);
		alarm[0] = FINAL_SON;
	}
}
