/// @description Game Over yazisi -- kurulum

depth = -30;

// Eskiden zamanlama current_time (duvar saati) uzerinden yuruyordu; oyun
// takildiginda ya da odaya gec girildiginde yazi sahneden kayiyordu.
// Artik o_gameover_heart'in kare sayacina bagli, yani her zaman ayni yerde.
line       = "time's up.";
char_speed = 3;      // kare / harf
shown      = 0;
t          = 0;
started    = false;

prompt_a   = 0;      // "devam" isareti
blink      = 0;
