event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

// ---------------- AYARLAR ----------------
bolt_x   = battle_board.x;						/// yildirimin dusecegi sutun
follow_board = false;							/// kutu kayarken sutun da kaysin mi
bolt_off = 0;									/// kutu merkezine gore ofset
strike_y = battle_board.y + battle_board.down;	/// carpma noktasi (kutunun alt kenari)
warn_y   = strike_y - 14;						/// uyari isaretinin yeri

warn_time   = 60;		/// uyari kac kare gozukecek (1 saniye)
strike_time = 22;		/// yildirim kac kare kalacak
warn_blink  = 6;		/// uyari kac karede bir kare degistirecek
bolt_scale  = 1.6;		/// yildirimin buyuklugu (sprite 30x200)
warn_scale  = 1.4;		/// uyari isaretinin buyuklugu
bolt_width  = 13;		/// carpisma sutununun yari genisligi (olcek ile carpilir)
// -----------------------------------------

_state = 0;
_t = 0;

audio_play_sound(snd_warn,2,false);
