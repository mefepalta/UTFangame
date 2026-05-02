surface_set_target(Battle_GetBoardSurface());{
	draw_self();
}surface_reset_target();
if(image_alpha==1){
	draw_sprite_ext(spr_battle_menu_fight_aim,0,_aim_x,y,_aim_scale,_aim_scale,0,_aim_color,_aim_alpha);
	draw_sprite_ext(spr_battle_menu_fight_aim,!_currenthit,_aim_x2,y,_aim_scale2,_aim_scale2,0,_aim_color2,_aim_alpha2);
}