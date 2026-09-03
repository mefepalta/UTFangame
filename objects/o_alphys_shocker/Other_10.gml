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
	// FAZ 2 -- klasik hasar. Sok alani duruyor, tekrar vurmasini
	// dokunulmazlik penceresi ayarliyor.
	Battle_HurtNormal(DMG_SHOCKER);
}
