t += 1;

// Girişteki fazladan parlaklik ~2 saniyede yerine oturuyor
settle = max(settle - 0.008, 0);

// Faz 2'nin son atagi (battle_turn_20) arka plani karartiyor. Eskiden bunu
// o_bg_gradient'in image_alpha'sindan yapiyordu; o kaldirildigi icin ayni
// degeri buradan takip ediyoruz, boylece atak kodu degismeden calisiyor.
// (Atak nesnesi yok olunca deger 1'e geri DONMEMELI; eskiden de
//  o_bg_gradient'in image_alpha'si son degerinde kaliyordu.)
if (instance_exists(battle_turn_20)) {
    alpha = battle_turn_20.sf_grad;
}

if (!fire)
{
    // ---- FAZ 1: yildizlar, bulutsu, kar, kayan yildiz -----------------

    // Yildizlar cok yavas kayiyor ve yanip sonuyor
    for (var i = 0; i < array_length(star); i++) {
        var _s = star[i];
        _s.x  += _s.hs;
        _s.ph += _s.fl;
        if (_s.x < -12) _s.x = 652; else if (_s.x > 652) _s.x = -12;
    }

    // Bulutsu kutleleri yatay suzuluyor
    for (var i = 0; i < array_length(nebula); i++) {
        var _nb = nebula[i];
        _nb.x  += _nb.hs;
        _nb.ph += 0.004;
        if (_nb.x < -220) _nb.x = 860; else if (_nb.x > 860) _nb.x = -220;
    }

    // Kar yagiyor, ruzgarla sagi solu yaliyor
    for (var i = 0; i < array_length(snow); i++) {
        var _f = snow[i];
        _f.y  += _f.vs;
        _f.x  += sin(_f.ph) * _f.sw;
        _f.ph += _f.fl;
        if (_f.y > 492) { _f.y = -10; _f.x = random(660) - 10; }
        if (_f.x < -12) _f.x = 652; else if (_f.x > 652) _f.x = -12;
    }

    // Seyrek kayan yildiz (~7 saniyede bir)
    if (irandom(420) == 0) {
        var _dir = choose(-1, 1);
        array_push(shoot, {
            x: (_dir > 0) ? random_range(-60, 200) : random_range(440, 700),
            y: random_range(20, 150),
            hs: _dir * random_range(6.0, 9.5),
            vs: random_range(1.6, 3.2),
            life: 46, maxlife: 46
        });
    }
    for (var i = array_length(shoot) - 1; i >= 0; i--) {
        var _sh = shoot[i];
        _sh.life--;
        _sh.x += _sh.hs;
        _sh.y += _sh.vs;
        if (_sh.life <= 0 || _sh.y > GND_Y) array_delete(shoot, i, 1);
    }
}
else
{
    // ---- FAZ 2: duman, kivilcim, kul ----------------------------------

    // Duman kumeleri yatay suzuluyor, kenardan cikinca karsi taraftan giriyor
    for (var i = 0; i < array_length(smoke); i++) {
        var _s = smoke[i];
        _s.x  += _s.hs;
        _s.y  += _s.vs * 0.25 + sin(_s.ph) * 0.10;
        _s.ph += 0.008;
        if (_s.x < -260) _s.x = 900; else if (_s.x > 900) _s.x = -260;
        if (_s.y < -60)  _s.y = 180; else if (_s.y > 190) _s.y = -50;
    }

    // Lav nehrinden duzensiz araliklarla kivilcim firliyor
    if (irandom(5) == 0) {
        array_push(spark, {
            x: random_range(120, 520),
            y: LAVA_Y + random_range(-8, 8),
            hs: random_range(-0.9, 0.9),
            vs: -random_range(1.6, 4.2),
            life: irandom_range(38, 90), maxlife: 90,
            sz: random_range(1.0, 2.4)
        });
    }
    // Arada bir daha buyuk bir puskurme (~4 saniyede bir)
    if (irandom(240) == 0) {
        var _bx = random_range(140, 500);
        repeat (irandom_range(10, 18)) {
            array_push(spark, {
                x: _bx + random_range(-22, 22),
                y: LAVA_Y + random_range(-6, 6),
                hs: random_range(-1.9, 1.9),
                vs: -random_range(3.0, 6.4),
                life: irandom_range(60, 120), maxlife: 120,
                sz: random_range(1.2, 3.0)
            });
        }
    }
    for (var i = array_length(spark) - 1; i >= 0; i--) {
        var _k = spark[i];
        _k.life--;
        _k.x  += _k.hs;
        _k.y  += _k.vs;
        _k.vs += 0.035;          // yavaslayip geri dusuyor
        _k.hs *= 0.995;
        if (_k.life <= 0 || _k.y > 500) array_delete(spark, i, 1);
    }

    // Kul yagiyor (Faz 1'in yukselen zerreciklerinin tam tersi)
    for (var i = 0; i < array_length(ash); i++) {
        var _a = ash[i];
        _a.y  += _a.vs;
        _a.x  += _a.hs + sin(_a.ph) * 0.35;
        _a.ph += _a.fl;
        if (_a.y > 492) { _a.y = -10; _a.x = random(640); }
        if (_a.x < -10) _a.x = 650; else if (_a.x > 650) _a.x = -10;
    }
}
