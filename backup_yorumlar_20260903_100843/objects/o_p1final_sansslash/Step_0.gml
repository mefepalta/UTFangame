// Sinematik kesik: kendi omrunu sayiyor, once tam parlak duruyor sonra
// soluyor. Carpisma ve rastgele boy oynamasi burada YOK.
if (scripted)
{
	omur += 1;
	if (anim)
	{
		// Sprite'in kendi animasyonu bir kez oynuyor; son karede bitiyor.
		if (omur > 3) and (floor(image_index) >= sprite_get_number(sprite_index)-1)
		{
			instance_destroy();
		}
	}
	else
	{
		image_alpha = (omur < parla) ? 1 : max(0,1-(omur-parla)/max(1,sure-parla));
	}
	if (omur >= sure) { instance_destroy(); }
	exit;
}

image_yscale = random_range(0.9,1.1);
if (place_meeting(x, y, battle_soul))
{
	if (global.kr)
	{
		if (!instance_exists(hurtkr)) { instance_create_depth(0, 0, 0, hurtkr); }
	}
	else
	{
		// FAZ 2 -- klasik hasar. Eskiden burada global.kr kontrolu yoktu:
		// KR kapali olsa bile kesik hurtkr uretiyordu.
		Battle_HurtNormal(DMG_SLASH);
	}
}
