function RegularBoneWall(dir,size,boneNumber,boneLength,wallX,wallY,warningDuration,boneDuration,papyrusMode,randomiseAngle,){
	bonewall = instance_create_depth(0,0,0,battle_regularbonewall)
	bonewall._dir = dir
	bonewall._width = size
	bonewall._bone_number = boneNumber
	bonewall._bone_length_target = boneLength
	bonewall._general_x = wallX
	bonewall._general_y = wallY
	bonewall._warning_time = warningDuration
	bonewall._bone_duration = boneDuration
	bonewall._papyrus_mode = papyrusMode
	bonewall._randomise_angle = randomiseAngle
	return bonewall;
}