/* tml_win.dll -- TMLCookie Edit icin kucuk Windows pencere/imlec yardimcisi
 *
 * NEDEN VAR: Papyrus'un "mola" ara sahnesinde ekranin gercekten ikiye
 * bolunmesi isteniyor -- solda tarayicidaki YouTube videosu, sagda oyun.
 * GameMaker kendi penceresini tasiyabiliyor ama BASKA bir uygulamanin
 * penceresine dokunamiyor; ayrica imleci sadece kare basina bir kez geri
 * itebiliyor, bu da hizli hareket edince imlecin kacmasina yol aciyor.
 * Ayrica mola sirasinda oyuncunun Alt+F4 / Alt+Tab ile kacamamasi isteniyor;
 * o da pencere alt siniflama + dusuk seviye klavye kancasi demek.
 * Hepsi Win32 API cagrisi gerektirdigi icin bu DLL yazildi.
 *
 * Derleme (MSYS2 UCRT64):
 *   gcc -shared -O2 -s -static-libgcc -o tml_win.dll tml_win.c -luser32
 *
 * GameMaker tarafi: scripts/Win_Split (external_define ile baglaniyor).
 * DLL datafiles/ altinda, yani .yyp'de IncludedFiles kaydi var.
 */

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <string.h>

#define GMX __declspec(dllexport)

static HWND  g_found = NULL;
static HWND  g_self  = NULL;
static char  g_needle[256];
static DWORD g_pid   = 0;

static void lower_ascii(char *s)
{
	for (; *s; ++s)
	{
		if (*s >= 'A' && *s <= 'Z') { *s = (char)(*s + 32); }
	}
}

/* Ust duzey, gorunur, baslikli pencere mi? */
static BOOL usable(HWND hwnd)
{
	if (!IsWindowVisible(hwnd))          { return FALSE; }
	if (GetWindow(hwnd, GW_OWNER) != 0)  { return FALSE; }
	if (IsIconic(hwnd))                  { return FALSE; }
	return TRUE;
}

static BOOL CALLBACK cb_other(HWND hwnd, LPARAM lp)
{
	DWORD pid = 0;
	char  title[512];
	int   n;

	(void)lp;
	if (!usable(hwnd)) { return TRUE; }

	GetWindowThreadProcessId(hwnd, &pid);
	if (pid == g_pid) { return TRUE; }          /* kendi penceremiz olmasin */

	n = GetWindowTextA(hwnd, title, (int)sizeof(title));
	if (n <= 0) { return TRUE; }
	lower_ascii(title);
	if (strstr(title, g_needle) == NULL) { return TRUE; }

	g_found = hwnd;
	return FALSE;
}

static BOOL CALLBACK cb_self(HWND hwnd, LPARAM lp)
{
	DWORD pid = 0;
	if (!usable(hwnd)) { return TRUE; }
	GetWindowThreadProcessId(hwnd, &pid);
	if (pid != (DWORD)lp) { return TRUE; }
	g_self = hwnd;
	return FALSE;
}

static HWND self_window(void)
{
	g_self = NULL;
	EnumWindows(cb_self, (LPARAM)GetCurrentProcessId());
	return g_self;
}

/* GameMaker sinirlamasi: 4'ten fazla argumani olan DLL fonksiyonlari string
 * alamiyor. Bu yuzden arama ve tasima iki ayri cagriya bolundu; bulunan
 * pencere g_found'da saklaniyor.
 *
 * Basliginda verilen metni GECEN, bize ait olmayan ilk pencereyi arar.
 * Donus: 1 bulundu, 0 bulunamadi. Metin kucuk harfe cevrilerek aranir. */
GMX double tml_win_find(const char *title)
{
	g_found = NULL;
	g_pid   = GetCurrentProcessId();

	strncpy(g_needle, title ? title : "", sizeof(g_needle) - 1);
	g_needle[sizeof(g_needle) - 1] = '\0';
	lower_ascii(g_needle);

	EnumWindows(cb_other, 0);
	return (g_found != NULL) ? 1.0 : 0.0;
}

/* tml_win_find ile bulunan pencereyi verilen dikdortgene tasir.
 * Pencere buyutulmusse once eski boyutuna dondurulur. */
GMX double tml_win_place_found(double x, double y, double w, double h)
{
	WINDOWPLACEMENT wp;

	if (g_found == NULL || !IsWindow(g_found)) { return 0.0; }

	wp.length = sizeof(wp);
	if (GetWindowPlacement(g_found, &wp) && wp.showCmd == SW_SHOWMAXIMIZED)
	{
		ShowWindow(g_found, SW_RESTORE);
	}

	SetWindowPos(g_found, HWND_TOP, (int)x, (int)y, (int)w, (int)h,
	             SWP_NOACTIVATE | SWP_SHOWWINDOW);
	return 1.0;
}

/* Oyun penceresini en uste sabitler (1) ya da birakir (0). Boylece tarayici
 * odagi alsa bile oyun sag tarafta gorunur kaliyor. */
GMX double tml_win_topmost(double on)
{
	HWND self = self_window();
	if (self == NULL) { return 0.0; }

	SetWindowPos(self, (on >= 0.5) ? HWND_TOPMOST : HWND_NOTOPMOST,
	             0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE | SWP_NOACTIVATE);
	return 1.0;
}

/* Imleci verilen ekran dikdortgenine hapseder.
 * HER KARE cagrilmali: Windows odak degistiginde kisiti kendiliginden
 * birakiyor, tek seferlik cagri kacisa acik kaliyor. */
GMX double tml_cursor_clip(double x, double y, double w, double h)
{
	RECT r;
	r.left   = (LONG)x;
	r.top    = (LONG)y;
	r.right  = (LONG)(x + w);
	r.bottom = (LONG)(y + h);
	return ClipCursor(&r) ? 1.0 : 0.0;
}

GMX double tml_cursor_free(void)
{
	ClipCursor(NULL);
	return 1.0;
}

/* ------------------------------------------------------------------------
 * GIRDI KILIDI  (Alt+F4 / Alt+Tab / Win / Alt+Esc / Ctrl+Esc)
 *
 * Iki katman:
 *   1) Pencere alt siniflanip WM_CLOSE ve SC_CLOSE yutuluyor -> Alt+F4 ve
 *      baslik cubugundaki carpi is gormuyor.
 *   2) WH_KEYBOARD_LL kancasi Alt+Tab, Alt+Esc, Ctrl+Esc ve Win tuslarini
 *      yutuyor -> oyuncu baska pencereye gecemiyor.
 *
 * Ctrl+Alt+Del ENGELLENEMEZ (Windows buna izin vermiyor) ve bu bilerek
 * boyle birakildi: sistem seviyesinde her zaman bir cikis kalsin.
 *
 * DIKKAT: DLL bosaltilmadan once alt siniflama MUTLAKA geri alinmali,
 * yoksa pencere yok olmus bir fonksiyona zipliyor. DllMain DETACH bunu
 * garantiye aliyor.
 * --------------------------------------------------------------------- */

static HHOOK   g_kb_hook  = NULL;
static WNDPROC g_old_proc = NULL;
static HWND    g_sub_hwnd = NULL;
static int     g_block    = 0;

static LRESULT CALLBACK kb_proc(int code, WPARAM wp, LPARAM lp)
{
	if (code == HC_ACTION && g_block)
	{
		KBDLLHOOKSTRUCT *k = (KBDLLHOOKSTRUCT *)lp;
		BOOL alt = (k->flags & LLKHF_ALTDOWN) ? TRUE : FALSE;

		if (k->vkCode == VK_LWIN || k->vkCode == VK_RWIN)  { return 1; }
		if (k->vkCode == VK_TAB    && alt)                 { return 1; }
		if (k->vkCode == VK_ESCAPE && alt)                 { return 1; }
		if (k->vkCode == VK_F4     && alt)                 { return 1; }
		if (k->vkCode == VK_ESCAPE &&
		    (GetAsyncKeyState(VK_CONTROL) & 0x8000))       { return 1; }
	}
	return CallNextHookEx(g_kb_hook, code, wp, lp);
}

static LRESULT CALLBACK wnd_proc(HWND h, UINT m, WPARAM wp, LPARAM lp)
{
	if (g_block)
	{
		if (m == WM_CLOSE) { return 0; }
		if (m == WM_SYSCOMMAND && (wp & 0xFFF0) == SC_CLOSE) { return 0; }
	}
	return CallWindowProc(g_old_proc, h, m, wp, lp);
}

static void input_unlock(void)
{
	g_block = 0;

	if (g_kb_hook != NULL)
	{
		UnhookWindowsHookEx(g_kb_hook);
		g_kb_hook = NULL;
	}
	if (g_sub_hwnd != NULL && g_old_proc != NULL && IsWindow(g_sub_hwnd))
	{
		SetWindowLongPtrA(g_sub_hwnd, GWLP_WNDPROC, (LONG_PTR)g_old_proc);
	}
	g_sub_hwnd = NULL;
	g_old_proc = NULL;
}

/* 1 = kilitle, 0 = birak. Donus: kilitliyken kac katman aktif (0-2). */
GMX double tml_input_lock(double on)
{
	int kat = 0;

	if (on < 0.5)
	{
		input_unlock();
		return 0.0;
	}

	if (g_sub_hwnd == NULL)
	{
		HWND self = self_window();
		if (self != NULL)
		{
			g_old_proc = (WNDPROC)SetWindowLongPtrA(self, GWLP_WNDPROC, (LONG_PTR)wnd_proc);
			if (g_old_proc != NULL) { g_sub_hwnd = self; }
		}
	}
	if (g_sub_hwnd != NULL) { kat++; }

	if (g_kb_hook == NULL)
	{
		g_kb_hook = SetWindowsHookExA(WH_KEYBOARD_LL, kb_proc, GetModuleHandleA(NULL), 0);
	}
	if (g_kb_hook != NULL) { kat++; }

	g_block = 1;
	return (double)kat;
}

/* DLL'in yuklendigini dogrulamak icin. */
GMX double tml_win_ready(void)
{
	return 1.0;
}

BOOL WINAPI DllMain(HINSTANCE inst, DWORD reason, LPVOID reserved)
{
	(void)inst; (void)reserved;
	if (reason == DLL_PROCESS_DETACH)
	{
		ClipCursor(NULL);
		input_unlock();          /* alt siniflama MUTLAKA geri alinmali */
	}
	return TRUE;
}
