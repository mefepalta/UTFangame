var DIALOG=battle._dialog[0];

if(instance_exists(DIALOG)){
	var SLOT=Battle_ConvertEnemySlotToMenuChoiceEnemy(enemy_slot);
	var X=450;
	var Y=battle_board.y-battle_board.up+25+32*SLOT;
	draw_sprite_ext(spr_pixel,0,X,Y-5,width,23,0,c_red,1);
	draw_sprite_ext(spr_pixel,0,X,Y-5,width/hp_max*hp,23,0,c_yellow,1);
	draw_set_font(font_determination_sans);
	draw_set_color(c_white);
	
	/*if global.phase_number=1{
	    draw_text_transformed(X+101,Y+5,string(battle_enemy_engage._hp),0.5,0.5,0);
	}else if global.phase_number=2{
		draw_text_transformed(X+101,Y+5,string(battle_enemy_phase_2._hp),0.5,0.5,0);
	}else if global.phase_number=3{
		draw_text_transformed(X+11,Y+5,string(battle_enemy_phase_3._hp),0.5,0.5,0);
	}*/
		
	/*
	//Mercy Part
	var XM = 330;
	var YM = battle_board.y-battle_board.up+25+32*SLOT;
	draw_sprite_ext(spr_pixel,0,XM+120,YM-5,width2,23,0,c_orange,1);
	draw_sprite_ext(spr_pixel,0,XM+120,YM-5,width2/mercy_max*global.mercy,23,0,c_blue,1);
	draw_set_font(font_determination_sans);
	draw_set_color(c_white);
	draw_text_transformed(XM+125,YM-10,"MERCY%"+string(global.mercy),1,1,0);
    */
}
