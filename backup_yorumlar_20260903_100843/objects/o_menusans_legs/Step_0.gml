// Update global timer if not already done
if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.025;

// Bobbing movement
var bob = sin(global.bob_timer);
y = base_y + bob * 0.12;

// Stretch based on bobbing speed (differential)
var stretch = cos(global.bob_timer) * 0.006;
image_xscale = base_xscale - stretch * 0.5;
image_yscale = base_yscale + stretch;
