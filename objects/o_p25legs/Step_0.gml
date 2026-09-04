if (!variable_global_exists("bob_timer")) {
    global.bob_timer = 0;
}
global.bob_timer += 0.01;

var bob = sin(global.bob_timer) * 0.005;
y = base_y + bob;

var stretch = cos(global.bob_timer) * 0.05;
image_yscale = 0.4 + stretch/4;