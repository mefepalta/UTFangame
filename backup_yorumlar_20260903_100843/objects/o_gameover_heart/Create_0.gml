/// @description Game Over sahnesi -- kurulum
//
// Eskiden bu nesne s_gameover_heart_1 (98 kare x 640x480, iki GIF'ten
// alinmis kare dokumu) sprite'ini oynatiyordu. Artik butun sahne
// Gaem_over sheet'inden dilimlenmis uc kucuk sprite ile koddan suruluyor:
//   s_go_soul  (72x72, 2 kare: saglam / catlak)
//   s_go_shard (44x50, 5 kare: kirik parcalar)
//   s_go_hand  (82x62, gaster eli)
// Sheet 1:1 olcekte GIF'in yarisi; SOUL_SCALE=2 ile birebir ayni buyuklukte.

depth = 0;

// ------------------------------------------------------------------
//  ZAMAN CIZELGESI (oyun 60 fps)
//  Eski ses ipuclari birebir korundu; gorsel olaylar artik onlara oturuyor.
// ------------------------------------------------------------------
val_      = 0;
T_HURT    = 10;    // snd_hurt    -- ruh belirir
T_EXIT    = 30;    // snd_exit
T_CRACK   = 70;    // snd_break_0 -- catlak
T_HAND    = 176;   // gaster eli yukselir
T_WHITE   = 200;   // beyaza gecis basi
T_BURST   = 240;   // snd_break_1 -- parcalanma
T_NOISE_0 = 270;   // snd_noise serisi basi
T_NOISE_1 = 350;   // snd_noise serisi sonu
T_LOGO    = 350;   // snd_gameover + "GAMES END" logosu
T_TEXT    = 420;   // yazi yazilmaya baslar
T_READY   = 470;   // oyuncu girisi kabul edilir

// ------------------------------------------------------------------
//  RUH
// ------------------------------------------------------------------
// battle_soul olum anindaki ekran konumunu FLAG_TEMP'e yaziyordu ama eski
// sahne bunu hic kullanmiyordu; artik ruh oldugu yerden ortaya suzuluyor.
home_x = room_width  * 0.5;
home_y = room_height * 0.5;

var _sx = Flag_Get(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_SOUL_X);
var _sy = Flag_Get(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_SOUL_Y);
if (!is_real(_sx)) _sx = home_x;
if (!is_real(_sy)) _sy = home_y;
if (_sx < 24 || _sx > room_width  - 24) _sx = home_x;
if (_sy < 24 || _sy > room_height - 24) _sy = home_y;

start_x    = _sx;
start_y    = _sy;
soul_x     = start_x;
soul_y     = start_y;
soul_scale = 0;      // giriste tasmali buyume
soul_pulse = 1;      // kalp atisi
soul_frame = 0;      // 0 = saglam, 1 = catlak
soul_alpha = 1;
tremble_x  = 0;      // catlaktan sonraki titreme (GIF'teki gibi kesikli)
SOUL_SCALE = 2;      // sheet, GIF'in yarisi olcekte

// ------------------------------------------------------------------
//  GASTER ELI
//  El bir enkaz parcasi degil: hicbir zaman donmuyor, dusmuyor. Yukselir,
//  ruhu ezerken bir kere kasilir ve sahnenin sonuna kadar parcalarin
//  altinda asili durur.
// ------------------------------------------------------------------
hand_t     = 0;      // yukselme (0..1)
hand_snap  = 0;      // ezme aninda asagi kasilma, soner
hand_bob   = 0;      // yavas nefes alma fazi

// ------------------------------------------------------------------
//  KIRIK PARCA YORUNGESI
//  GIF'teki hareket olculdu: parcalar once disari acilip ekranin
//  kenarlarinda asili kaliyor, sonra elin ustunde bir halkaya toplanip
//  orada suzulmeye devam ediyor. Ucus yercekimiyle degil, bu egriyle
//  suruluyor -- boylece nereye oturacaklari tam kontrol altinda.
// ------------------------------------------------------------------
RING_X      = home_x;        // halkanin merkezi -- elin USTUNDE
RING_Y      = home_y - 16;
RING_RX     = 134;           // halka eliptik: yatayda genis, dikeyde basik
RING_RY     = 62;            // logo (y~95) ile yazi (y~374) arasina sigiyor
RING_SPD    = 0.60;          // derece/kare  (~10 sn'de bir tur)
RING_OUT_RX = 245;           // disari acildiklarindaki yaricap
RING_OUT_RY = 135;
T_OUT       = 26;            // patlamadan sonra disari acilma biter
T_HOLD      = 66;            // kenarlarda asili kalma biter
T_IN        = 116;           // halkaya toplanma biter
orbit_t     = 0;             // patlamadan beri gecen kare

// sarsinti
shake   = 0;
shake_x = 0;
shake_y = 0;

// efekt havuzlari
sparks  = [];        // kirmizi kivilcimlar
shards  = [];        // kirik ruh parcalari (yorungede)
embers  = [];        // patlamadan sonra suzulen kul
beams   = [];        // patlama isinlari
bars    = [];        // parazit tarama cubuklari
white_a = 0;         // tam ekran beyaz
burst_done = false;
