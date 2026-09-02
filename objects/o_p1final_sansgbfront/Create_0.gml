target_y = y;
target_x = x;
move_speedy = 0.05;
move_speedx = 0.025;
image_speed = 0;
isittimeyet = false;
depth = -99999;

// Faz 1'in son atagi yeniden yazildi: bu nesne artik sahneyi kendisi
// zamanlamiyor, battle_turn_20 suruyor. manuel true iken asagidaki
// p1finalattackval zinciri calismaz.
manuel = false;

// Havada suzulme: taban_y lerp ile hedefe gider, cizilen y ona ince bir
// sinus ekler. Lerp'in kendi sonucunu tekrar okumamasi icin taban ayri
// tutuluyor, yoksa salinim birikip kayardi.
taban_y = y;
suzul = 0;
suzul_hiz = 2.1;	/// derece / kare
suzul_genlik = 5;	/// piksel
