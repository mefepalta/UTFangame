_t++;

if (_state == 0)
{
	image_alpha = (fade_in > 0 ? min(1,_t/fade_in) : 1);
	image_xscale = bolt_scale;
	image_yscale = bolt_scale;
	image_angle += spin;

	var _bl = battle_board.x-battle_board.left;
	var _br = battle_board.x+battle_board.right;
	var _bt = battle_board.y-battle_board.up;
	var _bb = battle_board.y+battle_board.down;

	// serbest_y >= 0 ise kutuya degme kurali gecerli degil: bolt verilen
	// yukseklige inince patliyor. Kutunun ekranin tamami oldugu bolumlerde
	// carpacak yuzey olmadigi icin gerekiyor -- yoksa ekrana girer girmez
	// patlardi. Varsayilan -1, yani eski davranis aynen duruyor.
	if (serbest_y >= 0)
	{
		if (y >= serbest_y) { Explode(); }
	}
	else if (x > _bl) and (x < _br) and (y > _bt) and (y < _bb)
	{
		Explode();
	}
	else if (x < -90) or (x > 730) or (y < -90) or (y > 570)
	{
		instance_destroy();
	}
}
else
{
	boom_scale += boom_grow;
	if (_t >= boom_time)
	{
		instance_destroy();
	}
}
