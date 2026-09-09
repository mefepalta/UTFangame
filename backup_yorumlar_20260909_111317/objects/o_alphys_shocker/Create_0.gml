event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

bolt_x   = battle_board.x;
follow_board = false;
bolt_off = 0;
strike_y = battle_board.y + battle_board.down;
warn_y   = strike_y - 14;

warn_time   = 60;
strike_time = 22;
warn_blink  = 6;
bolt_scale  = 1.6;
warn_scale  = 1.4;
bolt_width  = 13;

_state = 0;
_t = 0;

audio_play_sound(snd_warn,2,false);
