if (alpha <= 0.002) exit;

var _tt   = t * 0.01;
var _puls = 1 + sin(_tt * 2.1) * 0.06;
var _A    = alpha * (1 + settle * 0.45);      // odaya girerken fazladan isik

if (!fire)
{
// =====================================================================
//  FAZ 1 - GECE GOGU / TAKIMYILDIZLAR
//  gece gecisi -> bulutsu -> yildizlar -> takimyildizlar ->
//  kayan yildiz -> kar -> zemin -> vinyet
// =====================================================================

	// ---- gece: tepede en koyu, ufka dogru hafifce moraran gok ---------
	bg_vgrad(    0,   150, COL_NIGHT, 0.92 * _A, COL_NIGHT, 0.80 * _A);
	bg_vgrad(  150,   290, COL_NIGHT, 0.80 * _A, COL_NEB,   0.26 * _A);
	bg_vgrad(  290, GND_Y, COL_NEB,   0.26 * _A, COL_ACC,   0.16 * _A);

	gpu_set_blendmode(bm_add);

	// ---- bulutsu: kosegen boyunca dizilmis yumusak kutleler ------------
	for (var i = 0; i < array_length(nebula); i++) {
	    var _nb = nebula[i];
	    for (var k = 0; k < array_length(_nb.pieces); k++) {
	        var _pc = _nb.pieces[k];
	        var _rr = _pc.r * (1 + sin(_nb.ph + k) * 0.09);
	        bg_glow(_nb.x + _pc.dx, _nb.y + _pc.dy, _rr, COL_NEB, _nb.a * _A, 0.66);
	        bg_glow(_nb.x + _pc.dx, _nb.y + _pc.dy, _rr * 0.45, COL_ACC, _nb.a * 0.55 * _A, 0.60);
	    }
	}

	// ---- yildiz alani ---------------------------------------------------
	for (var i = 0; i < array_length(star); i++) {
	    var _s  = star[i];
	    var _tw = 0.45 + 0.55 * (0.5 + 0.5 * sin(_s.ph));      // yanip sonme
	    draw_set_alpha(_s.a * _tw * _A);
	    draw_set_colour(COL_STAR);
	    var _r = _s.sz * (0.8 + _tw * 0.4);
	    draw_rectangle(_s.x - _r, _s.y - _r, _s.x + _r, _s.y + _r, false);
	    // Yakin katmandaki iri yildizlar dort kollu bir parilti veriyor
	    if (_s.near && _tw > 0.75) {
	        var _fl = _s.sz * 3.4 * _tw;
	        draw_set_alpha(_s.a * (_tw - 0.75) * 2.2 * _A);
	        draw_rectangle(_s.x - _fl, _s.y - 0.5, _s.x + _fl, _s.y + 0.5, false);
	        draw_rectangle(_s.x - 0.5, _s.y - _fl, _s.x + 0.5, _s.y + _fl, false);
	    }
	}

	// ---- takimyildizlar: sirayla beliren cizgiler ------------------------
	// Papyrus'un saydigi yildizlar; her grup sirayla yanip sonuyor.
	for (var i = 0; i < array_length(constel); i++) {
	    var _c  = constel[i];
	    var _w  = 0.5 + 0.5 * sin(t * _c.spd + _c.ph);
	    var _ca = _w * _w * _A;
	    if (_ca <= 0.01) continue;
	    // baglanti cizgileri
	    draw_set_alpha(_ca * 0.30);
	    draw_set_colour(COL_ACC);
	    for (var k = 0; k < array_length(_c.pts) - 1; k++) {
	        draw_line_width(_c.pts[k].x, _c.pts[k].y, _c.pts[k+1].x, _c.pts[k+1].y, 1);
	    }
	    // dugum yildizlari
	    for (var k = 0; k < array_length(_c.pts); k++) {
	        bg_glow(_c.pts[k].x, _c.pts[k].y, 13, COL_ACC, _ca * 0.55);
	        draw_set_alpha(_ca * 0.95);
	        draw_set_colour(COL_STAR);
	        draw_rectangle(_c.pts[k].x - 1.6, _c.pts[k].y - 1.6,
	                       _c.pts[k].x + 1.6, _c.pts[k].y + 1.6, false);
	    }
	}

	// ---- kayan yildiz ----------------------------------------------------
	for (var i = 0; i < array_length(shoot); i++) {
	    var _sh = shoot[i];
	    var _f  = _sh.life / _sh.maxlife;
	    var _n2 = 10;
	    for (var k = 0; k < _n2; k++) {
	        var _q = k / _n2;
	        draw_set_alpha(_f * (1 - _q) * 0.8 * _A);
	        draw_set_colour(_q < 0.35 ? COL_STAR : COL_ACC);
	        var _sx2 = _sh.x - _sh.hs * k * 1.5;
	        var _sy2 = _sh.y - _sh.vs * k * 1.5;
	        var _rr2 = 2.0 * (1 - _q);
	        draw_rectangle(_sx2 - _rr2, _sy2 - _rr2, _sx2 + _rr2, _sy2 + _rr2, false);
	    }
	}

	// ---- ufuk: karin uzerinde yildiz isiginin toplandigi ince bant -------
	bg_glow(320, GND_Y, 330 * _puls, COL_NEB, 0.16 * _A, 0.16);
	draw_set_colour(COL_SNOW);
	draw_set_alpha(0.13 * _A);
	draw_rectangle(0, GND_Y - 1, 640, GND_Y, false);

	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);

	// ---- kar ortulu zemin: ufuktan asagi karariyor ------------------------
	bg_vgrad(GND_Y, 482, COL_GND, 0.75 * alpha, COL_NIGHT, 0.95 * alpha);

	// ---- yagan kar --------------------------------------------------------
	draw_set_colour(COL_SNOW);
	for (var i = 0; i < array_length(snow); i++) {
	    var _f2 = snow[i];
	    draw_set_alpha(_f2.a * (0.6 + 0.4 * sin(_f2.ph)) * alpha);
	    draw_rectangle(_f2.x - _f2.sz, _f2.y - _f2.sz, _f2.x + _f2.sz, _f2.y + _f2.sz, false);
	}

	// ---- vinyet: gogun kenarlari kararsin ---------------------------------
	var _vv = 0.34 * alpha;
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex_colour(0,   0, COL_NIGHT, _vv); draw_vertex_colour(0,   482, COL_NIGHT, _vv);
	draw_vertex_colour(110, 0, COL_NIGHT, 0);   draw_vertex_colour(110, 482, COL_NIGHT, 0);
	draw_primitive_end();
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex_colour(530, 0, COL_NIGHT, 0);   draw_vertex_colour(530, 482, COL_NIGHT, 0);
	draw_vertex_colour(640, 0, COL_NIGHT, _vv); draw_vertex_colour(640, 482, COL_NIGHT, _vv);
	draw_primitive_end();
}
else
{
// =====================================================================
//  FAZ 2 - VOLKAN
//  dumanli gok -> duman kumeleri -> kaldera kizilligi -> lav nehri ->
//  kaya sirti -> akkor catlaklar -> kivilcim -> kul -> isi titresimi
// =====================================================================
	var _beat = 0.5 + 0.5 * sin(_tt * 1.6);        // kalderanin nabzi

	// ---- gokyuzu -------------------------------------------------------
	// Tepe tam siyah degil, sicak-koyu bir pus: boylece uzerine cizilen
	// koyu duman kutleleri gercekten "koyu" olarak okunabiliyor.
	bg_vgrad(  0, 120, COL_SMOKE, 0.30 * _A, COL_SMOKE, 0.38 * _A);
	bg_vgrad(120, 240, COL_SMOKE, 0.38 * _A, COL_MID,   0.30 * _A);
	bg_vgrad(240, LAVA_Y, COL_MID, 0.30 * _A, COL_ACC,  0.34 * _A);

	// ---- duman kumeleri: alttan aydinlanan koyu kutleler ---------------
	for (var i = 0; i < array_length(smoke); i++) {
	    var _s = smoke[i];
	    var _r = _s.r * (1 + sin(_s.ph) * 0.10);
	    // koyu govde: pusun uzerine cizilince kutle olarak beliriyor
	    bg_glow(_s.x, _s.y - _r * 0.14, _r, COL_SKY, _s.a * 0.85 * _A, 0.50);
	}
	gpu_set_blendmode(bm_add);
	for (var i = 0; i < array_length(smoke); i++) {
	    // alt kenarinda lavdan gelen isik -> kabaran duman hissi
	    var _s = smoke[i];
	    var _r = _s.r * (1 + sin(_s.ph) * 0.10);
	    bg_glow(_s.x, _s.y + _r * 0.26, _r * 0.66, COL_SMOKE, _s.a * 0.75 * _A, 0.32);
	    bg_glow(_s.x, _s.y + _r * 0.34, _r * 0.32, COL_MID,   _s.a * 0.30 * _A, 0.26);
	}

	// ---- kaldera kizilligi: lav nehrinden yayilan genis isik -----------
	bg_glow(320, LAVA_Y, 430 * _puls, COL_MID, (0.26 + 0.08 * _beat) * _A, 0.62);
	bg_glow(320, LAVA_Y, 240 * _puls, COL_ACC, (0.20 + 0.09 * _beat) * _A, 0.46);

	// ---- lav nehri: ust kenari dalgalanan akkor bant -------------------
	// Ust kenar sinuslerle kivriliyor, alt kenar duz: eriyip akan bir
	// nehir gibi duruyor, duz bir bant gibi degil.
	// Parlaklik x boyunca da dalgalaniyor: bazi yerler kabuk baglamis gibi
	// sonuk, bazi yerler akkor. Duz bir bant gibi durmasin.
	var _n = 44;
	draw_primitive_begin(pr_trianglestrip);
	for (var i = 0; i <= _n; i++) {
	    var _u  = i / _n;
	    var _x  = -20 + _u * 680;
	    var _wy = LAVA_Y - 20 + sin(_tt * 1.1 + _u * 11.0) * 9 + sin(_tt * 0.7 + _u * 4.3) * 6;
	    var _la = (0.50 + 0.34 * (0.5 + 0.5 * sin(_tt * 0.9 + _u * 7.2)) + 0.12 * _beat) * _A;
	    draw_vertex_colour(_x, _wy,         COL_ACC, 0);
	    draw_vertex_colour(_x, LAVA_Y + 10, COL_HOT, _la);
	}
	draw_primitive_end();
	draw_primitive_begin(pr_trianglestrip);
	for (var i = 0; i <= _n; i++) {
	    var _u  = i / _n;
	    var _x  = -20 + _u * 680;
	    var _la = (0.50 + 0.34 * (0.5 + 0.5 * sin(_tt * 0.9 + _u * 7.2)) + 0.12 * _beat) * _A;
	    draw_vertex_colour(_x, LAVA_Y + 10, COL_HOT, _la);
	    draw_vertex_colour(_x, LAVA_Y + 62, COL_ACC, 0);
	}
	draw_primitive_end();

	gpu_set_blendmode(bm_normal);

	// ---- on plandaki kaya sirti ---------------------------------------
	// Kenarlarda yuksek, ortada alcak; lav nehri ortadan gorunuyor.
	bg_ridge(ridge, 0, COL_ROCK, 0.97 * min(alpha * 1.6, 1));

	gpu_set_blendmode(bm_add);

	// ---- sirtin tepesinde lavdan gelen ince akkor kenar ---------------
	draw_primitive_begin(pr_trianglestrip);
	for (var i = 0; i < array_length(ridge); i++) {
	    draw_vertex_colour(ridge[i].x, ridge[i].y - 5, COL_ACC, 0);
	    draw_vertex_colour(ridge[i].x, ridge[i].y + 2, COL_ACC, (0.34 + 0.10 * _beat) * _A);
	}
	draw_primitive_end();

	// ---- kayadaki akkor catlaklar -------------------------------------
	// Her damar tepede genis, asagi indikce sivriliyor; cizgi degil,
	// kayadan sizan erimis tas gibi. Cevresine de isi yayiliyor.
	for (var i = 0; i < array_length(crack); i++) {
	    var _c  = crack[i];
	    var _np = array_length(_c.pts);
	    var _ca = (0.26 + 0.18 * sin(t * _c.spd + _c.ph)) * _A;
	    if (_ca <= 0.004) continue;

	    // Genislikler ve parlama yaricaplari Create'te, sabit sirt
	    // profilinden hesaplandi (pts[k].hw / pts[k].gr): kayanin ince
	    // oldugu yerde kendiliginden kuculuyorlar, o yuzden burada hicbir
	    // kirpma yok ve hicbir kosulda siluetin disina tasmiyorlar.
	    for (var k = 0; k < _np; k++) {
	        var _q = k / max(_np - 1, 1);
	        if (_c.pts[k].gr > 2) {
	            bg_glow(_c.pts[k].x, _c.pts[k].y, _c.pts[k].gr, COL_MID, _ca * 0.38 * (1 - _q * 0.5));
	        }
	    }

	    // govde: tepede sirta yapisip sifira yaklasiyor, iceri girdikce aciliyor
	    draw_primitive_begin(pr_trianglestrip);
	    for (var k = 0; k < _np; k++) {
	        var _q  = k / max(_np - 1, 1);
	        var _w  = _c.pts[k].hw;
	        var _aa = _ca * (1 - _q * 0.75);
	        draw_vertex_colour(_c.pts[k].x - _w, _c.pts[k].y, COL_ACC, _aa);
	        draw_vertex_colour(_c.pts[k].x + _w, _c.pts[k].y, COL_ACC, _aa);
	    }
	    draw_primitive_end();

	    // akkor cekirdek (govdenin icinde kaliyor)
	    draw_primitive_begin(pr_trianglestrip);
	    for (var k = 0; k < _np; k++) {
	        var _q  = k / max(_np - 1, 1);
	        var _w  = min(1.1 * (1 - _q), _c.pts[k].hw * 0.45);
	        var _aa = _ca * 0.85 * (1 - _q);
	        draw_vertex_colour(_c.pts[k].x - _w, _c.pts[k].y, COL_HOT, _aa);
	        draw_vertex_colour(_c.pts[k].x + _w, _c.pts[k].y, COL_HOT, _aa);
	    }
	    draw_primitive_end();
	}

	// ---- lavdan firlayan kivilcimlar ----------------------------------
	for (var i = 0; i < array_length(spark); i++) {
	    var _k = spark[i];
	    var _f = _k.life / _k.maxlife;
	    draw_set_alpha(_f * _A);
	    draw_set_colour(_f > 0.6 ? COL_HOT : COL_ACC);
	    draw_rectangle(_k.x - _k.sz, _k.y - _k.sz, _k.x + _k.sz, _k.y + _k.sz, false);
	}

	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);

	// ---- yagan kul ------------------------------------------------------
	draw_set_colour(COL_ASH);
	for (var i = 0; i < array_length(ash); i++) {
	    var _a2 = ash[i];
	    draw_set_alpha(_a2.a * (0.55 + 0.45 * sin(_a2.ph)) * alpha);
	    draw_rectangle(_a2.x - _a2.sz, _a2.y - _a2.sz, _a2.x + _a2.sz, _a2.y + _a2.sz, false);
	}

	// ---- isi titresimi ---------------------------------------------------
	// Lavin hemen ustunde alfasi dalgalanan yatay bantlar; Faz 1'in duz
	// tarama cizgilerinin aksine burada hava kayniyor gibi duruyor.
	gpu_set_blendmode(bm_add);
	draw_set_colour(COL_ACC);
	for (var i = 0; i < 16; i++) {
	    var _hy = LAVA_Y - 8 - i * 11;
	    var _ha = 0.055 * (1 - i / 16) * (0.4 + 0.6 * sin(_tt * 2.4 - i * 0.9)) * _A;
	    if (_ha > 0.002) {
	        draw_set_alpha(_ha);
	        draw_rectangle(0, _hy, 640, _hy + 3, false);
	    }
	}
	gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);
draw_set_colour(c_white);
