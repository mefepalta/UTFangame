event_inherited();

// Alphys'in mizragi. Davranis, Unitale modu "Alphys Alpha"nin Lua/Waves
// klasorundeki mizrak dalgalarindan BIREBIR aktarildi. Uc tur var ve ucu de
// oradaki bir dosyaya karsilik geliyor:
//
//   SPEAR_THRUST  spear4.lua / spear5.lua -- kenarda belirip telegraf
//                 boyunca hafifce kayan, sonra iceri sancilan mizrak
//   SPEAR_SPIRAL  spear2.lua -- kalbin etrafinda donerek icine kapanan halka
//   SPEAR_DIVE    spear0.lua -- cok uzakta belirip bekleyen, sonra kalbin
//                 uzerine dalan mizrak
//
// Butun sayilar moddaki haliyle kullaniliyor; cagiran script
// (Alphys_Spear) her dalganin degerlerini oradan birebir veriyor.

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;
sprite_index = spr_alphys_spear;
image_speed = 0;
image_index = 0;
image_alpha = 0;

kind = 0;

// Sprite'in ucu YUKARI bakiyor, o yuzden cizim acisi dir-90.
dir = 270;			/// gidis yonu (GM derecesi)
spd = 5;			/// atesten sonra kare basina yol

// --- Telegraf (spear4/spear5'teki "firing" sayaci) ---
warn_time = 60;	/// kac kare bekliyor
drift = 0.3;		/// telegraf boyunca kare basina gidis yonunde kayma
drift_max = 10;		/// toplam kayma siniri (0 = sinirsiz)
fade_in = 0.05;	/// telegraf boyunca kare basina alpha artisi (0 = bastan opak)

// --- Atesten sonra ---
run_len = 73;		/// bu kadar yol gidince sonmeye baslar
run_stop = true;	/// true ise o noktada DURUP soner, false ise sonerken devam eder
fade_out = 0.05;	/// kare basina alpha azalisi

dmg_alpha = 0.9;	/// bu alfanin altinda hasar vermiyor

// --- SPIRAL (spear2) ---
orb_x = 0;
orb_y = 0;
orb_rad = 180;
orb_shrink = 1.2;	/// kare basina yaricap azalisi
ang = 0;
ang_step = 2.35;	/// kare basina aci (derece), moddaki rad/2
ang_floor = 1;	/// acinin inebilecegi taban
ang_tick = 0.015;	/// aci sonumleme hizi
orb_dir = 1;
_ticker = 0;

// --- DIVE (spear0) ---
// Moddaki lifetime mantigi: negatif basliyor, her kare bulletspeed kadar
// artiyor, sifira gelince mermi harekete geciyor.
dive_life = -150;
dive_step = 5;
dive_fade = 637.5;	/// bu lifetime'da sonmeye basliyor
dive_kill = 825;	/// bu lifetime'da siliniyor

// spear1 telegraf boyunca mizragi DONDURUYOR (rotation += 9.3/kare) ve
// firlattiktan sonra acisini oldugu gibi birakiyor. spin sifir degilse
// image_angle gidis yonune baglanmaz.
spin = 0;
free_angle = false;

// --- AIM (spear3) ---
// Mizrak arena disinda beliriyor, once TERS bakiyor ve alfasi artarken
// yavasca kalbe donuyor. Alfa dolunca hizlanarak dogru cizgide gidiyor;
// yon dogus aninda kilitleniyor, takip etmiyor.
aim_now = 0;		/// su anki aci (ham sayi, sarma yok -- moddaki gibi)
aim_to = 0;		/// hedef aci
aim_ease = 10;		/// aciyi yaklastirma bolen (mod 10)
aim_sx = 0;		/// birim yon * 4 (mod: xdifference normalize * 4)
aim_sy = 0;
aim_vel = 1;		/// hiz carpani, her kare artiyor
aim_acc = 0.125;	/// mod 0.125
aim_out = 160;		/// bu mesafeyi asinca sonmeye basliyor
aim_toss = 20;		/// bu karede toss sesi (mod 20)

// Modda cogu dalga carpisan mizragi YOK ETMIYOR, sadece spear1 ediyor.
// dmg_kill false iken hasar yerinde veriliyor ve mizrak yoluna devam
// ediyor; global._inv zaten arka arkaya vurmayi engelliyor.
dmg_kill = false;

_t = 0;
_gone = 0;			/// atesten sonra gidilen yol
_fired = false;

// 'spawn' sesi burada DEGIL, cagiran fonksiyonda caliniyor: modda
// sadece spear4 ve spear5 bu sesi caliyor, spear0 ve spear2 sessiz doguyor.
