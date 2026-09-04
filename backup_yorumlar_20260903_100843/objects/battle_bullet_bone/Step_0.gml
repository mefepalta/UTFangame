angle += rotate

/*if global.kr = false{
	if instance_exists(hurtkr){
		instance_destroy(hurtkr);
	}
}*/

if bottom = 3{
  y=battle_board.y+battle_board.down-length/2-5;
}
if bottom = 4{
  y=battle_board.y-battle_board.up+length/2+5;
}
if bottom = 5{
  y=battle_board.y+battle_board.down-length/2-5;
}
if bottom = 6{
  y=battle_board.y-battle_board.up+length/2+5;
}

animsin += mspd
x += (cos(animsin) * mx)
y += (sin(animsin) * my)

if(lenable){
	len_dir += len_dir_move
	len+=len_speed
	x = len_x + lengthdir_x(len,len_dir)    
	y = len_y + lengthdir_y(len,len_dir)
	if (len_angle){
		angle += len_dir_move
	}
}
image_blend = blend

if mode = 1{
	len_dir_move = 0.001
	//len_angle = 1
	len_x = 320
	len_y = 240
	lenable = 1
}