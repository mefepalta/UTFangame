target_y = y;
move_speedy = 0.05;
image_speed = 0;
image_alpha = 1;
// Sprite tek kare; eski 22 karelik halinden kalan 21 anlamsiz.
image_index = 0;
depth = -99999;

// s_p1final_sansfall_1 TEK kareye indirildi (eskiden 22 karelik bir
// animasyondu ve aradaki pozlar inise uymuyordu). Step'teki
// "image_index 0 olunca yok ol" kurali o animasyonun bitisini bekliyordu;
// tek karede image_index ODA ACILIR ACILMAZ 0, yani nesne daha sahneye
// cikmadan kendini siliyordu ve inis hic gorunmuyordu.
//
// manuel VARSAYILAN OLARAK ACIK: nesneyi zaten onu kullanan iki tur da
// (battle_turn_20 ve battle_skip_turn_0) isi bitince acikca siliyor.
manuel = true;
