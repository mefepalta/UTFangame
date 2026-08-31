image_xscale = 2;
image_yscale = 2;

base_x = x;
base_y = y;

// Sarsintisiz "temiz" konum: govde ve kafa x'lerini bundan aliyor,
// ekran sallanmasi (global.p15_sx/sy) en sona ekleniyor.
pure_x = x;
pure_y = y;

x_origin = x;
shake_time = 0;
// Eskiden 15'ti; artik ayrica gercek bir ekran sarsintisi da oldugu icin
// govdenin kendi savrulmasi daha olculu.
shake_strength = 8;
