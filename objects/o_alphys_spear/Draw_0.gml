draw_self();

// Mod her dalgada hasari alfaya bagliyor: spear4, spear1 ve spear2 sadece
// alpha > 0.9 iken vuruyor, spear5 ve spear3'te kosul yok.
if (image_alpha > dmg_alpha) and (instance_exists(battle_soul))
{
	if (place_meeting(x,y,battle_soul))
	{
		if (dmg_kill)
		{
			// Sadece spear1 carpan mizragi yok ediyor (bullet.Remove()).
			Battle_CallSoulEventBulletCollision();
		}
		else if (global.kr)
		{
			if (!instance_exists(hurtkr)) { instance_create_depth(0,0,0,hurtkr); }
		}
		else
		{
			// FAZ 2 -- klasik hasar. Mizrak yoluna devam ediyor; arka arkaya
			// vurmayi dokunulmazlik penceresi engelliyor.
			Battle_HurtNormal(DMG_SPEAR);
		}
	}
}
