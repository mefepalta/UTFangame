
function Win_Split_Init()
{
	if (variable_global_exists("tml_dll_ok")) { return global.tml_dll_ok; }

	global.tml_dll_ok = false;
	if (os_type != os_windows) { return false; }

	try
	{
		var _dll = "tml_win.dll";
		global.tml_f_ready   = external_define(_dll,"tml_win_ready",  dll_cdecl,ty_real,0);
		global.tml_f_find    = external_define(_dll,"tml_win_find",       dll_cdecl,ty_real,1,ty_string);
		global.tml_f_place   = external_define(_dll,"tml_win_place_found",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
		global.tml_f_topmost = external_define(_dll,"tml_win_topmost",dll_cdecl,ty_real,1,ty_real);
		global.tml_f_clip    = external_define(_dll,"tml_cursor_clip",dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
		global.tml_f_free    = external_define(_dll,"tml_cursor_free",dll_cdecl,ty_real,0);
		global.tml_f_inlock  = external_define(_dll,"tml_input_lock", dll_cdecl,ty_real,1,ty_real);

		global.tml_dll_ok = (external_call(global.tml_f_ready) == 1);
	}
	catch (_e)
	{
		global.tml_dll_ok = false;
	}

	return global.tml_dll_ok;
}

function Win_Split_SolYari()
{
	return { x: 0, y: 0, w: display_get_width() div 2, h: display_get_height() };
}

function Win_Split_OyunuSagaAl()
{
	var _dw = display_get_width();
	var _dh = display_get_height();
	var _yari = _dw div 2;

	if (window_get_fullscreen()) { window_set_fullscreen(false); }

	window_set_size(640,480);
	window_set_position(_yari + max(0,(_yari-640) div 2), max(0,(_dh-480) div 2));

	if (Win_Split_Init()) { external_call(global.tml_f_topmost,1); }
}

function Win_Split_TarayiciyiSolaAl(_metin)
{
	if (!Win_Split_Init()) { return false; }

	if (external_call(global.tml_f_find,_metin) != 1) { return false; }

	var _s = Win_Split_SolYari();
	return (external_call(global.tml_f_place,_s.x,_s.y,_s.w,_s.h) == 1);
}

function Win_Split_ImlecCak(_sx,_sy)
{
	display_mouse_set(_sx,_sy);
	if (!Win_Split_Init()) { return false; }
	return (external_call(global.tml_f_clip,_sx-1,_sy-1,2,2) == 1);
}

function Win_Split_GirdiKilidi(_on)
{
	if (!Win_Split_Init()) { return 0; }
	return external_call(global.tml_f_inlock,_on ? 1 : 0);
}

function Win_Split_Birak()
{
	if (!Win_Split_Init()) { return false; }
	external_call(global.tml_f_inlock,0);
	external_call(global.tml_f_free);
	external_call(global.tml_f_topmost,0);
	return true;
}
