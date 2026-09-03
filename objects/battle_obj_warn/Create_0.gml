w_time = 30;
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;
//x3 = noone;
//y3 = noone;
//x4 = noone;
//y4 = noone;
wtimer = 0;
colour = c_red;

//==========================================================================
//  KUTU KENARINA YAPISAN UYARI
//==========================================================================
//  battle_regularbonewall kendi kirmizi/sari seridini kendisi ciziyor.
//  Ama turlarin KENDI yazdigi kemik duvarlari (turn 10 LeftWall, turn 11
//  WallMake gibi) dogrudan RegularBone kullaniyor: sadece snd_exclamation
//  caliyor, serit hic cikmiyordu. Bu mod o serit isini bu nesneye veriyor.
//
//  follow_dir'e DIR.LEFT/RIGHT/UP/DOWN verilirse dikdortgen her kare
//  kutunun o kenarindan yeniden hesaplaniyor -- kutu kayarken ya da boyu
//  degisirken serit kemiklerle birlikte hareket ediyor. -1 = eski davranis
//  (x1..y2 sabit).
//==========================================================================
follow_dir   = -1;		/// -1 = sabit; DIR.* = kutunun o kenarina yapis
follow_thick = 0;		/// kenardan ice dogru kalinlik (kemik boyu kadar)
follow_pad   = 2;		/// kenar boyunca kacik (kemikler de 2 px iceride)

/// Uyari sesi. Kapali: bu seridi kullanan duvarlar zaten kendileri bir kez
/// snd_exclamation caliyor, ustune iki karede bir snd_warn calmak gurultu.
warn_sound = false;
