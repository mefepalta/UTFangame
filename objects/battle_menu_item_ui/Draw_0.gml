var color_shadow = make_color_rgb(1,0,0)
var colorr = c_white
if slot < 4
{
	draw_set_font(font_determination_mono_3)
	draw_text_transformed_color(battle_board.x-battle_board.left-5+40+252+1,battle_board.y-battle_board.up-5+36+28*2+1,"    PAGE 1",1,1,0,color_shadow,color_shadow,color_shadow,color_shadow,1)
	draw_text_transformed_color(battle_board.x-battle_board.left-5+40+252,battle_board.y-battle_board.up-5+36+28*2,"    PAGE 1",1,1,0,colorr,colorr,colorr,colorr,1)
}
else if slot >= 4
{
	draw_set_font(font_determination_mono_3)
	draw_text_transformed_color(battle_board.x-battle_board.left-5+40+252+1,battle_board.y-battle_board.up-5+36+28*2+1,"    PAGE 2",1,1,0,color_shadow,color_shadow,color_shadow,color_shadow,1)
	draw_text_transformed_color(battle_board.x-battle_board.left-5+40+252,battle_board.y-battle_board.up-5+36+28*2,"    PAGE 2",1,1,0,colorr,colorr,colorr,colorr,1)
}
//draw_text(480,0,string(slot))