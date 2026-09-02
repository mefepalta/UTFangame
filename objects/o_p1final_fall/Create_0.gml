p1finalattack = false;
p1finalattackval = 0;
target_y = y;
move_speedy = 0.05;
image_speed = 0;
image_alpha = 0;
depth = -99999;

// Atak 20'nin yeni acilisi ziplama animasyonu yerine ayak vuruslarini
// gosteriyor; ama bu nesnenin SAYACI (p1finalattackval) sahnenin geri
// kalanini tetikledigi icin calismaya devam etmesi gerekiyor
// (o_p1final_gbtop 470. karede bunu bekliyor). gizli = true iken sayac
// isler ama sprite cizilmez.
gizli = false;
