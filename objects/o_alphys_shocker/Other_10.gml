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
	if (battle_soul._inv < 1)
	{
		battle_soul._inv = 50;
		instance_destroy(hurtkr);
		Player_Hurt(4);
	}
}
