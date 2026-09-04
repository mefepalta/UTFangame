_t++;

switch (kind)
{
	//==================================================================
	// SPEAR_THRUST -- spear4.lua / spear5.lua
	//==================================================================
	// Mod: "firing" 60 kare geri sayiyor. O sirada mizrak gidis yonunde
	// 0.3 px/kare kayiyor (spear4'te ust sinirla) ve spear4'te alpha
	// 0.05/kare artiyor -- spear5'te alfa animasyonu YOK, mizrak bastan
	// opak. Sayac bitince 'pierce' calip hizlaniyor.
	case 0:
		if (!_fired)
		{
			if (fade_in > 0)
			{
				image_alpha = min(1,image_alpha+fade_in);
			}
			else
			{
				image_alpha = 1;
			}

			// Kayma toplam drift_max'i asmiyor (spear4'teki math.min siniri)
			if (drift_max <= 0) or (_t*drift <= drift_max)
			{
				x += lengthdir_x(drift,dir);
				y += lengthdir_y(drift,dir);
			}

			if (_t >= warn_time)
			{
				_fired = true;
				SpearSound(snd_spear_pierce);
			}
		}
		else
		{
			// Mod: sancidiktan sonra sabit hizla gidiyor, belli bir noktada
			// spear4 DURUP soner, spear5 sonerken yoluna devam eder.
			if (_gone < run_len) or (!run_stop)
			{
				x += lengthdir_x(spd,dir);
				y += lengthdir_y(spd,dir);
				_gone += spd;
			}

			if (_gone >= run_len)
			{
				image_alpha -= fade_out;
				if (image_alpha <= 0) { instance_destroy(); exit; }
			}
		}
	break;

	//==================================================================
	// SPEAR_SPIRAL -- spear2.lua
	//==================================================================
	// Mod: aci her kare rad kadar ilerliyor; rad 2.35'ten baslayip ticker
	// ile 1'e kadar soniyor. Yaricap her kare 1.2 azaliyor, yani halka
	// donerken ICE KAPANIYOR. Yaricap sifira inince mizrak soniyor.
	// Mizrak hep merkeze bakiyor.
	case 1:
		_ticker += ang_tick;
		var _step = max(ang_floor,ang_step-_ticker);
		ang += _step*orb_dir;

		if (orb_rad > 0)
		{
			image_alpha = min(1,image_alpha+fade_in);
			orb_rad -= orb_shrink;
			x = orb_x+lengthdir_x(orb_rad,ang);
			y = orb_y+lengthdir_y(orb_rad,ang);
			dir = ang+180;			// ucu merkeze donuk
		}
		else
		{
			image_alpha -= fade_out;
			if (image_alpha <= 0) { instance_destroy(); exit; }
		}
	break;

	//==================================================================
	// SPEAR_DIVE -- spear0.lua
	//==================================================================
	// Mod: mermi cok uzakta doguyor ve lifetime negatif basliyor; sifira
	// gelene kadar kimildamiyor, sonra sabit hizla kalbin uzerine geliyor.
	// Belli bir lifetime'da sonmeye basliyor, biraz sonra siliniyor.
	case 2:
		image_alpha = min(1,image_alpha+fade_in);

		// spear1: lifetime negatifken mizrak kendi ekseninde donuyor.
		// 30 kare x 9.3 = 279 derece; baslangic acisi gidis yonunun 90
		// derece disinda oldugu icin donus bitiminde neredeyse tam yola
		// hizalaniyor. Moddaki gorunum bu.
		if (spin != 0) and (dive_life < 0)
		{
			image_angle += spin;
		}

		dive_life += dive_step;

		if (dive_life >= 0)
		{
			x += lengthdir_x(spd,dir);
			y += lengthdir_y(spd,dir);
		}
		if (dive_life > dive_fade)
		{
			image_alpha -= fade_out;
		}
		if (dive_life > dive_kill)
		{
			instance_destroy();
			exit;
		}
	break;

	//==================================================================
	// SPEAR_AIM -- spear3.lua
	//==================================================================
	// Mod: mizrak arenanin disinda rastgele bir kosede doguyor, sprite
	// once hedefin 180 derece TERSINE bakiyor ve her kare (hedef-simdiki)/10
	// kadar donerek kalbe yoneliyor. Bu sirada alfa 0.05/kare artiyor ve
	// mizrak KIMILDAMIYOR. Alfa 1 olunca hizlanarak gidiyor: vel her kare
	// 0.125 artiyor, adim = birimyon*4*vel/5. Yon dogus aninda kilitli.
	case 3:
		// Aci yumusak gecisle hedefe yaklasiyor (ham sayi, sarma yok)
		if (abs(aim_to-aim_now) > 3)
		{
			aim_now += (aim_to-aim_now)/aim_ease;
		}
		image_angle = aim_now;

		if (image_alpha >= 1)
		{
			aim_vel += aim_acc;
			x += aim_sx*aim_vel/5;		// mod: xspeed*velx/5
			y += aim_sy*aim_vel/5;
		}
		else
		{
			image_alpha = min(1,image_alpha+fade_in);
		}

		if (_t == aim_toss) { SpearSound(snd_spear_toss); }

		// Arenanin cok disina cikinca sonerken yoluna devam ediyor
		if (abs(x-battle_board.x) > aim_out) or (abs(y-battle_board.y) > aim_out)
		{
			image_alpha -= fade_out;
			x += aim_sx*aim_vel/5;
			y += aim_sy*aim_vel/5;
			if (image_alpha <= 0) { instance_destroy(); exit; }
		}
	break;
}

// free_angle acikken aci disaridan yonetiliyor (bkz. spear1).
if (!free_angle) and (kind != 3)
{
	image_angle = dir-90;
}

// Sizinti onlemi (modda karsiligi yok). Sinirlar GENIS olmak zorunda:
// spear0 mizraklari kalbin 750 px (hardspear0'da 770) uzaginda doguyor ve
// kalp buyuk arenanin kenarinda olabiliyor, yani dogus noktasi 1372 px'e
// kadar cikabiliyor. Once sinir 1040/880 idi ve dort ana yondeki salvolar
// dogduklari karede siliniyordu; aci her salvoda 45 derece kaydigi icin
// bir salvo gorunup bir sonraki yok oluyor, pattern rastgele duruyordu.
if (x < -850) or (x > 1500) or (y < -750) or (y > 1350)
{
	instance_destroy();
}
