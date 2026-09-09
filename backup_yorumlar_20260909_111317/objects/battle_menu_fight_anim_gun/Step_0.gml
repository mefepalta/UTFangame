tmr++
if tmr > 10{
	if tmr%10=0{
		instance_create_depth(x,y+5,0,obj_circular_movement_sphere)
	}
}

if battle_menu_fight_empty_gun._aim_perfect = true{
	image_blend = make_color_rgb(255,255,100)
}else{
	image_blend = c_white
}