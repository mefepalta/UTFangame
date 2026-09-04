if (!variable_global_exists("p15_sx")) { global.p15_sx = 0; global.p15_sy = 0; }

if (image_alpha > 0.5) image_alpha = 0.5;

x = base_x + global.p15_sx * 0.5;
y = base_y + global.p15_sy * 0.5;
