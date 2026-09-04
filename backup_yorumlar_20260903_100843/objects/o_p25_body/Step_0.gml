// One-time timer init (if not already set)
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.02;

// Actual bouncing
y = base_y + sin(global.bob_timer) * 0.7;

with (o_p25legs)
{
	other.x = x - 42;
}

