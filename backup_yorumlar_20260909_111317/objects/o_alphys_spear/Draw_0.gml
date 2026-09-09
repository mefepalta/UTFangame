draw_self();

if (image_alpha > dmg_alpha) and (instance_exists(battle_soul))
{
	if (place_meeting(x,y,battle_soul))
	{
		if (dmg_kill)
		{
			Battle_CallSoulEventBulletCollision();
		}
		else if (global.kr)
		{
			if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
		}
		else
		{
			Battle_HurtNormal(DMG_SPEAR);
		}
	}
}
