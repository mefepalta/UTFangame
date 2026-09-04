image_alpha = 0;
image_speed = 1;
x_origin = x;
shake_time = 0;
shake_strength = 25;
shakemoment = false;

// Blok sprite'i odaya sabit konumda konmustu (Sans'in x'i hep 320 oldugu icin
// sorun olmuyordu). Phase 2'de hizalama Sans'i 180/133'e kaydirabiliyor; o
// zaman blok yerinde kalip Sans ortaya isinlanmis gibi gorunuyordu.
// Odadaki yerini Sans'a gore bir ofset olarak saklayip onu takip ediyoruz.
x_offset = x - 320;		// 320 = battle_enemy_engage.x (sabit)