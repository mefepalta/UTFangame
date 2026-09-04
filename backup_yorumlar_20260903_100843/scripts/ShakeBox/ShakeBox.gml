function ShakeBox(Amount , Speed , Decrease){
	var shaker_box = instance_create_depth(0,0,0,obj_box_shaker);
		shaker_box.ShakeAmount = Amount;
		shaker_box.ShakeSpeed = Speed;
		shaker_box.ShakeDecrease = Decrease;
		
	return shaker_box;
}