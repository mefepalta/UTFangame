event_inherited()
if (Battle_GetState() == 3 && moveable){
	if Input_IsHeld(INPUT.UP)
		dir = 0
	if Input_IsHeld(INPUT.DOWN)
		dir = 1
	if Input_IsHeld(INPUT.LEFT)
		dir = 2
	if Input_IsHeld(INPUT.RIGHT)
		dir = 3
}
if (Battle_GetState() == 3 && moveable)
{
	var SPD = Player_GetSpdTotal()
	SPD = (Input_IsHeld(5) ? (SPD / 2) : SPD)
	repeat (SPD * 10)
	{
		if (dir == 0){
			if (!position_meeting(x, (y - (sprite_height / 2)), block))
				y -= 0.1
        }
        if (dir == 1)
        {
            if (!position_meeting(x, (y + (sprite_height / 2)), block))
                y += 0.1
        }
        if (dir == 2)
        {
            if (!position_meeting((x - (sprite_width / 2)), y, block))
                x -= 0.1
        }
        if (dir == 3)
        {
            if (!position_meeting((x + (sprite_width / 2)), y, block))
                x += 0.1
        }
    }
}