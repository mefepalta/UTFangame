// Bu nesne TAMAMEN BOSTU: Create ve Step olaylari bos, .yy'de sprite bile
// yok. Cagrildigi uc yerde (turn 18 / 19 / 20 -- mavi ruha gecis) ne ses ne
// parlama vardi; ustelik yaratilan gorunmez ornegi hicbir sey yok etmiyordu.
//
// Efekt nesnesi artik rengi ruhtan kendisi okudugu icin burada yapilacak
// tek is genel efekti yaratip cekilmek. Boylece mavi gecisler de digerleri
// gibi "ding" sesi ve mavi kalp parlamasi veriyor.
instance_create_depth(0,0,0,battle_soul_red_effect);
instance_destroy();
