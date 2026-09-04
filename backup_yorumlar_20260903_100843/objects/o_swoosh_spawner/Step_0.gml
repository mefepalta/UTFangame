spawn_timer++;

if (spawn_timer >= spawn_rate) {
    spawn_timer = 0;
    
    var rand_y = random(room_height); // ekranın herhangi bir yüksekliği
    
    // Soldan mı sağdan mı — rastgele seç
    if (irandom(1) == 0) {
        var s = instance_create_depth(0, rand_y, 0, o_bg_swoosh);
        s.from_left = true;
    } else {
        var s = instance_create_depth(0, rand_y, 0, o_bg_swoosh);
        s.from_left = false;
    }
    
    // Hızı da hafif rastgele yap — daha doğal görünür
    s.move_speed = 2 + random(3);
    s.spin = 2 + random(5);
}