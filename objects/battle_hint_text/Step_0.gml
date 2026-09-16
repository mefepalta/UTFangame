t += 1;
if (t >= life-20)
{
	alpha = max(0,alpha-0.05);
}
if (t >= life) { instance_destroy(); }

if (Battle_GetState() != BATTLE_STATE.IN_TURN) and (Battle_GetState() != BATTLE_STATE.TURN_PREPARATION)
{
	instance_destroy();
}

var _w = max_w;
if (mode == 0) and (instance_exists(battle_board))
{
	_w = battle_board.left+battle_board.right-pad*2;
}
Hazirla(_w);

if (mode == 0) and (instance_exists(battle_board))
{
	x = battle_board.x;
	y = battle_board.y-battle_board.up-8-line_h*array_length(lines)/2;
}
else if (mode == 1) and (instance_exists(battle_soul))
{
	x = battle_soul.x;
	y = battle_soul.y-18-line_h*array_length(lines)/2;
	if (instance_exists(battle_board))
	{
		var _yari = 0;
		for (var _i = 0; _i < array_length(lines); _i++) { _yari = max(_yari,string_width(lines[_i])*sc/2); }
		x = clamp(x,battle_board.x-battle_board.left+_yari+2,battle_board.x+battle_board.right-_yari-2);
		if (y-line_h*array_length(lines)/2 < battle_board.y-battle_board.up+2)
		{
			y = battle_soul.y+18+line_h*array_length(lines)/2;
		}
	}
}
else if (mode == 2)
{
	if (takip != noone)
	{
		if (!instance_exists(takip)) { instance_destroy(); exit; }
		hx = takip.x;
		hy = takip.y;
		if (variable_instance_exists(takip,"fade")) { alpha = min(alpha,takip.fade); }
	}
	x = hx+ok_dx;
	y = hy+ok_dy;
	if (takip != noone)
	{
		x = clamp(x,60,580);
		y = clamp(y,16,300);
	}
	// Hedef ekran disindayken (carousel daha gelmeden) cizme
	gizli = (hy < -10) or (hy > 490);
}
