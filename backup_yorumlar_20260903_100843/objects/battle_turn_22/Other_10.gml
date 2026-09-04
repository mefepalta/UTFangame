///@desc Turn Preparation Start
//==========================================================================
// FINAL PHASE -- 2. tur
//==========================================================================
// Diyalog "Discord Sans Rewrite" belgesinin Final Phase bolumunden.
// Bu bolumde Sans'in ataklari bilerek yavas ve seyrek: belgede
// "sans' attacks get slower, and you are able to hit him for real.
//  It's a very easy fight." diyor.
//==========================================================================
Battle_SetBoardSizeCubic(65,65,150,150);

// Yaralanmis Sans (s_p25_* parcalari) sahnede KALICI: turlar arasinda,
// menudeyken de gorunmesi gerektigi icin tur nesnesine bagli degil,
// bir kere yaratilip birakiliyor. Faz 2 Sans'ini kendisi gizliyor.
P25Sahneye();
if (instance_exists(o_p25_battle)) and (global.p25phase <= 2) { o_p25_battle.kafa = 2; }

global.checkornot = false;

// Sans yenildiyse bu turun atak repligi soylenmiyor: sirada olum
// sahnesi var ve onun balonunu P25Sahne aciyor.
if (global.p25phase <= 2)
{
	sansy = instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = "{speaker 0}{font 3}{voice 3}Is that... the best...&you got?";
}
