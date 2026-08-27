///@desc Turn Preparation Start
//==========================================================================
// FINAL PHASE -- 1. tur
//==========================================================================
// Diyalog "Discord Sans Rewrite" belgesinin Final Phase bolumunden.
// Bu bolumde Sans'in ataklari bilerek yavas ve seyrek: belgede
// "sans' attacks get slower, and you are able to hit him for real.
//  It's a very easy fight." diyor.
//==========================================================================
Battle_SetBoardSizeCubic(65,65,150,150);

// FINAL PHASE burada basliyor: yaralanmis Sans sahneye giriyor, faz 2
// Sans'i ve blok sprite'i kapaniyor, Sans'in DEF/can degerleri
// belgedeki final phase degerlerine cekiliyor ve artik GERCEKTEN hasar
// aliyor (bkz. scripts/P25). Ikinci kez cagrilirsa hicbir sey yapmiyor.
P25Sahneye();
if (instance_exists(o_p25_battle)) and (global.p25phase <= 2) { o_p25_battle.kafa = 0; }

global.checkornot = false;

// Sans yenildiyse bu turun atak repligi soylenmiyor: sirada olum
// sahnesi var ve onun balonunu P25Sahne aciyor.
if (global.p25phase <= 2)
{
	sansy = instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = "{speaker 0}{font 3}{voice 3}Th-... that's right...{pause}{clear}I'm... not done...&with you yet!{pause}{clear}What... What's the&matter...?{pause}{clear}Come on, I still got&some fight left in&me...!";
}
