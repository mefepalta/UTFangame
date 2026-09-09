if (!variable_global_exists("p05_sx")) { global.p05_sx = 0; global.p05_sy = 0; }

bob += 0.05;

x = base_x + global.p05_sx;
y = base_y + global.p05_sy + sin(bob) * 0.8;
