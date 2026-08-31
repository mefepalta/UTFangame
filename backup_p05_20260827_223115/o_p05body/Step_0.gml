// One-time timer init (if not already set)
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.02;

// Actual bouncing
y = base_y + sin(global.bob_timer) * 0.7;

with (o_p05legs)
{
	other.x = x;
}
with (o_textcontroller_p05)
{
	if (p05 > 2705) and (p05 < 2725)
	{
		other.sprite_index = s_p05body_animation;
	}
	if (p05 > 2725)
	{
		other.image_index = 2;
		other.image_speed = 0;
	}
}
