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
	// FAZ 2 -- klasik hasar. Eski kod battle_soul._inv = 50 yaziyordu ama o
	// degisken hicbir yerde azalmiyor: dokunulmazlik hic islemiyordu.
	// Gercek sayac global._inv; onu Battle_HurtNormal kuruyor.
	Battle_HurtNormal(DMG_BOLT);
	instance_destroy();
}
