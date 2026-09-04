var DIALOG=battle._dialog[0];

if(instance_exists(DIALOG)){
	var SLOT=Battle_ConvertEnemySlotToMenuChoiceEnemy(enemy_slot);
	var X=450;
	var Y=battle_board.y-battle_board.up+25+32*SLOT;
	draw_sprite_ext(spr_pixel,0,X,Y-5,width,23,0,c_red,1);
	draw_sprite_ext(spr_pixel,0,X,Y-5,width/hp_max*hp,23,0,c_yellow,1);
	draw_set_font(font_determination_sans);
	draw_set_color(c_white);
	
		
}
