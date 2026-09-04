menucounter = 3;
audio_play_sound(snd_menu,1,true);

options_opened = false;
global.in_options = false;

global.transition_alpha = 0;
transitioning = false;

main_selected = 0;
options_selected = 0;

// ---------------------------------------------------------------------
// Presentation.
// This object now draws the whole menu column (labels + soul) so that it
// can sit on top of the fog and get a proper selection highlight.
// depth 50 = in front of the fog / items, still behind o_transition.
// ---------------------------------------------------------------------
depth = 50;

menu_t     = 0;
menu_objs  = [o_menuitems_credits, o_menuitems_extras, o_menuitems_options, o_menuitems_play];
item_dx    = [0, 0, 0, 0];

col_a = 1;

logo_base_y  = -1;
spear_base_y = -1;

// visible area (this room runs a 320x240 camera at 160,120)
vx_ = 0;
vy_ = 0;
vw_ = room_width;
vh_ = room_height;

snow = [];
