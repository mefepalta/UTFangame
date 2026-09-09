/// EKRANI IKIYE BOLME + IMLEC KILIDI  (tml_win.dll koprusu)
///
/// Papyrus'un "mola" ara sahnesi icin. GameMaker tek basina:
///   - baska bir uygulamanin (tarayicinin) penceresini tasiyamiyor,
///   - imleci sadece kare basina bir kez geri itebiliyor, bu yuzden hizli
///     hareket edilince imlec kacip oyunun disina cikabiliyor.
/// Ikisi de Win32 cagrisi gerektirdigi icin kucuk bir DLL yazildi.
///
/// Kaynak: dll_src/tml_win.c   Derleme (MSYS2 UCRT64):
///   gcc -shared -O2 -s -static-libgcc -o tml_win.dll tml_win.c -luser32
/// DLL datafiles/ altinda duruyor ve .yyp'nin IncludedFiles listesinde kayitli,
/// yani projedeki discord/console DLL'leriyle ayni yontem.

/// @desc DLL'i baglar. Basarisizsa false doner ve cagiran taraf DLL'siz
/// (sadece kendi penceresini tasiyan) yola dusmeli.
function Win_Split_Init()
{
	if (variable_global_exists("tml_dll_ok")) { return global.tml_dll_ok; }

	global.tml_dll_ok = false;
	if (os_type != os_windows) { return false; }

	try
	{
		var _dll = "tml_win.dll";
		global.tml_f_ready   = external_define(_dll,"tml_win_ready",  dll_cdecl,ty_real,0);
		// GameMaker 4'ten fazla argumanli DLL fonksiyonunda string kabul etmiyor,
		// o yuzden arama ve tasima ayri iki cagri.
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
		// DLL yuklenemedi: sahne yine oynuyor, sadece ekran bolme/imlec kilidi
		// devre disi (cagiran taraf false donusune gore davraniyor).
		global.tml_dll_ok = false;
	}

	return global.tml_dll_ok;
}

/// @desc Masaustunun sol yarisi (tarayici icin ayrilan alan).
function Win_Split_SolYari()
{
	return { x: 0, y: 0, w: display_get_width() div 2, h: display_get_height() };
}

/// @desc Oyun penceresini 1x (640x480) yapip SAG yarinin ortasina yerlestirir.
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

/// @desc Basliginda _metin gecen pencereyi (tarayici) sol yariya tasir.
/// Sayfa yuklenene kadar pencere baslgi olusmadigi icin cagiran taraf bunu
/// birkac kare boyunca tekrar denemeli. Donus: bulundu mu.
function Win_Split_TarayiciyiSolaAl(_metin)
{
	if (!Win_Split_Init()) { return false; }

	if (external_call(global.tml_f_find,_metin) != 1) { return false; }

	var _s = Win_Split_SolYari();
	return (external_call(global.tml_f_place,_s.x,_s.y,_s.w,_s.h) == 1);
}

/// @desc Imleci ekran koordinatindaki noktaya cakar.
///
/// HER KARE cagrilmali: Windows odak degistiginde ClipCursor kisitini
/// kendiliginden birakiyor. DLL yoksa display_mouse_set'e dusuyor -- o da
/// kare basina bir kez calistigi icin hizli hareketle asilabiliyor.
function Win_Split_ImlecCak(_sx,_sy)
{
	display_mouse_set(_sx,_sy);
	if (!Win_Split_Init()) { return false; }
	return (external_call(global.tml_f_clip,_sx-1,_sy-1,2,2) == 1);
}

/// @desc Alt+F4, Alt+Tab, Alt+Esc, Ctrl+Esc ve Win tuslarini engeller.
///
/// Ctrl+Alt+Del ENGELLENMIYOR -- Windows buna zaten izin vermiyor ve sistem
/// seviyesinde bir cikisin kalmasi bilerek tercih edildi.
function Win_Split_GirdiKilidi(_on)
{
	if (!Win_Split_Init()) { return 0; }
	return external_call(global.tml_f_inlock,_on ? 1 : 0);
}

/// @desc Imleci, girdi kilidini ve "en ustte" durumunu birakir.
function Win_Split_Birak()
{
	if (!Win_Split_Init()) { return false; }
	external_call(global.tml_f_inlock,0);
	external_call(global.tml_f_free);
	external_call(global.tml_f_topmost,0);
	return true;
}
