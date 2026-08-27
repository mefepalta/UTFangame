///@desc FINAL PHASE Sans -- s_p25_* parcalarindan kuruluyor
//==========================================================================
// Faz 2 bittikten sonra (Papyrus ve Alphys dagildiktan sonra) sahnede
// yalniz kalan, yaralanmis Sans. Motorun battle_enemy_engage'i faz 2
// Sans'ini (p2_* parcalari) ciziyor; bu nesne onu gizleyip yerine
// s_p25_* parcalarini ciziyor. Ayni zamanda Final Phase'in olum
// sahnesini de bu nesne suruyor (bkz. Step_0).
//
// PARCA OFSETLERI "Sprite Sheets/P35.webp" sayfasindaki BIRLESIK
// referans figurden olculdu (sag alt). Referans, proje sprite'larinin
// 1/3 olceginde; asagidaki degerler proje birimine cevrilip ayak
// noktasina goreli yazildi, sonra 0.4 ekran olcegiyle carpildi.
// Olcum dogrulamasi (siluet profili, proje birimi):
//     referans gen 375 / yuk 405   ->  bu montaj gen 357 / yuk 411
//     kafa ust satiri  ref x 168-231  ->  montaj 167-231
//     omuz hizasi      ref %34        ->  montaj %34
//
// Onceki hal room_p25'teki yerlesimden turetilmisti ve figuru fazla uzun
// yapiyor, kollari da govdenin arkasinda birakiyordu (parcalar "cikik"
// duruyordu). Referans montajinda omuzluklar govdenin iki yanindan
// disari tasiyor -- figurun en genis yeri boyunun 0.87'si.
//
// Referans montajda pelerin govdenin arkasinda kaldigi icin ilk kurulumda
// atlanmisti; artik en arkada ciziliyor.
// catch / flare / shine / soul / silhouette bu sahne icin gerekli degil.
//
// CIZIM SIRASI: pelerin -> bacaklar -> govde -> kollar -> atki -> kafa
// (omuzluklar govdenin uzerine biniyor, kafa hepsinin onunde)
//==========================================================================

depth = DEPTH_BATTLE.ENEMY;

P25_OL = 0.4;			/// butun parcalarin ekran olcegi

// Ayak noktasina goreli ofsetler (ekran pikseli). Sprite'lar kendi
// origin'leriyle ciziliyor, o yuzden bunlar ORIGIN konumlari.
P25_BACAK_X = 0;    P25_BACAK_Y = 0;
P25_GOVDE_X = -43;  P25_GOVDE_Y = -121;
// Kollar referanstakinden 8 px ICERI alindi: birebir referans konumunda
// omuzlukla govde arasinda ince bir bosluk kaliyor (omuzlugun ic tarafi
// bos, govde oraya kadar uzanmiyor) ve parcalar "cikik" duruyor.
P25_SOLKOL_X = 28; P25_SOLKOL_Y = -112;
P25_SAGKOL_X = -34;  P25_SAGKOL_Y = -112;
P25_KAFA_X = -33;   P25_KAFA_Y = -170;
// Atki boyun/omuz hizasinda, kafaya goreli konumu room_p25 yerlesiminden
// alindi (atki origin'i kafa origin'inin 35 sag, 60 asagisinda).
P25_ATKI_X = -17;     P25_ATKI_Y = -110;
// Pelerin. room_p25 yerlesiminde pelerin ile atki AYNI noktaya konuyor
// (ikisi de 320,172); origin'leri farkli oldugu icin sprite'lar farkli
// yerlere oturuyor ama cizim noktasi ayni. Bu yuzden baslangic degeri
// atkiyla ayni -- ayri sabit ki bagimsiz ayarlanabilsin.
P25_PELERIN_X = 0;  P25_PELERIN_Y = -111;

kafa = 0;				/// kafa ifadesi (s_p25_head kare no)
						///   0 = iki goz de kizil (hala direniyor)
						///   1 = tek gozu sonmus
						///   2 = kizil ama sonuk
						///   3 = gozler sonmus, notr
						///   4 = gozler sonmus, yorgun
						///   5 = gozler kapali (tukenmis)
govde_yarali = false;	/// son darbeden sonra govde s_p25_body_hurt oluyor
alfa = 1;				/// solma icin (1 = tam gorunur)
bob = 0;				/// nefes salinimi sayaci

//--------------------------------------------------------- olum sahnesi
// Sahneyi global.p25phase surukluyor (bkz. scripts/P25 ve
// battle_enemy_engage/Other_15):
//   1 = final phase, ataklar suruyor (Sans gercekten hasar aliyor)
//   2 = yenildi, olum konusmasi bekliyor
//   3 = olum konusmasi bitti (oyuncu tekrar vurabilir / CHECK / MERCY)
//   4 = son vurus yapildi, veda konusmasi bekliyor
//   5 = veda bitti, Sans ekrandan cikiyor
//   6 = cikti, dusman slotu bosaltildi (savas bitiyor)
yuru_x = 0;				/// ekrandan cikarken uygulanan yatay kayma
yuru_hiz = 0;			/// cikis hizi (yavas yavas hizlaniyor)
