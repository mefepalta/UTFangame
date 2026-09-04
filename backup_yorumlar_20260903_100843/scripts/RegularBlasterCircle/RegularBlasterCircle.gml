function RegularBlasterCircle(Xcirc,Ycirc,CircSpeed,CenterDistance,BFreq,BSpeed,BLDurability,BLCooldown,BScale,EndTime){
	
	circle_setup = instance_create_depth(0,0,0,battle_blaster_circle_setup)
	circle_setup.x_ = Xcirc
	circle_setup.y_ = Ycirc
	circle_setup.blaster_speed = CircSpeed
	circle_setup.frequency_ = BFreq 
	circle_setup.blastspeed = BSpeed
	circle_setup.blastdurab = BLDurability
	circle_setup.distance_ = CenterDistance
	circle_setup.blastcoold = BLCooldown
	circle_setup.xscale = BScale
	circle_setup.end_circle_timer = EndTime
	
	return circle_setup;
}