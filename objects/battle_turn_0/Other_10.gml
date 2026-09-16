
battle_enemy_engage._wiggle = true;

battle_board.visible=false
battle_board.alpha_bg=0
battle_soul.visible=false

Battle_SetBoardSize(65,65,130,130);

// Diger butun battle_turn_N/Other_10'lar bunu sifirliyor, burasi eksikti.
// battle_enemy_engage/Step_0 bu bayrak true iken battle_dialog_enemy'yi HER
// KAREDE yok ediyor. Faz 1'in son turunda esya kullanilmis / Check yapilmissa
// bayrak faz 2'ye true olarak tasiniyor, yukaridaki monolog balonu daha
// olusur olusmaz siliniyor, icindeki {script testScript} hic calismiyor ve
// yukarida gizlenen tahta (visible=false) bir daha acilmiyordu. Sonuc:
// gorunmez ataklar, kutu yok, oyuncu kor hasar yiyor.
global.checkornot = false;
