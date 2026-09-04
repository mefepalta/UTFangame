function RegularBlaster(Xstart,Ystart,Xtarget,Ytarget,AngleStart,AngleTarget,BlastDuration,BlastCooldown,XScale,YScale,BlasterSpeed){
	blaster = instance_create_depth(Xstart,Ystart,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,battle_gasterblaster)
	blaster.x = Xstart
	blaster.y = Ystart 
	blaster._target_x = Xtarget
	blaster._target_y = Ytarget
	blaster.image_angle = AngleStart
	blaster._target_angle = AngleTarget
	blaster._blast_cooldown = BlastCooldown
	blaster._blast_duration = BlastDuration
	blaster.image_yscale = XScale
	blaster.image_xscale = YScale
	blaster.BlasterDuration = BlasterSpeed
	return blaster;
}