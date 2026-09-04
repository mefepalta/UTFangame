event_inherited();

depth=DEPTH_BATTLE.BULLET;

ring_r=18;
spd_y=5;

//Vuruş alanı. Daire yerine eksen bazlı: yatay hizalanma ile dikey zamanlama
//birbirini kısıtlamasın diye ikisi ayrı ayrı toleranslı.
hit_x=32;
hit_y=36;

used=false;		//üstüne zıplandı mı
pop=1;			//kullanıldıktan sonraki patlama animasyonu (1 -> 0)
