var _dx = 0;
var _dy = move_y;

if (!bounce_x) {
    _dx = move_x;
} else {
    repeat(abs(move_x) * 10) {
        if (!place_meeting(x + sign(move_x) * 0.1, y, block)) {
            _dx += sign(move_x) * 0.1;
        } else {
            move_x = -move_x;
            break;
        }
    }
}

// Sticky takibi (sticky=1 için)
if (sticky && instance_exists(battle_soul)) {
    if (variable_instance_exists(battle_soul, "inst_plat") && battle_soul.inst_plat == id && battle_soul.jump_state == 0) {
	    if (battle_soul.inst_plat == id && battle_soul.jump_state == 0) {
	        battle_soul.x += _dx;
	        battle_soul.y += _dy;
	    }
	}
}

x += _dx;
y += _dy;