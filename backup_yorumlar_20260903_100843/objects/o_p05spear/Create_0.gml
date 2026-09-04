// =====================================================================
//  Mizrak dususu
//  Eskiden 15 kare boyunca sabit hizla (yspd = 12) asagi kayiyordu.
//  Simdi: yukarida sarj -> ivmelenerek dusus -> tam 2730'da carpma.
//  Inis karesi sabit tutuldu, cunku o_shine'in beyaz flasi ve
//  snd_shine de 2730'da tetikleniyor.
// =====================================================================
image_xscale = 2;
image_yscale = 2;

base_x  = x;            // 320
start_y = -300;
land_y  = 116;          // eski bitis konumu (-64 + 15*12) korundu

fall_start = 2703;      // dususe baslama adimi
fall_steps = 27;        // 2703 + 27 = 2730 -> carpma

pure_y = start_y;       // sarsintisiz konum; y = pure_y + global.p05_sy
y = start_y;
state  = 0;             // 0 gizli, 1 sarj, 2 dusus, 3 saplandi
fall_t = 0;
charge = 0;
land_t = 0;
fall_speed  = 0;
image_alpha = 0;

trail = [];             // dusus izi (son konumlar)

COL_SPEAR = make_colour_rgb(255, 96, 220);
