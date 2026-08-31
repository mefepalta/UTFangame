// =====================================================================
//  ANA FAZ ARKA PLANI  (room_battle ve room_battle_1)
//
//  Eskiden iki odada da o_bg_gradient vardi: Faz 1'de tek, magenta
//  karisimli, hicbir seyi olmayan duz bir dip gecisi; Faz 2'de yandan
//  gelen iki renk dongulu huzme ve ortasi olu siyah. Ucu de kaldirildi.
//
//  Iki faz sadece renk olarak degil, YAPI olarak da ayri:
//
//   FAZ 1 - "gece gogu":  bulutsu, iki katmanli yildiz alani, sirayla
//           yanan TAKIMYILDIZLAR, arada gecen kayan yildiz, yagan kar,
//           kar ortulu koyu zemin.
//           Belgedeki Papyrus anisindan geliyor: "He'd prattle on about
//           all the names of stars he could remember. I think he called
//           them... constellations, or something like that."
//           Palet Faz 0.5'ten devam ediyor (mor / magenta #E20BB1).
//
//   FAZ 2 - "volkan":    dumanli gokyuzu, kaldera kizilligi, dalgalanan
//           lav nehri, on planda catlakli kaya sirti, lavdan firlayan
//           kivilcimlar, yagan kul, isi titresimi.
//           Palet Faz 1.5'ten devam ediyor (kor / turuncu #F96900).
//
//  Ikisi bilerek birbirinin karsiti: biri soguk/durgun/yukari bakan,
//  digeri sicak/siddetli/asagi bakan.
//
//  Sprite kullanmiyor, hepsi ciziliyor.
// =====================================================================

// Instances katmani 0, savas ogeleri negatif derinliklerde, arka plan
// katmani 100. Aradaki 60 bu zemini her seyin arkasina koyuyor.
depth = 60;

fire = (room == room_battle_1);

t      = 0;
alpha  = 1;      // Faz 2'nin son atagi arka plani karartiyor (sf_grad)
settle = 1;      // odaya girerken bir tik parlak baslayip yerine oturuyor

// ---------------------------------------------------------------------
//  Ortak ciziim yardimcilari
// ---------------------------------------------------------------------

/// Tam genislikte dikey renk gecisi
bg_vgrad = function(_y0, _y1, _c0, _a0, _c1, _a1) {
    if (_a0 <= 0.002 && _a1 <= 0.002) return;
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_colour(-40, _y0, _c0, _a0); draw_vertex_colour(680, _y0, _c0, _a0);
    draw_vertex_colour(-40, _y1, _c1, _a1); draw_vertex_colour(680, _y1, _c1, _a1);
    draw_primitive_end();
}

/// Yumusak radyal parlama
bg_glow = function(_x, _y, _r, _col, _a, _ys = 1) {
    if (_a <= 0.002 || _r <= 0) return;
    var _n = 28;
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(_x, _y, _col, _a);
    for (var i = 0; i <= _n; i++) {
        var _d = i * (360 / _n);
        draw_vertex_colour(_x + lengthdir_x(_r, _d), _y + lengthdir_y(_r, _d) * _ys, _col, 0);
    }
    draw_primitive_end();
}

if (!fire)
{
    // =================================================================
    //  FAZ 1 - gece gogu / takimyildizlar
    // =================================================================
    COL_NIGHT = make_colour_rgb( 20,  10,  44);   // derin gece indigosu
    COL_NEB   = make_colour_rgb(112,  32, 156);   // bulutsu moru
    COL_ACC   = make_colour_rgb(226,  11, 177);   // Faz 0.5/1 gozunun pembesi
    COL_STAR  = make_colour_rgb(234, 228, 255);   // soguk beyaz yildiz
    COL_SNOW  = make_colour_rgb(206, 216, 255);   // kar
    COL_GND   = make_colour_rgb( 30,  20,  62);   // kar ortulu koyu zemin

    GND_Y = 388;      // gogun zeminle bulustugu yukseklik

    // ---- yildiz alani: iki katman -> paralaks -------------------------
    star = [];
    repeat (110) {   // uzak: kucuk, sonuk, neredeyse hareketsiz
        array_push(star, {
            x: random(660) - 10, y: random(GND_Y - 6),
            sz: random_range(0.5, 1.1), a: random_range(0.20, 0.55),
            ph: random(6.28), fl: random_range(0.010, 0.030),
            hs: random_range(-0.012, 0.012), near: false
        });
    }
    repeat (26) {    // yakin: iri, parlak, biraz daha hizli kayan
        array_push(star, {
            x: random(660) - 10, y: random(GND_Y - 40),
            sz: random_range(1.3, 2.4), a: random_range(0.55, 1.00),
            ph: random(6.28), fl: random_range(0.020, 0.055),
            hs: random_range(-0.035, 0.035), near: true
        });
    }

    // ---- takimyildizlar: sirayla yanip sonen yildiz gruplari ----------
    // Papyrus'un Sans'a saydigi yildizlar. Uc grup, kaydirilmis fazlarla
    // birbiri ardina beliriyor.
    constel = [];
    var _anchors = [[118, 108], [498, 92], [312, 196]];
    for (var c = 0; c < 3; c++) {
        var _pts = [];
        var _ax  = _anchors[c][0], _ay = _anchors[c][1];
        var _n   = irandom_range(4, 6);
        for (var k = 0; k < _n; k++) {
            array_push(_pts, {x: _ax, y: _ay});
            _ax += random_range(-58, 58);
            _ay += random_range(-34, 40);
            _ay  = clamp(_ay, 34, 262);
            _ax  = clamp(_ax, 40, 600);
        }
        array_push(constel, {pts: _pts, ph: c * 2.09, spd: 0.0055});
    }

    // ---- bulutsu: kosegen boyunca dizilmis yumusak kutleler -----------
    nebula = [];
    repeat (3) {
        var _bx = random_range(60, 580), _by = random_range(40, 230);
        var _bd = random_range(-38, -12);           // kosegen yon
        var _pieces = [];
        repeat (5) {
            array_push(_pieces, {
                dx: 0, dy: 0, r: random_range(70, 150)
            });
        }
        for (var k = 0; k < 5; k++) {
            _pieces[k].dx = lengthdir_x(k * 62, _bd) + random_range(-16, 16);
            _pieces[k].dy = lengthdir_y(k * 62, _bd) + random_range(-14, 14);
        }
        array_push(nebula, {
            x: _bx, y: _by, pieces: _pieces,
            a: random_range(0.055, 0.105), hs: random_range(-0.045, 0.045),
            ph: random(6.28)
        });
    }

    // ---- yagan kar -----------------------------------------------------
    snow = [];
    repeat (44) {
        array_push(snow, {
            x: random(660) - 10, y: random(480),
            vs: random_range(0.20, 0.62), sw: random_range(0.5, 1.6),
            sz: random_range(0.8, 2.0), a: random_range(0.22, 0.62),
            ph: random(6.28), fl: random_range(0.014, 0.034)
        });
    }

    // ---- kayan yildizlar (Step icinde seyrek olarak dogar) -------------
    shoot = [];
}
else
{
    // =================================================================
    //  FAZ 2 - volkan / kaldera
    // =================================================================
    COL_SKY   = make_colour_rgb( 26,   9,   7);   // isiksiz duman
    COL_SMOKE = make_colour_rgb( 74,  36,  28);   // alttan aydinlanan duman
    COL_MID   = make_colour_rgb(150,  22,  10);   // kor kizili
    COL_ACC   = make_colour_rgb(249, 105,   0);   // Faz 2 gozunun turuncusu
    COL_HOT   = make_colour_rgb(255, 214, 130);   // beyaz-sicak lav
    COL_ROCK  = make_colour_rgb( 16,   7,   7);   // on plandaki kaya
    COL_ASH   = make_colour_rgb(120,  98,  92);   // kul

    LAVA_Y = 316;         // lav nehrinin merkez yuksekligi

    // ---- on plandaki kaya sirtinin profili ------------------------
    // Kenarlarda yuksek, ortada alcak: lav nehri ortadan gorunuyor,
    // iki yandan kaya kutleleri yukseliyor.
    RIDGE_N = 34;
    ridge = [];
    for (var i = 0; i <= RIDGE_N; i++) {
        var _u    = i / RIDGE_N;
        var _edge = 1 - sin(_u * pi);                       // kenarda 1, ortada 0
        var _h    = 96 + _edge * 78 + irandom_range(0, 26)  // sirt yuksekligi
                  + sin(_u * 17.0) * 9;                     // kucuk tirtiklar
        array_push(ridge, {x: -20 + _u * 680, y: 486 - _h});
    }

    // ---- kayadaki akkor catlaklar ---------------------------------
    // Sadece iki yandaki yuksek kaya kutlelerinde ve y 384'un uzerinde:
    // ortadaki savas kutusu / FIGHT-ACT-ITEM-MERCY satiri okunakli kalsin.
    /// Verilen x'te sirtin GERCEK tepe yuksekligi.
    /// Sirt ardisik ornek noktalari arasinda ucgen seridiyle ciziliyor,
    /// yani ust kenar tam olarak dogrusal ara deger. Once iki ornekten
    /// derin olani aliniyordu; guvenliydi ama dik yamaclarda 20 px'lik
    /// segmentte 30 px'e varan bir pay biraktigi icin damarla kenar
    /// arasinda gorunur bosluk olusuyordu.
    ridge_top_at = function(_x) {
        var _f = clamp((_x + 20) / 680 * RIDGE_N, 0, RIDGE_N);
        var _i = clamp(floor(_f), 0, RIDGE_N - 1);
        return lerp(ridge[_i].y, ridge[_i + 1].y, _f - _i);
    };

    // Onceki hali rastgele yon degistiren cizgilerdi; kendi uzerine kapanip
    // catlaktan cok "cizim" gibi duruyorlardi. Simdi her damar sirtin
    // tepesinden basliyor ve SADECE asagi iniyor, yatay kayma dikey
    // adimdan kucuk -> hicbir zaman geri donmuyor. Asagi indikce inceliyor:
    // kayanin icinden sizan erimis tas gibi duruyor.
    /// [_x-_r, _x+_r] araliginda sirtin EN ALCAK noktasi (en buyuk y).
    /// Bir sekil bu araligin tamamiyla kaya icinde kalacaksa, en dar yere
    /// (centik dibine) gore konumlanmali. Parlamanin/govdenin yatay
    /// yayilimini hesaba katmak icin gerekli: dik yamaclarda ve centiklerde
    /// sadece "o x'teki tepe" yetmiyor.
    /// Sirt parcali dogrusal oldugu icin bir aralikdaki en alcak nokta ya
    /// aralik uclarinda ya da aradaki kirilma noktalarindadir; ikisine de
    /// bakiyoruz. Ornekleyerek taramaya gerek yok, sonuc TAM.
    ridge_top_span = function(_x, _r) {
        var _a = _x - _r, _b = _x + _r;
        var _t = max(ridge_top_at(_a), ridge_top_at(_b));
        var _i0 = clamp(ceil( (_a + 20) / 680 * RIDGE_N), 0, RIDGE_N);
        var _i1 = clamp(floor((_b + 20) / 680 * RIDGE_N), 0, RIDGE_N);
        for (var i = _i0; i <= _i1; i++) { _t = max(_t, ridge[i].y); }
        return _t;
    };

    // Damarlar sirtin TAM tepesinden basliyor (bosluk yok). Kayanin icinde
    // kalmayi noktayi asagi iterek degil, o noktadaki SEKLI daraltarak
    // sagliyoruz: govde yari genisligi ve parlama yaricapi, her nokta icin
    // sabit sirt profilinden hesaplanip sigacak kadar kuculuyor. Tepede
    // dogal olarak sifira yaklasiyor, iceri girdikce aciliyor.
    crack = [];
    repeat (5) {
        var _cx = (choose(0, 1) == 0) ? random_range(40, 185) : random_range(455, 600);
        var _cy = ridge_top_at(_cx);
        var _n  = irandom_range(4, 6);
        var _pts = [];
        for (var k = 0; k < _n; k++) {
            _cy = max(_cy, ridge_top_at(_cx));                // kayanin uzerinde
            if (_cy > 372) break;                             // UI'in uzerinde kal
            array_push(_pts, {x: _cx, y: _cy, hw: 0, gr: 0});
            _cx += random_range(-7, 7);                       // dikey adimdan kucuk
            _cy += random_range(9, 15);
        }

        var _np = array_length(_pts);
        if (_np < 2) continue;

        for (var k = 0; k < _np; k++) {
            var _q  = k / (_np - 1);
            var _px = _pts[k].x, _py = _pts[k].y;

            // Govde: istenen profil, sigmazsa daraliyor
            var _hw = 3.2 * (1 - _q * 0.7) + 0.5;
            while (_hw > 0 && _py < ridge_top_span(_px, _hw)) { _hw -= 0.3; }
            _pts[k].hw = max(_hw, 0);

            // Parlama: dairenin tepesi (_py - r) araliktaki en alcak sirt
            // noktasinin altinda kalmali
            var _gr = 24 * (1 - _q * 0.35);
            while (_gr > 3 && (_py - ridge_top_span(_px, _gr)) < _gr) { _gr -= 3; }
            _pts[k].gr = (_gr > 3) ? _gr : 0;
        }

        array_push(crack, {pts: _pts, ph: random(6.28), spd: random_range(0.012, 0.03)});
    }

    // ---- duman kumeleri: ustte yatay suzuluyor --------------------
    smoke = [];
    repeat (7) {
        array_push(smoke, {
            x: random(760) - 60, y: random_range(-30, 170),
            r: random_range(90, 210), vs: random_range(-0.16, 0.16),
            hs: random_range(0.10, 0.42) * choose(-1, 1),
            a: random_range(0.20, 0.46), ph: random(6.28)
        });
    }

    // ---- lavdan firlayan kivilcimlar (yukari) ---------------------
    spark = [];

    // ---- yagan kul (asagi) ----------------------------------------
    ash = [];
    repeat (34) {
        array_push(ash, {
            x: random(640), y: random(480),
            vs: random_range(0.18, 0.75), hs: random_range(-0.30, 0.30),
            sz: random_range(0.7, 2.0), a: random_range(0.10, 0.34),
            ph: random(6.28), fl: random_range(0.02, 0.06)
        });
    }

    /// Tirtikli siluet: profil boyunca ekranin altina kadar dolduruyor
    bg_ridge = function(_pts, _dy, _col, _a) {
        draw_primitive_begin(pr_trianglestrip);
        for (var i = 0; i < array_length(_pts); i++) {
            draw_vertex_colour(_pts[i].x, _pts[i].y + _dy, _col, _a);
            draw_vertex_colour(_pts[i].x, 486,             _col, _a);
        }
        draw_primitive_end();
    };
}
