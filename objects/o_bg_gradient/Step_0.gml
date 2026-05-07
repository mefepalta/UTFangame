// Update global timer if not already done
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.01;

// Bobbing movement
var bob = sin(global.bob_timer) * 0.1; // move up/down
y = base_y + bob;

// Stretch based on bobbing speed (differential)
var stretch = cos(global.bob_timer) * 0.2; // ±0.1 scale
image_yscale = 1 + stretch;
if (room == room_battle_1)
{
		// Renk listesi: mor, turuncu, sarı
	var colors = [
	    make_color_rgb(180, 0, 255),  // mor
	    make_color_rgb(255, 100, 0),  // turuncu
	    make_color_rgb(255, 220, 0),  // sarı
	];

	// Her renkte kaç frame kalacak
	var Sspeed = 0.5; // azalt = yavaş geçiş, artır = hızlı geçiş
	var t = (global.bob_timer * Sspeed) mod 3;

	var idx = floor(t);           // hangi renkte olduğumuz (0, 1 ya da 2)
	var blend_t = frac(t);        // o renk içinde ne kadar ilerlediğimiz (0.0 - 1.0)
	var next_idx = (idx + 1) mod 3;

	var r = lerp(color_get_red(colors[idx]),   color_get_red(colors[next_idx]),   blend_t);
	var g = lerp(color_get_green(colors[idx]), color_get_green(colors[next_idx]), blend_t);
	var b = lerp(color_get_blue(colors[idx]),  color_get_blue(colors[next_idx]),  blend_t);

	image_blend = make_color_rgb(r, g, b);
}