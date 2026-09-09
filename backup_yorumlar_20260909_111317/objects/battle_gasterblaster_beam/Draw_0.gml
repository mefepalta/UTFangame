draw_self()

// battle_regularbone'daki global.show_hitbox anahtarinin isin karsiligi:
// acikken gercek carpisma bandi cizilen isinin uzerine yesil olarak biner,
// boylece pay gozle karsilastirilabilir.
if (variable_global_exists("show_hitbox")) and (global.show_hitbox)
{
	var _bant = BLASTER_ISIN_BANT * abs(image_yscale);
	var _oran = (_bant > 0) ? clamp(1 - (2 * BLASTER_HITBOX_PAY) / _bant, 0, 1) : 0;
	draw_sprite_ext(sprite_index, image_index, x, y,
	                image_xscale, image_yscale * _oran,
	                image_angle, c_lime, 0.6);
}
