if (global.kr)
{
	if (!instance_exists(hurtkr))
	{
		instance_create_depth(0,0,0,hurtkr);
	}
}
else
{
	Battle_HurtNormal(DMG_BOLT);
	instance_destroy();
}
