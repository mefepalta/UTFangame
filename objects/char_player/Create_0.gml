event_inherited();

global.canskip=true;
if (global.death_count > 0) and (room == room_area_0)
{
	x = 90;
	y = 160;
}
else if (!global.death_count > 0) and (room == room_area_0)
{
	x = 100;
	y = 140;
}
if (room == room_area_1)
{
	x = 650;
	y = 180;
	image_alpha = 0;
}
char_id=0;

_go=false;
_goes=0;
fuck_u=0;
go_bro=true;

res_idle_sprite[DIR.UP]=spr_char_frisk_up_dark;
res_idle_sprite[DIR.DOWN]=spr_char_frisk_down_dark;
res_idle_sprite[DIR.LEFT]=spr_char_frisk_right_dark;
res_idle_sprite[DIR.RIGHT]=spr_char_frisk_right_dark;
res_move_sprite[DIR.UP]=spr_char_frisk_up_dark;
res_move_sprite[DIR.DOWN]=spr_char_frisk_down_dark;
res_move_sprite[DIR.LEFT]=spr_char_frisk_right_dark;
res_move_sprite[DIR.RIGHT]=spr_char_frisk_right_dark;

moveable=true;
_moveable_dialog=true;
_moveable_menu=true;
_moveable_save=true;
_moveable_warp=true;
_moveable_encounter=true;
_moveable_box=true;