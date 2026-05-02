time+=1;
if time = 1{
	a = instance_create_depth(0,0,0,shaker);
	a.target = id
	a.var_name = "board_shaker";
	a.shake_distance = ShakeSpeed
	a.shake_speed = ShakeSpeed
	a.shake_random = 0
	a.shake_decrease = ShakeDecrease
}
if time > 0{
	battle_board.angle = lerp(battle_board.angle,board_shaker,0.1)
}