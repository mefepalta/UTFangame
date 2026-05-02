///@arg Xk
///@arg Yk
///@arg Angk
///@arg Pausek
function MakeSpear(Xk,Yk,Angk,Pausek)
{		
	var kf = instance_create_depth(Xk,Yk,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2,knifes);
	kf.x = Xk;
	kf.y = Yk;
	kf.add_angle = Angk;
	kf.duration_knife = Pausek;
	return kf;
}
