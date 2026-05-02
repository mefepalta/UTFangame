// Update global timer if not already done
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.01;

// Bobbing movement
var bob = sin(global.bob_timer) * 0.005; // move up/down
y = base_y + bob;

// Stretch based on bobbing speed (differential)
var stretch = cos(global.bob_timer) * 0.05; // ±0.1 scale
image_yscale = 2 + stretch;