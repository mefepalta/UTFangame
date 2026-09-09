// Uyari cizgileri (kaynakta zarar vermeyen "mask" mermisi): targin nereye
// kadar gelecegini gosteriyor. Tahta yuzeyine cizilince kutu disina tasmiyor.
if (array_length(uyari) > 0)
{
	surface_set_target(Battle_GetBoardSurface());
	draw_set_color(c_white);
	draw_set_alpha(1);
	for (var _i = 0; _i < array_length(uyari); _i++)
	{
		var _u = uyari[_i];
		if (_u.dikey) { draw_rectangle(_u.x-1,_u.y-999,_u.x+1,_u.y+999,false); }
		else          { draw_rectangle(_u.x-999,_u.y-1,_u.x+999,_u.y+1,false); }
	}
	surface_reset_target();
}

// Sigara dumani (ara sahne). battle_turn_18'in ciziminin aynisi.
if (array_length(duman) > 0)
{
	for (var _di = 0; _di < array_length(duman); _di++)
	{
		var _dm = duman[_di];
		var _o  = _dm.t/_dm.omur;
		var _sc = 0.5+1.3*_o;
		var _al = 0.55*min(1,_o*6)*(1-_o)*(1-_o);
		draw_sprite_ext(spr_papyrus_smoke,0,_dm.x+14*_sc,_dm.y+12*_sc,_sc,_sc,0,c_white,_al);
	}
	draw_set_alpha(1);
}

// Kaynaktaki Misc.MoveCameraTo(10000,0) kesmesinin karsiligi: kamerayi
// oynatmak yerine ekran ayni sure boyunca karartiliyor. Yuzey boyutlandirmasi
// YOK, sadece tek dikdortgen -- bkz. surface_resize cokmesi notu.
if (kesme <= 0) { exit; }

var _cam = view_camera[0];
var _x = camera_get_view_x(_cam);
var _y = camera_get_view_y(_cam);
var _w = camera_get_view_width(_cam);
var _h = camera_get_view_height(_cam);

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(_x-4,_y-4,_x+_w+4,_y+_h+4,false);
draw_set_color(c_white);
