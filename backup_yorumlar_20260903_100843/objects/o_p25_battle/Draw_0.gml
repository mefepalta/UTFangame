if (!instance_exists(battle_enemy_engage)) { exit; }
if (alfa <= 0) { exit; }

// Ayak noktasi: diyalog balonu da ayni noktaya hizalaniyor
// (battle_dialog_enemy/Step_0, SPEAKER 0 icin SPEAKER_X = p2_off_x),
// yani balon bu Sans'i dogru takip ediyor.
// y ise kutunun ust kenarina bagli (battle_enemy_engage/Step_0:
// ynew = (battle_board.y-battle_board.up)-10), yani ayaklar orada.
var _ax = battle_enemy_engage.x+battle_enemy_engage.p2_off_x+yuru_x;
var _ay = battle_enemy_engage.y;

// Nefes salinimi: kafa ve kollar bir birim, govde biraz daha az,
// bacaklar sabit duruyor.
var _b1 = sin(bob);
var _b2 = sin(bob)*0.7;

draw_sprite_ext(s_p25_cape  ,0,_ax+P25_PELERIN_X,_ay+P25_PELERIN_Y+_b2,P25_OL,P25_OL,0,c_white,alfa);
draw_sprite_ext(s_p25_legs  ,0,_ax+P25_BACAK_X ,_ay+P25_BACAK_Y     ,P25_OL,P25_OL,0,c_white,alfa);
// Son darbeden sonra yarali govde. s_p25_body_hurt normal govdenin tam
// 1/5 olceginde cizilmis (42x38 - 210x190), o yuzden olcek sprite
// genisliklerinin oraniyla duzeltiliyor; iki sprite'in da origin'i (0,0)
// oldugu icin sol-ust kosesi ayni yerde kaliyor.
var _gspr = govde_yarali ? s_p25_body_hurt : s_p25_body;
var _gol  = P25_OL*(sprite_get_width(s_p25_body)/sprite_get_width(_gspr));
draw_sprite_ext(_gspr       ,0,_ax+P25_GOVDE_X ,_ay+P25_GOVDE_Y +_b2,_gol  ,_gol  ,0,c_white,alfa);
draw_sprite_ext(s_p25_arm_1 ,0,_ax+P25_SOLKOL_X,_ay+P25_SOLKOL_Y+_b1,P25_OL,P25_OL,0,c_white,alfa);
draw_sprite_ext(s_p25_arm   ,0,_ax+P25_SAGKOL_X,_ay+P25_SAGKOL_Y+_b1,P25_OL,P25_OL,0,c_white,alfa);
draw_sprite_ext(s_p25_scarf ,0,_ax+P25_ATKI_X ,_ay+P25_ATKI_Y +_b1,P25_OL,P25_OL,0,c_white,alfa);
draw_sprite_ext(s_p25_head  ,kafa,_ax+P25_KAFA_X,_ay+P25_KAFA_Y +_b1,P25_OL,P25_OL,0,c_white,alfa);
