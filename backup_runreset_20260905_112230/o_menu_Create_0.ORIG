menucounter = 3;
audio_play_sound(snd_menu,1,true);

options_opened = false;
global.in_options = false;

global.transition_alpha = 0;
transitioning = false;

main_selected = 0;
options_selected = 0;

depth = 50;

menu_t     = 0;
menu_objs  = [o_menuitems_credits, o_menuitems_extras, o_menuitems_options, o_menuitems_play];
item_dx    = [0, 0, 0, 0];

col_a = 1;

logo_base_y  = -1;
spear_base_y = -1;

vx_ = 0;
vy_ = 0;
vw_ = room_width;
vh_ = room_height;

snow = [];

next_room = room_area_beforesans;

extras_index = 0;
extras_a     = 0;
extras_t     = 0;
extras_deny  = 0;

extras_rooms  = [room_battle, room_battle_1];
extras_phases = [0, 2];

StartRun = function(_target)
{
	global.sanstalk = 0;
	global.finalstretch = 0;
	global.sansphase = 0;
	global.surrender_turn = false;
	global.surrender_son = false;
	global.checkornot = false;
	global.p1sanshp = false;
	global.p2_revived_pap = false;
	global.p2_revived_alp = false;
	global.p25phase = 0;
	global.p25_dlg = false;
	global.p25_iska = false;
	global.p25_t = 0;
	global.p25_kacis = 0;

	Flag_Clear(FLAG_TYPE.STATIC);
	Flag_Clear(FLAG_TYPE.DYNAMIC);
	Flag_Custom();

	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.ROOM,_target);
	Player_Save(0);
};
