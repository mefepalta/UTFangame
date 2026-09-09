
depth = 0;

val_      = 0;
T_HURT    = 10;
T_EXIT    = 30;
T_CRACK   = 70;
T_HAND    = 176;
T_WHITE   = 200;
T_BURST   = 240;
T_NOISE_0 = 270;
T_NOISE_1 = 350;
T_LOGO    = 350;
T_TEXT    = 420;
T_READY   = 470;

home_x = room_width  * 0.5;
home_y = room_height * 0.5;

var _sx = Flag_Get(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_SOUL_X);
var _sy = Flag_Get(FLAG_TYPE.TEMP, FLAG_TEMP.GAMEOVER_SOUL_Y);
if (!is_real(_sx)) _sx = home_x;
if (!is_real(_sy)) _sy = home_y;
if (_sx < 24 || _sx > room_width  - 24) _sx = home_x;
if (_sy < 24 || _sy > room_height - 24) _sy = home_y;

start_x    = _sx;
start_y    = _sy;
soul_x     = start_x;
soul_y     = start_y;
soul_scale = 0;
soul_pulse = 1;
soul_frame = 0;
soul_alpha = 1;
tremble_x  = 0;
SOUL_SCALE = 2;

hand_t     = 0;
hand_snap  = 0;
hand_bob   = 0;

RING_X      = home_x;
RING_Y      = home_y - 16;
RING_RX     = 134;
RING_RY     = 62;
RING_SPD    = 0.60;
RING_OUT_RX = 245;
RING_OUT_RY = 135;
T_OUT       = 26;
T_HOLD      = 66;
T_IN        = 116;
orbit_t     = 0;

shake   = 0;
shake_x = 0;
shake_y = 0;

sparks  = [];
shards  = [];
embers  = [];
beams   = [];
bars    = [];
white_a = 0;
burst_done = false;
