image_speed = 0;
image_alpha = 0;
depth = -99999;
target_y = y;
target_x = x;
move_speedy = 0.05;
move_speedx = 0.025;

// Faz 1'in son atagi yeniden yazildi: bu nesne artik sahneyi kendisi
// zamanlamiyor, battle_turn_20 suruyor. manuel true iken asagidaki
// p1finalattackval zinciri calismaz.
manuel = false;

// KAPANIS SAHNESI: slash'tan sonra parcalar birbirinden ayrilip kendi
// hizlariyla dusuyor. serbest true iken bu nesne artik rig'e bagli degil.
serbest = false;
v_t = 0;
vx = 0;
vy = 0;
vd = 0;			/// sabit donme (derece/kare)
sal = 0;		/// donme yerine salinim (derece); 0 ise vd kullanilir
sal_hiz = 4;
yerc = 0.30;	/// yercekimi
