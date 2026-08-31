// One-time timer init (if not already set)
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.02;

// Actual bouncing
y = base_y + sin(global.bob_timer) * 0.7;

with (o_p15_legs)
{
	if (image_index == 1)
	{
		other.sprite_index = s_p15sanssheet_6;
	}
	else
	{
		other.sprite_index = s_p15sanssheet_1;
	}
	other.x = x;
}