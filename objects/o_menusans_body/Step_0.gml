if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}

y = base_y + sin(global.bob_timer + 0.15) * 0.45;

with (o_menusans_legs)
{
	other.x = x + 13;
}
