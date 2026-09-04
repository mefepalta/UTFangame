if image_angle = target_angle{
    start_the_cooldown = true
}
if (start_the_cooldown){
	blast_cooldown-=1
}else{
	x=lerp(x,target_x,0.1)
    y=lerp(y,target_y,0.1)
    image_angle=lerp(image_angle,target_angle,0.1)
}
if blast_cooldown < 1{
	speed=25
	direction=target_angle
}