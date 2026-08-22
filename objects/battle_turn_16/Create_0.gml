_timer=0;
_start=false;
cang=false;
canga=0;

// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey (yesil kemik dahil) arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// --- Phase 2: devir teslim sahnesi ---
// Bu turda saldiri yok. Ruh sabitleniyor, kisa bir bekleyisten sonra diyalog
// basliyor; bitince Sans ile Papyrus sahneden ayrilip Alphys kaliyor.
phase2_text="";
dialog_started=false;
