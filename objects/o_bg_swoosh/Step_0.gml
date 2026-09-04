x += move_speed * dir;
image_angle += spin;

if (fade_in) {
    alpha += 0.05;
    if (alpha >= 1) fade_in = false;
} else {
    alpha -= 0.02;
}

image_alpha = alpha;

if (alpha <= 0) instance_destroy();