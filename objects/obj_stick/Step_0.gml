if colour_turn = 0{
	image_blend=c_aqua
}
if colour_turn = 1{
	image_blend = c_red
}
if colour_turn = 2{
	image_blend = c_yellow
}
times++
if hit = "perfect"{
	if times%5=0{
		colour_turn+=1
	}
}
if colour_turn > 2{
	colour_turn=0
}
if hit = "bad"{
	colour_turn=1
}
if hit = "normal"{
	colour_turn=0
}