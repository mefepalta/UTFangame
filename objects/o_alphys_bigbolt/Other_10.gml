///@desc Soul Collision
if (global.kr)
{
	if (!instance_exists(hurtkr))
	{
		instance_create_depth(0,0,0,hurtkr);
	}
}
else
{
	// FAZ 2 -- klasik hasar. Buyuk yildirim yoluna devam ediyor; arka arkaya
	// vurmayi Battle_HurtNormal'in dokunulmazlik penceresi engelliyor.
	Battle_HurtNormal(DMG_BOLT_BIG);
}
