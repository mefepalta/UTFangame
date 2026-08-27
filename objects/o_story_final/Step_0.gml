//--------------------------------------------------------------- perde
// Butun gecisler siyahtan geciyor: once kararir (kapan), durum degisir,
// sonra acilir (acil). "bekle" = perde inik kalir (a short pause).
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

// Bolum sayaci perde acilirken de isliyor ki panel, perde kalkarken
// canlanmaya baslasin. "kapan" sirasinda duruyor.
if (asama == "acil") or (asama == "gorunur") or (asama == "bekle") { bt += 1; }

//--------------------------------------------------------------- metin akisi
// Metin SADECE perde tamamen acikken akiyor (taslak: panel degisirken
// metin oynamayacak).
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

//--------------------------------------------------------------- bitis mi?
// Yalnizca perde tamamen acikken karar veriliyor.
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

//--------------------------------------------------------------- a short pause
// 7. bolumde perde inik; suresi dolunca 8. bolume acilarak geciyor.
if (asama == "bekle") and (bolum == 7) and (bt >= B_SURE[7])
{
	bolum = 8;
	alt = 0;
	bt = 0;
	asama = "acil";
	MtBasla(b8[0].mt);
}

//--------------------------------------------------------------- final
// Son panel de kapandiktan sonra ekran bir sure siyah kaliyor, sonra
// muzigin bitmesi bekleniyor, ANCAK ondan sonra toz sesi caliyor ve
// jenerige geciliyor. Aceleye gelmesin diye her adimin kendi nefesi var.
if (final_asama == 1) and (bt >= FINAL_BEKLE)
{
	if (!audio_is_playing(snd_eternal_bloom))
	{
		final_asama = 2;
		audio_play_sound(snd_vaporize,0,false);
		alarm[0] = FINAL_SON;	// ses efekti otursun, sonra jenerik
	}
}
