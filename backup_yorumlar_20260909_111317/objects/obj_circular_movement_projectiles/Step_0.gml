counter++
if counter%10=0{
	image_bullet+=1
}
if image_bullet > 1{
	image_bullet=0
}

if counter = 20{
	instance_destroy(battle_menu_fight_anim_gun)
}

if counter > 10{
	if orbit_radius < 1{
		instance_destroy()
	}
}