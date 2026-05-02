var LBlack = c_black
draw_set_font(font_mars_needs_cunnilingus);
draw_set_color(global.battleTheme);
draw_text_outlined(x,y,LBlack,global.battleTheme,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.NAME)+"   LV "+string(Player_GetLv()));
//draw_text(x,y,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.NAME)+"   LV "+string(Player_GetLv()));
draw_sprite_ext(spr_battle_ui_hp,0,x+211,y+2,1,1,0,global.battleTheme,1);
//draw_sprite_ext(spr_battle_ui_tp,0,x+481,y+2,1,1,0,c_white,1);
if global.kr = true{
draw_sprite_ext(spr_pixel,0,x+245-3,y-1-2,Player_GetHpMax()*1.25+6,21+4,0,LBlack,1);
draw_sprite_ext(spr_pixel,0,x+245,y-1,Player_GetHpMax()*1.25,21,0,c_red,1);
draw_sprite_ext(spr_pixel,0,x+245,y-1,hp_slow,21,0,make_color_rgb(255,255,50),1);

draw_sprite_ext(spr_pixel,0,x+245+hp_slow,y-1,kr_slow,21,0,make_color_rgb(255,40,255),1);

var colorkr=(Player_GetKr()<=0 ? c_white : make_color_rgb(255,40,255));
draw_set_color(colorkr);
draw_text_outlined(x+245+Player_GetHpMax()*1.25+14+32,y,LBlack,colorkr,string(round(text_slow))+" / "+string(Player_GetHpMax()));
draw_sprite_ext(spr_battle_ui_kr,0,x+247+Player_GetHpMax()*1.25+8,y+3,1,1,0,colorkr,1);

}else if global.kr = false{
//draw_sprite_ext(spr_pixel,0,x+245-3,y-1-2,Player_GetHpMax()*1.25+6,21+4,0,LBlack,1);
draw_sprite_ext(spr_pixel,0,x+245,y-1,Player_GetHpMax()*1.25,21,0,c_red,1);
draw_sprite_ext(spr_pixel,0,x+245,y-1,hp_slow,21,0,make_color_rgb(255,145,0),1);
//draw_sprite_ext(spr_pixel,0,x+515-3,y-1-2,global.tp_stamina_max*2+6,21+4,0,c_black,1);
//draw_sprite_ext(spr_pixel,0,x+515,y-1,global.tp_stamina_max*2,21,0,c_gray,1);
//draw_sprite_ext(spr_pixel,0,x+515,y-1,tp_slow*2,21,0,c_white,1);

draw_text_outlined(x+211+Player_GetHpMax()*1.25+14+32,y+2,LBlack,global.battleTheme,string(round(text_slow))+" / "+string(Player_GetHpMax()));
}

//draw_sprite_ext(spr_healthbar_mask,0,297,410,1,1,0,c_white,1);