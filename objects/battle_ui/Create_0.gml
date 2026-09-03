depth=DEPTH_BATTLE.UI;
x=30;
y=401;
hp_slow=0;
kr_slow=0;
text_slow=0;
outline_x=245-3
tp_slow=0;
ok=true;
hp_color=c_red;
ui_alpha=0;
// Hasar sistemi ODAYA gore secilir: faz 1 (room_battle) KARMA, faz 2
// (room_battle_1) klasik hasar. Bu satir eskiden kosulsuz true idi ve
// faz 2 odasi acilirken KR yolunu geri aciyordu.
// Ayrintilar: scripts/Macro_Battle -- "FAZ 2 -- NORMAL HASAR SISTEMI".
global.kr = (room != room_battle_1);
if (room == room_battle_1)
{
	// Faz 1'den kalan mor KR barini temizle: normal hasarda o bar ne
	// ciziliyor ne de eriyor, kalirsa can hesabi sapitiyor.
	Player_SetKr(0);
	Player_SetKrTimer(-1);
}