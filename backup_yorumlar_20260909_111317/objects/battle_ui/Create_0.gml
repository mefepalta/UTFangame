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
global.kr = (room != room_battle_1);
if (room == room_battle_1)
{
	Player_SetKr(0);
	Player_SetKrTimer(-1);
}