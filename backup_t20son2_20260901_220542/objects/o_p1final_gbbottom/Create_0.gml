image_alpha = 0;
depth = -99999;

// BLASTER AGZI: s_p1final_gbtop'un 3 karesi agiz acma degil CATLAMA
// kareleri. Agiz, alt ceneyi menteserinden (origin sag-ust) asagi
// dondurerek aciliyor. agiz = acilma acisi (derece).
agiz = 0;

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
