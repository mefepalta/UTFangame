target_y = y;
move_speedy = 0.05;
image_speed = 0;
image_alpha = 1;
image_index = 21;
depth = -99999;

// s_p1final_sansfall_1 TEK kareye indirildi (eskiden 22 karelik bir
// animasyondu ve aradaki pozlar inise uymuyordu). Bu yuzden asagidaki
// "image_index 0 olunca yok ol" kurali artik ilk karede tetiklenirdi:
// manuel true iken tur nesnesi hem hareketi hem de silmeyi ustleniyor.
manuel = false;
