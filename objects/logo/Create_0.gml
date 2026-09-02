_hint=false;
_spear = false;
alarm[0]=200;
alarm[1]=201;
alarm[2]=400;

// ---------------------------------------------------------------------
// Title screen presentation. Timings above are untouched: the spear still
// starts at 201 and the hint still appears at 400.
// ---------------------------------------------------------------------
depth = 10;                 // this object paints the backdrop, behind the logo

fx_t        = 0;
hint_t      = 0;
logo_punch  = 1;
impacted    = false;
impact_t    = -1;
impact_x    = 320;
impact_y    = 210;
sparks      = [];

// visible rectangle (filled in every step)
vx_ = 0;
vy_ = 0;
vw_ = room_width;
vh_ = room_height;

dust  = [];
stars = [];
