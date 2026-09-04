if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.01;

var bob = sin(global.bob_timer) * 0.1;
y = base_y + bob;

var stretch = cos(global.bob_timer) * 0.2;
image_yscale = 1 + stretch;
if (room == room_battle_1)
{
	var colors = [
	    make_color_rgb(226,  20, 150),
	    make_color_rgb(249, 105,   0),
	    make_color_rgb(255, 196,  90),
	];

	var Sspeed = 0.5;
	var t = (global.bob_timer * Sspeed) mod 3;

	var idx = floor(t);
	var blend_t = frac(t);
	var next_idx = (idx + 1) mod 3;

	var r = lerp(color_get_red(colors[idx]),   color_get_red(colors[next_idx]),   blend_t);
	var g = lerp(color_get_green(colors[idx]), color_get_green(colors[next_idx]), blend_t);
	var b = lerp(color_get_blue(colors[idx]),  color_get_blue(colors[next_idx]),  blend_t);

	image_blend = make_color_rgb(r, g, b);
}