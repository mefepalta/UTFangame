if battle_menu_fight_burnt_pan.total_perfect_hit > 2{
	perfect="perfect"
}
if battle_menu_fight_burnt_pan.total_bad_hit > 3{
	perfect="bad"
}
if perfect = "perfect"{
	image_blend=make_color_rgb(211,255,100)
}else if perfect="normal"{
	image_blend=c_white
}else if perfect="bad"{
	image_blend=c_white ///you can change it to c_red if you want
}
if image_alpha = 0{
	instance_destroy()
}