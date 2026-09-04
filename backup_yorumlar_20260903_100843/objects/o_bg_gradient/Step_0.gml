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
	// Renk listesi. Eskiden mor(180,0,255) -> turuncu -> sari idi; mor ile
	// turuncu arasindaki gecis camurlu bir kahve/yesilden geciyordu.
	// Uculu de sicak tarafa cekildi: aradaki karisimlar temiz kaliyor ve
	// palet Faz 1.5'in korlariyla / Faz 2 gozunun turuncusuyla ortusuyor.
	var colors = [
	    make_color_rgb(226,  20, 150),  // magenta
	    make_color_rgb(249, 105,   0),  // turuncu (Faz 2 gozu)
	    make_color_rgb(255, 196,  90),  // altin
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