_timer=0;
_start=false;
cang=false;
canga=0;

// Tur nesneleri varsayilan olarak depth 0'da; savas tahtasi -600'de cizildigi
// icin oraya cizilen her sey (yesil kemik dahil) arkada kaliyordu.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// --- Phase 2: yesil kemikle iyilestirme sahnesi ---
// Bu turda saldiri yok. Ruh sabitleniyor, Papyrus yesil bir kemik firlatiyor,
// kemik ruha ulasinca can doluyor ve ANCAK ONDAN SONRA diyalog basliyor.
phase2_text="";
bone_on=false;
bone_x=0;
bone_y=0;
bone_ang=0;		// gorsel donus (ruha bakmiyor, kendi etrafinda doner)
bone_dir=0;		// gidis yonu
bone_spin=7;	// derece/adim
heal_done=false;
heal_wait=0;
dialog_started=false;